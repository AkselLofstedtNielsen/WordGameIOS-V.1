//
//  TopBarView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-01.
//

import SwiftUI

struct TopBarView: View {
    @ObservedObject var typingVM: SinglePlayerVM
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack{
           
            if typingVM.gameRunning{
                ForEach(0..<typingVM.playerLife, id: \.self){_ in
                    Image(systemName: "heart")
                        .foregroundColor(.purple)
                }
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
            }
            
        }
    }
    
}
