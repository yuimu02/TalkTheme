//
//  ResultView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/30.
//

import SwiftUI

struct ScalingAnimationView<Content: View>: View {
    let content: Content
        @State private var isAnimating = false


        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }

        var body: some View {
            content
                .scaleEffect(isAnimating ? 10.0 : 1.0)
                .opacity(isAnimating ? 0 : 1)
                .animation(
                    Animation.easeOut(duration: 5.0),
                    value: isAnimating
                )
                .onAppear {
                    isAnimating = true
                }
        }
    }

//    #Preview {
//        ScalingAnimationView {
//            Circle()
//                .stroke(Color.white, lineWidth: 2.0)
//                .fill(Color.pink)
//                .frame(width: 200, height: 160)
//        }
//}

    
    
    struct ResultView: View {
        @State private var theme: String = ""
        @State private var player: String = ""
        @State private var finishedanimation: Bool = false
        var body: some View {
            if finishedanimation == false {
                ScalingAnimationView {
                    Circle()
                        .stroke(Color.white, lineWidth: 2.0)
                        .fill(Color.pink)
                        .frame(width: 200, height: 160)
                    
                }
//                sleep(4)
 //               finishedanimation = true
            } else {
                NavigationStack {
                    ZStack {
                        
                        //                Color.black
                        //                    .ignoresSafeArea()
                        VStack {
                            Text("お題")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .shadow(color: Color.pink, radius: 3 )
                                .shadow(color: Color.pink, radius: 20 )
                                .shadow(color: Color.pink, radius: 5 )
                                .shadow(color: Color.pink, radius: 7 )
                            Text(theme)
                                .font(.system(size: 60))
                            
                            Text("誰")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .shadow(color: Color.pink, radius: 3 )
                                .shadow(color: Color.pink, radius: 20 )
                                .shadow(color: Color.pink, radius: 5 )
                                .shadow(color: Color.pink, radius: 7 )
                            Text(player)
                            
                            NavigationLink {
                                StartView()
                            } label: {
                                Text("終了")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(20)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .padding(50)
                            }
                        }
                    }
                }
            }
        }
    }
    
    #Preview {
        ResultView()

    }

