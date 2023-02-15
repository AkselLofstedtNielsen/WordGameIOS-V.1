//
//  NewGameView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct NewGameView: View {
    @ObservedObject var vm : MultiplayerVM
    
    var body: some View {
        VStack{
            MultiplayerTopBarView(vm: vm)
            Spacer()
            Button(action:{
                checkStuff()
                vm.decreasePlayerLife(player: 1)
            }){
                Text("Decrease p1 life")
            }
            Button(action:{
                vm.increasePlayerScore(player: 1)
             
            }){
                Text("Increase p1 score")
            }
            Spacer()
        }
        
    }
    
    func checkStuff(){
        if vm.game.p1Life == 0{
            print("p1 lost")
        }
    }
    
    
}
