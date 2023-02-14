//
//  MultiplayerView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct MultiplayerView: View {
    @ObservedObject var vm : MultiplayerVM
    
    @Binding var multiplayerShow : Bool
    @State var gameRoom = ""
    @State var newGame = false
    
    var body: some View {
        if newGame{
            NewGameView(vm: vm)
        }else{
            VStack{
                HStack{
                    Button(action:{
                        multiplayerShow.toggle()
                    }){
                        Text("Back")
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    Text("Multiplayer")
                        .bold()
                        .foregroundColor(.green)
                    
                    Spacer()
                }
                
                
                Spacer()
                
                
                Button(action:{
                    vm.subscribeToGame(id: "D28CD81F-29F0-4E20-858B-AF6E2AF3C754")
                    newGame.toggle()
                }){
                    Text("Create new game")
                }
                .buttonStyle(.bordered)
                
                Spacer()
                
                TextField("Enter game room key", text: $gameRoom)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
            }
        }
    }
}

