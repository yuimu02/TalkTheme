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
            Image("Basic")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack{
                Text("合言葉")
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                TextField("合言葉を入力", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 20)
                
                Text("みんなで合言葉を決めて入力してね！")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                
                Button {
                    viewModel.searchRoom()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        viewModel.password = ""
                    }
                } label: {
                    Text("OK!")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.8))
                        .border(Color.white, width: 4)
                        .padding(50)
                }
                .disabled(viewModel.password.isEmpty)
                .opacity(viewModel.password.isEmpty ? 0.3 : 1)
            }
            .padding(30)
            .navigationDestination(isPresented: $viewModel.presentMembers) {
                MembersView()
                    .environmentObject(viewModel)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PasswordView()
}
