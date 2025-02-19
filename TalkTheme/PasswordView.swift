//
//  PasswordView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct PasswordView: View {
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack{
                Text("パスワード")
                    .font(.system(size: 20))
                TextField("パスワードを入力", text: $password)
                    .textFieldStyle(.roundedBorder)
                NavigationLink {
                    ThemeView()
                } label: {
                    Text("つくる")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(50)
                }
            }
            .padding(30)
        }
    }
}

#Preview {
    PasswordView()
}
