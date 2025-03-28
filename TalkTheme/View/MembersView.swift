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
            Color.yellow
                .ignoresSafeArea()
            VStack {
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.room.members, id: \.self) { member in
                            Text(member)
                        }
                    }
                    Spacer()
                }
                .padding(32)
                
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
                }
                .padding(.top, 20)
            }
            .navigationDestination(isPresented: $viewModel.presentTheme) {
                ThemeView()
            }
        }
    }
}

#Preview {
    MembersView()
}
