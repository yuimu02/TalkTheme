//
//  ContinueView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/03/27.
//

import SwiftUI

struct ContinueView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Button {
                    
                } label: {
                    Text("次のお題")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                        .border(Color.white, width: 4)
                        .padding(50)
                }
                NavigationLink {
                    PasswordView()
                } label: {
                    Text("終了")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                        .border(Color.white, width: 4)
                        .padding(50)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContinueView()
}
