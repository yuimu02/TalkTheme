//
//  FirestoreClient.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/02/19.
//

import Foundation
import FirebaseFirestore

class FirestoreClient: ObservableObject {
    private let roomsRef = Firestore.firestore().collection("rooms")
    @Published var room: Room = Room(passcode: "", status: .waiting, selectedUserid: "", selectedTopicid: "", members: [], topics: [])
    
    func searchRoom(passcode: String) async throws {
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
    
    func listenRoomData(roomId: String) {
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
