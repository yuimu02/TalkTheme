//
//  HomeView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct HomeView: View {
    @State private var name: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack{
                Text("名前")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .shadow(color: Color.pink, radius: 3 )
                    .shadow(color: Color.pink, radius: 3 )
                    .shadow(color: Color.pink, radius: 5 )
                    .shadow(color: Color.pink, radius: 3 )
                TextField("名前を入力", text: $name)
                    .textFieldStyle(.roundedBorder)
 
                NavigationLink {
                    StartView()
                } label: {
                    Text("はじめる")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundColor(.white)
                        .border(Color.white, width: 2)
                        .padding(50)
                        .shadow(color: Color.pink, radius: 3 )
                        .shadow(color: Color.pink, radius: 3 )
                        .shadow(color: Color.pink, radius: 5 )
                        .shadow(color: Color.pink, radius: 3 )
                    
                }
            }
//            Button{
//            } label: {
//                Text("始める")
//                    .font(.system(size: 30))
//                    .fontWeight(.bold)
//                    .padding(20)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .padding(50)
//            }
//        }
                .padding(30)

            
            
        }
    }
}

#Preview {
    HomeView()
}
