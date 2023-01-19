//
//  TypingView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-18.
//

import SwiftUI

struct GameView: View {
    
    @State var inputText : String = ""
    
    var body: some View {
        VStack{
            Spacer()
            WordView()
            VStack{
                typeHereAnimation()
                textFieldView(inputText: $inputText)
            
            }
            Spacer()
            
            
        }
    }
}
struct WordView: View {
    @State var i = 0
    @State var listOfWords = WordList()
    @State var word : String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text(word)
            Spacer()
            Button(action:{
                word = listOfWords.getRandomWord()?.word ?? "Nil"
            }){
                Text("Tryck för ord")
            }
            Spacer()
        
        }
    }
    
    

}
struct typeHereAnimation: View{
    @State var bouncing = false
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                Text("Type here")
                Image(systemName: "arrow.down")
            }
            .offset(y: bouncing ? -15: -25)
            .animation(.easeIn(duration: 1).repeatForever())
            .onAppear(){
                self.bouncing.toggle()
            }
        }
    }
}
struct textFieldView: View{
    @Binding var inputText : String
    
    var body: some View{
        VStack{
            TextField("", text: $inputText)
                .frame(height: 75).border(.red)
                .textFieldStyle(.automatic)
                .multilineTextAlignment(.center)
                
              
            
        }
    }
}

struct TypingView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
