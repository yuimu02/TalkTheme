//
//  MembersView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/03/27.
//

import SwiftUI

struct MembersView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
//            Color.yellow
//                .ignoresSafeArea()
            Image("Basic")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                
                
                    List {
//                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.room.members, id: \.self) { member in
                                HStack {
                                    Text(member)
                                    Spacer()
                                    if member != viewModel.name {
                                        Button(action: {
                                            if let index = viewModel.room.members.firstIndex(of: member) {
                                                viewModel.room.members.remove(at: index)
                                            }
                                        }) { Text("×")
                                                .foregroundColor(.black)
                                                .padding(.leading, 10)
                                        }
                                    }
                                }
                            }
                            .onMove { indices, newOffset in
                                viewModel.room.members.move(fromOffsets: indices, toOffset: newOffset)
                                viewModel.updateMembers()
                            }
//                        }
            }
                    .background(Color.clear)
        
//                    Spacer()
//                .padding(32)
                    .frame(maxHeight: 300)  // リストの最大高さを設定
                    .padding(16)

                    Spacer()
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("戻る")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .border(Color.white, width: 4)
                    }
                    
                    Button {
                        viewModel.presentTheme = true
                        viewModel.changeRoomStatus(status: .inputing)
                    } label: {
                        Text("スタート")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .border(Color.white, width: 4)
                            .padding(50)
                    }
                    .disabled(viewModel.room.members.count <= 1)
                    .opacity(viewModel.room.members.count <= 1 ? 0.3 : 1)
                }
                .padding(.top, 20)
            }
            .navigationDestination(isPresented: $viewModel.presentTheme) {
                ThemeView()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MembersView()
}
