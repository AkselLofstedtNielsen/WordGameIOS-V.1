//
//  TopBarView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-01.
//

import SwiftUI

struct TopBarView: View {
    @ObservedObject var typingVM: TypingViewModel
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack{
           
            if !typingVM.gameOver{
                Text("Life left: \(typingVM.playerLife)")
                    .foregroundColor(.purple)
                Spacer()
                Text("Time: \(typingVM.timePlayed)")
                    .bold()
                    .foregroundColor(.purple)
                    .onReceive(timer){ _ in
                        if typingVM.isTimerRunning{
                            typingVM.timePlayed += 0.1
                            typingVM.addWordToGame()
                        }
                    }
            }else{
                Text("\(typingVM.WPS): Words per second")
                    .foregroundColor(.purple)
                    .bold()
            }
            
            Spacer()
            
            if typingVM.gameOver{
                Button(action: {
                    typingVM.restartGame()
                }) {
                    Text("Play again")
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
            
        }
    }
    
}
