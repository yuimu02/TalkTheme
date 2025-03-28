//
//  WaitingView.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/03/27.
//

import SwiftUI

struct WaitingView: View {
    var body: some View {
        Text ("回答済　◯/◯")
        VStack(spacing: 40) {
            ProgressView()
                .progressViewStyle(.circular)
                .padding()
                .tint(Color.black)
        }
        .padding()
        Text ("スマホを丸く並べてね")
    }
}

#Preview {
    WaitingView()
}
