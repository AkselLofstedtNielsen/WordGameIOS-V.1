//
//  FallingWords.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-02.
//

import SwiftUI

struct FallingWords: View {
    
    @StateObject var typingVM = TypingViewModel()
    
    @State var game : Int = 0
    
    @State var gameSpeed : Double = 0.01

//    var gameTimer2 : Timer
//    var timer : Timer
    
//    init(typingVM: TypingViewModel) {
//        self.typingVM = typingVM
//        gameTimer2 = gameTimer()
//        timer = timer()
//
//    }
  
    
    var body: some View {
        ForEach(typingVM.list.words){word in
            Text("\(word.yPos)")
                .offset(x: word.xPos, y: word.yPos)
            }
        .onAppear(perform: {
            gameTimer()
            timer()
        })
    }

    func gameTimer(){
        print("Gametimer")
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
            print("43")
            game += 1
            if game % 5 == 0{
                typingVM.list.addRandomWord()
            }
        }
    }
    func timer(){
        print("timer")
        Timer.scheduledTimer(withTimeInterval: gameSpeed, repeats: true){_ in
            print("53")
            for word in typingVM.list.words{
                word.yPos += 0.1
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
struct FallingWords_Previews: PreviewProvider {
    static var previews: some View {
        FallingWords()
    }
}
