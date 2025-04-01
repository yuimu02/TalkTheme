//
//  ViewModel.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/03/27.
//

import Foundation
import Firebase

class ViewModel: NSObject, ObservableObject{
    @Published var name = ""
    @Published var theme = ""
    @Published var password = ""
    @Published var presentMembers = false
    @Published var presentTheme = false
    @Published var presentWaiting = false
    @Published var presentselecting = false
    @Published var isSelectedUser = false
    
    @Published var room: Room = Room(passcode: "", status: .waiting, selectedUser: "", selectedTopic: "", members: [], selectedMembers: [], topics: [])
    
    func searchRoom() {
        Task { @MainActor in
            try! await searchRoom(passcode: password)
            presentMembers = true
        }
    }
    
    
    private let roomsRef = Firestore.firestore().collection("rooms")


    func searchRoom(passcode: String) async throws {
        let room = try await roomsRef.whereField("passcode", isEqualTo: passcode).getDocuments().documents.compactMap { try? $0.data(as: Room.self) }.first
        if let room {
            listenRoomData(roomId: room.id!) //部屋があるとき
        } else {
            //ないとき
            let newRoom = Room(passcode: passcode, status: .waiting, selectedUser: "", selectedTopic: "", members: [], selectedMembers: [], topics: [])
            let encodedRoom = try Firestore.Encoder().encode(newRoom)
            let newRoomRef = try await roomsRef.addDocument(data: encodedRoom)
            listenRoomData(roomId: newRoomRef.documentID)
        }
    }
    
    func listenRoomData(roomId: String) {
        let name:String = UserDefaultsKey[.name] ?? ""
        roomsRef.document(roomId).updateData([
            "members": FieldValue.arrayUnion([name])
        ])
        roomsRef.document(roomId).addSnapshotListener { snapshot,error in
            guard let snapshot else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let newRoomData = try snapshot.data(as: Room.self)
                switch newRoomData.status {
                case .waiting:
                    if self.room.status == .selecting {
                        self.presentselecting = false
                        self.presentTheme = false
                    }
                case .inputing:
                    self.presentTheme = true
                case .selecting:
                    self.presentselecting = true
                    self.startSelecting()
                case .selected:
                    self.isSelectedUser = newRoomData.selectedUser == self.name
                case .finished:
                    self.password = ""
                    self.presentMembers = false
                    self.presentTheme = false
                    self.presentWaiting = false
                    self.presentWaiting = false
                default:
                    break
                }
                self.room = newRoomData
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func changeRoomStatus(status: Status) {
        roomsRef.document(room.id ?? "").updateData([
            "status": status.rawValue
        ])
    }
    
    func postTopic() {
        roomsRef.document(room.id ?? "").updateData([
            "topics": FieldValue.arrayUnion([theme])
        ])
        presentWaiting = true
    }
    func selectTopic() {
        let selectedTopic = room.topics.randomElement()!
        let selectedUser = room.members.filter({ room.selectedMembers.contains($0) == false }).randomElement()!
        roomsRef.document(room.id ?? "").updateData([
            "selectedTopic": selectedTopic,
            "selectedUser": selectedUser,
            "topics": FieldValue.arrayRemove([selectedTopic]),
            "selectedMembers": FieldValue.arrayUnion([selectedUser])
        ])
    }
    
    var selectTimer: Timer!
    
    func startSelecting() {
        isSelectedUser = false
        var loopCount = 0
        var selectIndex = 0
        selectTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats:true) { _ in
            if selectIndex < self.room.members.count - 1 {
                selectIndex += 1
            }
            else {
                selectIndex = 0
            }
            self.isSelectedUser = self.room.members.firstIndex(of: self.name)!
            == selectIndex
            loopCount += 1
            if loopCount > self.room.members.count * 3 && selectIndex ==
                self.room.members.firstIndex(of: self.room.selectedUser)! {
                self.selectTimer.invalidate()
                self.changeRoomStatus(status: .selected)
            }
        }
    }
    
    func updateMembers() {

        roomsRef.document(room.id ?? "").updateData([
            "members": room.members
        ])
    }
    

    func resetRoom() {
        roomsRef.document(room.id ?? "").updateData([
            "selectedTopic": "",
            "selectedUser": "",
            "topics": [],
            "selectedMembers": []
        ])
    }
}
