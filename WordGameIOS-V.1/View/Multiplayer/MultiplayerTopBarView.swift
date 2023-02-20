//
//  MultiplayerTopBarView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct MultiplayerTopBarView: View {
    @ObservedObject var vm : MultiplayerVM
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            HStack{
                if vm.gameRunning{
                    Text("Time: \(vm.timePlayed)")
                        .bold()
                        .foregroundColor(.purple)
                        .onReceive(timer){ _ in
                            if vm.isTimerRunning{
                                vm.timePlayed += 0.1
                                vm.addWordToGame()
                                vm.checkDead()
                            }
                        }
                }else{
                    Text("Game ID: \(vm.gameId)")
                        .foregroundColor(.purple)
                }

            }

            HStack{
                ForEach(0..<vm.game.p1Life, id: \.self){_ in
                    Image(systemName: "heart")
                        .foregroundColor(.purple)
                }
                
                Text("Words: \(vm.game.p1Score)")
                    .foregroundColor(.purple)
                
                Spacer()
                
                ForEach(0..<vm.game.p2Life, id: \.self){_ in
                    Image(systemName: "heart")
                        .foregroundColor(.yellow)
                }
                
                Text("Words: \(vm.game.p2Score)")
                    .foregroundColor(.yellow)
                
                
            }

        }
    }
}


