//
//  MultiplayerFallingWord.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-16.
//

import Foundation
import SwiftUI

struct MultiplayerFallingWords: View{
    @ObservedObject var vm : MultiplayerVM
    @State var isPlaying = true
    
    var body: some View{
        ZStack{
            if vm.gameRunning{
                ForEach(vm.list.words){ word in
                    MultiplayerWordView(vm: vm, word: word)
                }
                Rectangle()
                    .frame(height: 10.0)
                    .foregroundColor(.red)
                    .offset(y:200)
            }else{
                Text("No game")
            }
        }
    }
    
}
