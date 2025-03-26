//
//  StartView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        
        VStack {
            NavigationLink {
                PasswordView()
            } label: {
                Text("つくる")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(20)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.8))
                    .border(Color.white, width: 4)
            }
            
            NavigationLink {
                PasswordView()
            } label: {
                Text("はいる")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(20)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.8))
                    .border(Color.white, width: 4)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartView()
}
