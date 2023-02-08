//
//  WordView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-08.
//

import Foundation
import SwiftUI

struct WordView : View {
    @ObservedObject var typingVM : TypingViewModel
    var word : Word
    @State var animate = false
    @State var contains = false
    @State var gameSpeed : Double = 9.0 //time it takes the word to fall 9.0 = easiest, 7.0, 5.0 for harder

    

    var body: some View{
        HighlightedText(word.word, matching: typingVM.userText)
            .offset(x: word.xPos, y: animate ? 200 : word.yPos)
            .animation(.linear(duration: gameSpeed), value: animate)
            .onAppear(perform: {
                animate.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + gameSpeed) {
                    let contains = typingVM.list.words.contains { contain in
                        return contain.word == word.word
                    }
                    if contains{
                        word.dead.toggle()
                        typingVM.list.words.removeAll(where: {$0.id == word.id})
                        typingVM.playerLife -= 1
                        typingVM.checkDead()
                    }
                }
            })
        

            
            
        

    }
}