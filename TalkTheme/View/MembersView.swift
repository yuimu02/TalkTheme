//
//  MembersView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/03/27.
//

import SwiftUI

struct MembersView: View {
    
    let members = ["あおい", "ゆい", "ひかる"]
    
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(members, id: \.self) { member in
                            Text(member)
                        }
                    }
                    Spacer()
                }
                .padding(32)
                
                HStack {
                    Button(action: {}) {
                        Text("戻る")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .border(Color.white, width: 4)
                            .padding(10)
                    }
                    
                    Button(action: {}) {
                        Text("スタート")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .border(Color.white, width: 4)
                            .padding(10)
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    MembersView()
}
