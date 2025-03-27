//
//  PasswordView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct PasswordView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack{
                Text("パスワード")
                    .font(.system(size: 20))
                TextField("パスワードを入力", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                Button {
                    viewModel.searchRoom()
                } label: {
                    Text("つくる")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                        .border(Color.white, width: 4)
                        .padding(50)
                }
            }
            .padding(30)
            .navigationDestination(isPresented: $viewModel.presentTheme) {
                ThemeView()
            }
        }
    }
}

#Preview {
    PasswordView()
}
