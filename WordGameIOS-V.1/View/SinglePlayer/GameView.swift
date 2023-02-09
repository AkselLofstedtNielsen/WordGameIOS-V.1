//
//  GameView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-08.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var vm : TypingViewModel

    
    var body: some View {
        ZStack{
            VStack{
                TopBarView(typingVM: vm)
                Spacer()
                FallingWords(typingVM: vm)
                Spacer()
                TypingView(typingVM: vm)
            }

        }
    }

}

