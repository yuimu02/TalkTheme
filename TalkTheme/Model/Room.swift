//
//  Room.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/02/19.
//

import Foundation
import FirebaseFirestore

struct Room: Codable {
    @DocumentID var id: String?
    var passcode: String
    var status: Status
    var selectedUserid: String
    var selectedTopicid: String
    var members: [String]
    var topics: [String]
}

struct Member: Codable {
    var name: String
}

struct Topic: Codable {
    @DocumentID var id: String?
    var name: String
}

enum Status: String, Codable {
    case waiting
    case inputing
    case selecting
    case resultShowing
    case finished
}
