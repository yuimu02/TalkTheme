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
    @Published var presentTheme = false
    @Published var selectedTheme = ""
    @Published var selectedPlayer = ""
    @Published var room: Room = Room(passcode: "", status: .waiting, selectedUserid: "", selectedTopicid: "", members: [], topics: [])
    
    func searchRoom() {
        Task {
            try! await searchRoom(passcode: password)
            presentTheme = true
        }
    }
    
    
    // MARK: Firestore
    private let roomsRef = Firestore.firestore().collection("rooms")
    
    private func searchRoom(passcode: String) async throws {
        let room = try await roomsRef.whereField("passcode", isEqualTo: passcode).getDocuments().documents.compactMap { try? $0.data(as: Room.self) }.first
        if let room {
            listenRoomData(roomId: room.id!) //部屋があるとき
        } else {
            //ないとき
            let newRoom = Room(passcode: passcode, status: .waiting, selectedUserid: "", selectedTopicid: "", members: [], topics: [])
            let encodedRoom = try Firestore.Encoder().encode(newRoom)
            let newRoomRef = try await roomsRef.addDocument(data: encodedRoom)
            listenRoomData(roomId: newRoomRef.documentID)
        }
    }
    
    private func listenRoomData(roomId: String) {
        roomsRef.document(roomId).addSnapshotListener { snapshot,error in
            guard let snapshot else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                self.room = try snapshot.data(as: Room.self)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
