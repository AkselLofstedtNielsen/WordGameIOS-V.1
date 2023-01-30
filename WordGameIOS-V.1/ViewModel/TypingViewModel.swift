//
//  TypingViewModel.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import Foundation
//firebase wordlist
//VM for the typing/user input

class TypingViewModel : ObservableObject {
    

    @Published var timePlayed = 0.0
    @Published var isTimerRunning = false
    @Published var gameOver = false
    @Published var WPS : Double = 0.0
    
    @Published var userText = ""
    @Published var wordFound = false
    @Published var id = UUID()
    @Published var letterPosition = 1
    
    let list = WordList()
    
    
    
    func testing(letter: Character) {
        if wordFound{
            guard let index = list.words.firstIndex(where: {$0.id == id}) else { return }
            
            print("i ord: \(list.words[index].word)")
            
            let wordInLetters = list.words[index].letters
            
            if wordInLetters[letterPosition] == letter{
                if letterPosition == wordInLetters.count - 1{
                    print("Ord skrivet")
                    resetWord()
                    list.addToTyped(inputWord: list.words.first(where: {$0.id == id})!)
                    list.words.removeAll(where: {$0.id == id})
                    
                    if list.words.isEmpty{
                        WPS = getWPS()
                        stopGame()
                    }
                    
                }else{
                    print("Rätt")
                    letterPosition += 1
                }
                
            }else{
                print("Fel")
            }
            
        }
        if !wordFound{
            for word in list.words{
                if word.letter == letter{
                    print("Ja")
                    id = word.id
                    wordFound = true
                    break
                }else{
                    print("Nej")
                }
            }
        }
        
      }
      
      func resetWord() {
          letterPosition = 1
          userText = ""
          wordFound = false
      }
      
      func getWPS() -> Double {
          return Double(list.typed.count) / timePlayed
          
      }

      func stopGame() {
          timePlayed = 0
          isTimerRunning = false
          gameOver = true
      }
      
      func restartGame() {
          for word in list.typed{
              list.words.append(word)
          }
          list.typed.removeAll()
          
          gameOver = false
          isTimerRunning = true
          timePlayed = 0.0
      }
    
  }


    //TODO func för,
    //Backspace, space/enter, varje keypress
   
//    //View for the userinput/typing

//Timer
//let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//@State var timePlayed = 0.0
//@State var isTimerRunning = false
//
//@State var gameOver = false
//@State var WPS : Double = 0.0
//
//
//@EnvironmentObject var list : WordList
//@State private var userText = ""
//@State var wordFound = false
//
////variabel för id på ordet som vi hamnar i efter första bokstav e skriven
//@State var id = UUID()
//
////variabel för när vi hamnar innuti ett ord, att veta vilken bokstav vi är på
//@State var letterPosition = 1
//
//
//var body: some View {
//    VStack{
//
//        if !gameOver{
//            Text("Time: \(timePlayed)")
//                .bold()
//                .onReceive(timer){ _ in
//                    if self.isTimerRunning{
//                        self.timePlayed += 0.1
//                    }
//
//                }
//        }else{
//            Text("\(WPS) Words per second")
//        }
//
//
//        ForEach (list.typed){ word in
//            Text(word.word)
//                .bold()
//                .foregroundColor(.green)
//        }
//        Spacer()
//        Text("Write the words:")
//            .bold()
//        ForEach (list.words){ word in
//            HighlightedText(word.word, matching: self.userText)
//        }
//        Spacer()
//
//        if gameOver{
//            Button(action:{
//                restartGame()
//            }) {
//                Text("Play again")
//            }
//        }
//        Spacer()
//
//        if !isTimerRunning{
//            typeHereAnimation()
//        }
//
//
//        TextField("", text: $userText)
//            .onTapGesture {
//                isTimerRunning.toggle()
//            }
//            .frame(height: 75).border(.red)
//            .textFieldStyle(.automatic)
//            .multilineTextAlignment(.center)
//            .autocorrectionDisabled(true)
//            .textInputAutocapitalization(.characters)
//            .onChange(of: userText) { newValue in
//                userText = userText
//                //runs each time the text is edited
//                if userText.last != nil{
//                    testing(letter: userText.last!)
//                }
//
//
//
//            }
//    }
//}
//func testing(letter: Character){
//
//    //för varje ord i listan testar den ifall första bokstaven har blivit skriven.
//    //om den har blivit skriven så fortsätt med det ordet
//    if wordFound{
//        print("inne i ord")
//        //Om ordet e hittat så fortsätter vi här att bryta ner hela ordet
//
//        let index = list.words.firstIndex(where: {$0.id == id})
////            print("\(list.words[index!].word)")
//
//        //Vårat ord i characters
//        let insideWord = list.words[index!].letters
//
//
//        if insideWord[letterPosition] == letter{
//            if letterPosition == insideWord.count - 1{
//                print("hela ordet skrivet")
//                resetWord()
//                list.addToTyped(inputWord: list.words.first(where: {$0.id == id})!)
//                list.words.removeAll(where: {$0.id == id})
//
//                if list.words.isEmpty{
//                    WPS = getWPS()
//                    stopGame()
//
//
//                }
//
//            }else{
//                print("rätt")
//                letterPosition += 1
//            }
//
//
//        }else{
//            print("fel")
//        }
//
//    }
//    if !wordFound{
//        for word in list.words{
//            if word.letter == letter{
//                print("ja")
//                id = word.id
//                wordFound = true
//                break
//
//            }else{
//                print("ne")
//            }
//        }
//    }
//
//    func resetWord(){
//        letterPosition = 1
//        userText = ""
//        wordFound = false
//    }//func resetWord
//
//    func getWPS () -> Double{
//        let wps = Double(list.typed.count) / timePlayed
//        return wps
//
//    }
//    func stopGame(){
//        timePlayed = 0
//        isTimerRunning = false
//        gameOver = true
//    }
//
//
//
//
//
//}//-func testing
//func restartGame(){
//    for word in list.typed{
//        list.words.append(word)
//    }
//
//    list.typed.removeAll()
//
//    gameOver = false
//    isTimerRunning = true
//    timePlayed = 0.0
//
//}
//
//}//-Struct typingView
//

//
//
//
//struct typeHereAnimation: View{
//    @State var bouncing = false
//
//    var body: some View {
//        VStack{
//            VStack(spacing: 5){
//                Text("Type here")
//                Image(systemName: "arrow.down")
//            }
//            .offset(y: bouncing ? -15: -25)
//            .animation(.easeIn(duration: 1).repeatForever())
//            .onAppear(){
//                self.bouncing.toggle()
//            }
//        }
//    }
//}
//






