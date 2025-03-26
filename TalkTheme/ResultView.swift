//
//  ResultView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/30.
//

import SwiftUI


    
    
    struct ResultView: View {
        @State private var theme: String = ""
        @State private var player: String = ""
        @State private var finishedanimation: Bool = false
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
                            Text(theme)
                                .font(.system(size: 60))
                            
                            Text("誰")
                                .font(.system(size: 40))
                            Text(player)
                            
                            NavigationLink {
                                StartView()
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

