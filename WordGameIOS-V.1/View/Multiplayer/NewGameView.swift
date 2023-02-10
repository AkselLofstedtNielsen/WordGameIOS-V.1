//
//  NewGameView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct NewGameView: View {
    @ObservedObject var vm : TypingViewModel
    
    var body: some View {
        MultiplayerTopBarView()
        Spacer()
        FallingWords(typingVM: vm)
        Spacer()
        TypingView(typingVM: vm)
    }
}


