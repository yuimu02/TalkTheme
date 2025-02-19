//
//  StartView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        
        NavigationStack {
            NavigationLink {
                PasswordView()
            } label: {
                Text("つくる")
                    .shadow(color: .black, radius: 3, x: 5, y: 5)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(20)
                    .background(Color(red: 0.8, green: 0.1, blue: 0.2))
                    .foregroundColor(.white)
                    .padding(50)
            }
            
            NavigationLink {
                PasswordView()
            } label: {
                Text("はいる")
                    .shadow(color: .black, radius: 3, x: 5, y: 5)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(20)
                    .background(Color(red: 0.9, green: 0.9, blue: 0))
                    .foregroundColor(.white)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartView()
}
