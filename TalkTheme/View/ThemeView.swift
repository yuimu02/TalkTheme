//
//  ThemeView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct ThemeView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        ZStack {
            Image("Basic")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack{
                Text(viewModel.room.passcode)
                    .underline(color: .black)
                    .padding(30)
                    .font(.system(size: 20))
                Text("お題")
                    .font(.system(size: 40))
                TextField("お題を入力", text: $viewModel.theme)
                    .textFieldStyle(.roundedBorder)
                Button {
                    viewModel.postTopic()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        viewModel.theme = ""
                    }
                } label: {
                    Text("次へ")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                        .border(Color.white, width: 4)
                        .padding(50)
                }
                .disabled(viewModel.theme.isEmpty)
                .opacity(viewModel.theme.isEmpty ? 0.3 : 1)
                
            }
            .padding(30)
            .navigationDestination(isPresented: $viewModel.presentWaiting) {
                WaitingView()
            }
            .navigationBarBackButtonHidden()
        }
    }
    
}

#Preview {
    ThemeView()
}
