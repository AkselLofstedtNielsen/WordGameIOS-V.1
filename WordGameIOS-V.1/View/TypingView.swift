//
//  TypingView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import SwiftUI

    struct TypingView: View {
        @ObservedObject var typingVM: TypingViewModel
        @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        var body: some View {
            VStack{
                
                if !typingVM.gameOver{
                    Text("Time: \(typingVM.timePlayed)")
                        .bold()
                        .onReceive(timer){ _ in
                            if typingVM.isTimerRunning{
                                typingVM.timePlayed += 0.1
                            }
                        }
                }else{
                    Text("\(typingVM.WPS): Words per second")
                }
                
                ForEach (typingVM.list.typed) { word in
                    Text(word.word)
                        .bold()
                        .foregroundColor(.green)
                }
                Spacer()
                Text("Write the words:")
                    .bold()
                
                ForEach(typingVM.list.words){ word in
                    HighlightedText(word.word, matching: typingVM.userText)
                }
                
                Spacer()
                
                if typingVM.gameOver{
                    Button(action: {
                        typingVM.restartGame()
                    }) {
                        Text("Play again")
                    }
                }
                
                Spacer()
                
                if typingVM.isTimerRunning{
                    typeHereAnimation()
                }
                
                TextField("", text: $typingVM.userText)
                    .onTapGesture {
                        typingVM.isTimerRunning.toggle()
                    }
                    .frame(height: 75).border(.red)
                    .textFieldStyle(.automatic)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.characters)
                
                    .onChange(of: typingVM.userText) { newValue in
                        typingVM.userText = typingVM.userText
                        
                        if typingVM.userText.last != nil{
                            typingVM.testing(letter: typingVM.userText.last!)
                        }
                        
                    }
            }
        }
    }





