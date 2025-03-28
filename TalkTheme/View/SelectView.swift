//
//  ResultView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/30.
//

import SwiftUI


    
    
    struct SelectView: View {
        @EnvironmentObject var viewModel: ViewModel
        
        var body: some View {
                    ZStack {
                        Color.yellow
                            .ignoresSafeArea()
                        VStack {
                            Text("お題")
                                .font(.system(size: 40))
//                                .foregroundColor(.white)
//                                .shadow(color: Color.pink, radius: 3 )
//                                .shadow(color: Color.pink, radius: 20 )
//                                .shadow(color: Color.pink, radius: 5 )
//                                .shadow(color: Color.pink, radius: 7 )
                            Text(viewModel.room.selectedTopic)
                                .font(.system(size: 30))
                            
                            Text("誰")
                                .font(.system(size: 40))
                            Text(viewModel.room.selectedUser)
                                .font(.system(size: 30))
//                            NavigationLink {
//                                ContinueView()
//                            } label: {
//                                Text("会話スタート")
//                                    .font(.system(size: 30))
//                                    .fontWeight(.bold)
//                                    .padding(20)
//                                    .foregroundColor(.black)
//                                    .background(Color.white.opacity(0.8))
//                                    .border(Color.white, width: 4)
//                                    .padding(50)
//                            }
                            Button {
                                
                                if viewModel.room.topics.isEmpty{
                                    viewModel.presentWaiting = false
                                    viewModel.presentWaiting = false
                                } else {
                                    viewModel.selectTopic()
                                }
                            } label: {
                                Text(viewModel.room.topics.isEmpty ? "もう一度遊ぶ" : "次のお題")
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .padding(20)
                                    .foregroundColor(.black)
                                    .background(Color.white.opacity(0.8))
                                    .border(Color.white, width: 4)
                                    .padding(50)
                            }
                            Button {
                                viewModel.presentMembers = false
                                viewModel.presentTheme = false
                                viewModel.presentWaiting = false
                                viewModel.presentWaiting = false
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
        SelectView()

    }

