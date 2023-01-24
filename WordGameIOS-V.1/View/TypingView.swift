//
//  TypingView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import SwiftUI

struct TypingView: View {
    //View for the userinput/typing
    
    @EnvironmentObject var TypingVM: TypingViewModel
    @State var inputText : String = ""
    @State var inputWord : String = ""
    @State var typeHereAnimate = true
    
    var body: some View {
        ZStack{
            VStack{
               
                VStack{
                    if typeHereAnimate{
                        typeHereAnimation()
                    }
                    
                    textFieldView(inputText: $inputText)
                        .onSubmit {
                            typeHereAnimate = false
                        }
                    
                    Button(action:{
//                        checkCorrectWord(word: inputWord, inputText: inputText)
                    }){
                        Text("Rätta")
                    }
                    .onAppear(){
                        
                    }
                 
                    
                }
            }
            
        }
       
 
    }
//    func checkCorrectWord (word: String, inputText: String){
//        if inputText == word{
//            TypingVM.addToTyped(inputWord: Word(word: word))
//            for words in TypingVM.typed{
//                print("\(words.word)")
//            }
//        }else{
//            print("Fel")
//        }
//
//    }

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
