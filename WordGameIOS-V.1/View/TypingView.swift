//
//  TypingView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import SwiftUI

struct TypingView: View {
    //View for the userinput/typing
    
    @EnvironmentObject var list : WordList
    @State private var userText = ""
    @State var wordFound = false
    
    //variabel för id på ordet som vi hamnar i efter första bokstav e skriven
    @State var id = UUID()
    
    //variabel för när vi hamnar innuti ett ord, att veta vilken bokstav vi är på
    @State var letterPosition = 1
    
    
    var body: some View {
        VStack{
            Text("Typed:")
                .bold()

            ForEach (list.typed){ word in
                Text(word.word)
            }
            Spacer()
            Text("Write the words:")
                .bold()
            ForEach (list.words){ word in
                HighlightedText(word.word, matching: self.userText)
            }
            Spacer()
           
            typeHereAnimation()
            TextField("",text: self.$userText)
                .frame(height: 75).border(.red)
                .textFieldStyle(.automatic)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.characters)
                .onChange(of: userText) { newValue in
                    userText = userText
                    //runs each time the text is edited
                    if userText.last != nil{
                        testing(letter: userText.last!)
                    }
                    
                    
                   
                }
        }
    }
    func testing(letter: Character){
        //för varje ord i listan testar den ifall första bokstaven har blivit skriven.
        //om den har blivit skriven så fortsätt med det ordet
        if wordFound{
            print("inne i ord")
            //Om ordet e hittat så fortsätter vi här att bryta ner hela ordet
            
            let index = list.words.firstIndex(where: {$0.id == id})
//            print("\(list.words[index!].word)")
            
            //Vårat ord i characters
            let insideWord = list.words[index!].letters
            

            if insideWord[letterPosition] == letter{
                if letterPosition == insideWord.count - 1{
                    print("hela ordet skrivet")
                    resetWord()
                    list.addToTyped(inputWord: list.words.first(where: {$0.id == id})!)
                    list.words.removeAll(where: {$0.id == id})
                    
                }else{
                    print("rätt")
                    letterPosition += 1
                }
              
                
            }else{
                print("fel")
            }
            
        }
        if !wordFound{
            for word in list.words{
                if word.letter == letter{
                    print("ja")
                    id = word.id
                    wordFound = true
                    break
                    
                }else{
                    print("ne")
                }
            }
        }//func testing

        func resetWord(){
            letterPosition = 1
            userText = ""
            wordFound = false
        }//func resetWord

        
        
        
    }


}//Struct typingView

struct HighlightedText: View {
    //Simple struct for the highlighted letters in the words, only problem is it highlights all of the matching letters in all of the words to begin with.
    let text: String
    let matching: String

    init(_ text: String, matching: String) {
        self.text = text
        self.matching = matching
    }

    var body: some View {
        let tagged = text.replacingOccurrences(of: self.matching, with: "<SPLIT>>\(self.matching)<SPLIT>")
        let split = tagged.components(separatedBy: "<SPLIT>")
        return split.reduce(Text("")) { (a, b) -> Text in
            guard !b.hasPrefix(">") else {
                return a + Text(b.dropFirst()).foregroundColor(.red)
            }
            return a + Text(b)
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

//struct TypingView_Previews: PreviewProvider {
//    static var previews: some View {
//        TypingView()
//    }
//}
