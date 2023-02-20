//
//  MultiplayerTypingView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-16.
//

import SwiftUI

    struct MultiplayerTypingView: View {
        @ObservedObject var vm : MultiplayerVM
        @State var typeAnimate = true
        
        var body: some View {
            VStack{
                
                if typeAnimate{
                    typeHereAnimation()
                }
                
                TextField("", text: $vm.userText)
                    .frame(height: 75).border(.purple)
                    .textFieldStyle(.automatic)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.characters)
                    .foregroundColor(.white)
                    .onChange(of: vm.userText) { newValue in
                        vm.userText = vm.userText
                        
                        if vm.userText.last != nil{
                            vm.testing(letter: vm.userText.last!)
                        }
                        else{
                            vm.wordFound = false
                        }
                        
                    }
                    .onTapGesture {
                        if !vm.gameRunning{
                            typeAnimate = false
                            vm.makePlayerReady()
                        }
                    }
            }
        }
    }





