//
//  WaitingView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/03/27.
//

import SwiftUI

struct WaitingView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        ZStack{
            Image("Basic")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Text ("回答済　\(viewModel.room.topics.count)/\(viewModel.room.members.count)")
                    .font(.system(size: 20, weight: .semibold))
                VStack(spacing: 40) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                        .tint(Color.black)
                }
                
                .padding()
                Text ("スマホを丸く並べてね")
                    .font(.system(size: 20, weight: .semibold))
                
                if viewModel.room.topics.count == viewModel.room.members.count {
                    Button {
                        viewModel.selectTopic()
                        viewModel.changeRoomStatus(status: .selecting)
                    } label: {
                        Text("準備完了")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .border(Color.white, width: 4)
                            .padding(50)
                    }
                    .disabled(viewModel.room.topics.count != viewModel.room.members.count)
                    .opacity(viewModel.room.topics.count != viewModel.room.members.count ? 0.3 : 1)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.presentselecting) {
            SelectView()
        }
    }
}

#Preview {
    WaitingView()
}
