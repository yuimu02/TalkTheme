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
                NavigationLink {
                    ThemeView()
                } label: {
                    Text("次のお題")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .padding(50)
                }
                NavigationLink {
                    PasswordView()
                } label: {
                    Text("終了")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .padding(50)
                }
            }
        }
    }
}

#Preview {
    ContinueView()
}
