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
                        Color(viewModel.isSelectedUser ? Color("Out") : Color("Safe"))
                            .ignoresSafeArea()
                        VStack {
                            Text("お題は...")
                                .font(.system(size: 20))

                            Text(viewModel.room.selectedTopic)
                                .font(.system(size: 40))
                                .underline(color: .black)
                            
                            Spacer().frame(height: 30)
                            if viewModel.room.status == .selected {
                                Text("回答者")
                                    .font(.system(size: 20))
                                Text(viewModel.room.selectedUser)
                                    .font(.system(size: 40))
                                    .underline(color: .black)
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
                                        viewModel.presentselecting = false
                                        viewModel.presentTheme = false
                                        viewModel.changeRoomStatus(status: .waiting)
                                        viewModel.resetRoom()
                                    } else {
                                        viewModel.selectTopic()
                                        viewModel.changeRoomStatus(status: .selecting)
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
                                    viewModel.changeRoomStatus(status: .finished)
                                    viewModel.resetRoom()
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
                    }
                    .navigationBarBackButtonHidden()
            }
        }
    
    #Preview {
        SelectView()

    }

