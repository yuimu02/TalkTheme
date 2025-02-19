//
//  ThemeView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct ThemeView: View {
    @State private var theme: String = ""
    var body: some View {
        NavigationStack {
            VStack{
                Text("テーマ")
                    .font(.system(size: 20))
                TextField("テーマを入力", text: $theme)
                    .textFieldStyle(.roundedBorder)
                NavigationLink {
                    ResultView()
                } label: {
                    Text("次へ")
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
    ThemeView()
}
