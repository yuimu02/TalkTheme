//
//  HomeView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: ViewModel
     
    @AppStorage(UserDefaultsKey.name.rawValue) var name = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Home")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack{
                    
//                    Text("名前")
//                        .font(.system(size: 40))
//                        .fontWeight(.bold)
                    

                    TextField("名前を入力", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.top, 420)
                    NavigationLink {
                        PasswordView()
                            .environmentObject(viewModel)
                    } label: {
                        Text("はじめる")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .border(Color.white, width: 4)
                            .padding(50)
                        //        .shadow(color: Color.pink, radius: 3 )
                        
                    }
                    .disabled(name.isEmpty)  // 名前が空のときボタンを無効化
                    .opacity(name.isEmpty ? 0.3 : 1)
                }
                .padding(30)
                
            }
            //Color.yellow
            .ignoresSafeArea()
            .onAppear {
                    viewModel.name = name
            }
            .onChange(of: name) {
                viewModel.name = name
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
