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
                            }
                        }
                }else{
                    Text("Game ID: \(vm.gameId)")
                        .foregroundColor(.purple)
                }

            }

            HStack{
                Text("p1<3: \(vm.game.p1Life)")
                    .foregroundColor(.purple)
                Spacer()
                
                Text("p1+: \(vm.game.p1Score)")
                    .foregroundColor(.purple)
                Spacer()
                
                Text("p2<3: \(vm.game.p2Life)")
                    .foregroundColor(.purple)
                Spacer()
                
                Text("p2+: \(vm.game.p2Score)")
                    .foregroundColor(.purple)
            }

        }
    }
}


