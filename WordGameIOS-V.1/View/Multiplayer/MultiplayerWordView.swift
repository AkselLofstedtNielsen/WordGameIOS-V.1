//
//  MultiplayerWordView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-16.
//

import SwiftUI

struct MultiplayerWordView : View {
    @ObservedObject var vm : MultiplayerVM
    var word : Word
    @State var animate = false
    @State var contains = false

    

    var body: some View{
        HighlightedText(word.word, matching: vm.userText)
            .offset(x: word.xPos, y: animate ? 200 : word.yPos)
            .animation(.linear(duration: vm.gameSpeed), value: animate)
            .onAppear(perform: {
                animate.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + vm.gameSpeed) {
                    let contains = vm.list.words.contains { contain in
                        return contain.word == word.word
                    }
                    if contains{
                        vm.list.words.removeAll(where: {$0.id == word.id})
                        vm.decreasePlayerLife()
                        vm.checkDead()
                    }
                }
            })
            .foregroundColor(.white)
            .font(.system(size:24, weight: .bold, design: .rounded))
        

            
            
        

    }
}
