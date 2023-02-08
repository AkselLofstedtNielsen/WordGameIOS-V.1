//
//  ContentView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2022-12-31.
//

import SwiftUI

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var vm : TypingViewModel
    @State var nextWord = false
    @State var i = 0
    
    var body: some View {
        ZStack{
            VStack{
                TopBarView(typingVM: vm)
                Spacer()
                FallingWords(typingVM: vm)
                Spacer()
                TypingView(typingVM: vm)
            }

        }
    }
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
