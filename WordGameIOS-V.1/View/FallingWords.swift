//
//  FallingWords.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-02.
//

import SwiftUI

struct FallingWords: View {
    
    @ObservedObject var typingVM : TypingViewModel
    
    @State var game : Int = 0
    
    @State var gameSpeed : Double = 0.01

    var body: some View {
        ForEach(typingVM.list.words){word in
            HighlightedText(word.word, matching: typingVM.userText)
                .offset(x: word.xPos, y: word.yPos)
            }
        .onAppear(perform: {
            gameTimer()
            timer()
        })
    }

    func gameTimer(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
            game += 1
            if game % 5 == 0{
                typingVM.list.addRandomWord()
            }
        }
    }
    func timer(){
        Timer.scheduledTimer(withTimeInterval: gameSpeed, repeats: true){_ in
            for word in typingVM.list.words{
                word.yPos += 1
            }


        }
    }
}

//struct WordView : View {
//    var word : Word
//    var yPos : CGFloat
//
//    var body: some View{
//        Text(word.word)
//    }
//}
//struct FallingWords_Previews: PreviewProvider {
//    static var previews: some View {
//        FallingWords()
//    }
//}
