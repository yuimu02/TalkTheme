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
            Color.yellow
                .ignoresSafeArea()
            VStack{
                Text(FirestoreClient().room.passcode)
                Text("テーマ")
                    .font(.system(size: 40))
                TextField("テーマを入力", text: $viewModel.theme)
                    .textFieldStyle(.roundedBorder)
                NavigationLink {
                    ResultView()
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
            }
            .padding(30)
        }
    }
    
}

#Preview {
    ThemeView()
}
