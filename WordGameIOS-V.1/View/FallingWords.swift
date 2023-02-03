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
        ForEach(typingVM.list.words){ wrd in
            WordView(typingVM: typingVM, word: wrd)
            
        }
    }

 
}


struct WordView : View {
    @ObservedObject var typingVM : TypingViewModel
    var word : Word
    @State var animate = false
    

    var body: some View{
        HighlightedText(word.word, matching: typingVM.userText)
            .offset(x: word.xPos, y: animate ? 0 : word.yPos)
            .animation(.linear(duration: 8.0), value: animate)
            .onAppear(perform: {
                animate.toggle()
            })
            
    }
}

