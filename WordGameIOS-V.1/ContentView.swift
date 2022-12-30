//
//  ContentView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2022-12-31.
//

import SwiftUI

struct ContentView: View {
    @State var words = Words.previewWords
    @State var wordOffset : CGFloat = -1000
    @State var resetAnimation : Bool = false
    
    var body: some View {
        VStack {
            ForEach(words) { word in
                /*@START_MENU_TOKEN@*/Text(word.word)/*@END_MENU_TOKEN@*/
                    .font(.title)
                    .offset(x: word.x, y: wordOffset)
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){
                            timer in
                            if(wordOffset >= 400){
                                if(resetAnimation){
                                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
                                        wordOffset = 0
                                        resetAnimation.toggle()
                                    }
                                    resetAnimation = false
                                }
                            }
                            withAnimation(.easeIn(duration: 0.05)){
                                wordOffset += 1
                            }
                        }
                    }
            }
          
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Words: Identifiable{
    let id = UUID()
    let word : String
    let rotation: Double
    let x: CGFloat
}

extension Words{
    static let previewWords : [Words] = [
        Words(word: "Hejsan", rotation: 0, x: 0),
        Words(word: "Bajskorv", rotation: 30, x: -100),
        Words(word: "Tjenixen", rotation: 0, x: -50),
        Words(word: "Blabla", rotation: 180, x: 30),
        Words(word: "ABCDE", rotation: 20, x: -120),
        Words(word: "Okidoki", rotation: 10, x: 70),
        Words(word: "NÄMEN", rotation: 0, x: -40),
        Words(word: "HEHE", rotation: 30, x: 90)]
}
