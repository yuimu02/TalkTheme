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
    
    func searchRoom() {
        Task { @MainActor in
            try! await FirestoreClient.shared.searchRoom(passcode: password)
            presentTheme = true
        }
    }
}
