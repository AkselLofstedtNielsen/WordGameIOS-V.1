//
//  FallingWords.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-02.
//

import SwiftUI

struct FallingWords: View {
    @ObservedObject var typingVM : TypingViewModel


    var body: some View {
        ZStack{
            ForEach(typingVM.list.words){ wrd in
                WordView(typingVM: typingVM, word: wrd)
                
            }
        }
    }

 
}


struct WordView : View {
    @ObservedObject var typingVM : TypingViewModel
    var word : Word
    @State var animate = false
    @State var contains = false
    

    var body: some View{
        HighlightedText(word.word, matching: typingVM.userText)
            .offset(x: word.xPos, y: animate ? 100 : word.yPos)
            .animation(.linear(duration: 9.0), value: animate)
            .onAppear(perform: {
                animate.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
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
        Rectangle()
            .frame(height: 10)
            .offset(y: 100)
            .foregroundColor(.red)
            
            
        

    }
}


