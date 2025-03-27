//
//  ResultView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/30.
//

import SwiftUI


    
    
    struct ResultView: View {
        @EnvironmentObject var viewModel: ViewModel
        
        var body: some View {
                    ZStack {
                        
                        //                Color.black
                        //                    .ignoresSafeArea()
                        VStack {
                            Text("お題")
                                .font(.system(size: 40))
//                                .foregroundColor(.white)
//                                .shadow(color: Color.pink, radius: 3 )
//                                .shadow(color: Color.pink, radius: 20 )
//                                .shadow(color: Color.pink, radius: 5 )
//                                .shadow(color: Color.pink, radius: 7 )
                            Text(viewModel.selectedTheme)
                                .font(.system(size: 60))
                            
                            Text("誰")
                                .font(.system(size: 40))
                            Text(viewModel.selectedPlayer)
                            
                            NavigationLink {
                                PasswordView()
                            } label: {
                                Text("終了")
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .padding(20)
                                    .background(Color.yellow)
                                    .foregroundColor(.white)
                                    .padding(50)
                            }
                        }
                    }
            }
        }
    
    #Preview {
        ResultView()

    }

