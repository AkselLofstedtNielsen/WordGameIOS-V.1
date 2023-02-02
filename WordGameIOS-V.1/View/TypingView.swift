//
//  TypingView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import SwiftUI

    struct TypingView: View {
        @ObservedObject var typingVM: TypingViewModel
        
        var body: some View {
            VStack{
                
                if typingVM.gameOver{
                    typeHereAnimation()
                }
                
                TextField("", text: $typingVM.userText)
                    .onTapGesture {
                        typingVM.isTimerRunning.toggle()
                        typingVM.gameOver = false
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





