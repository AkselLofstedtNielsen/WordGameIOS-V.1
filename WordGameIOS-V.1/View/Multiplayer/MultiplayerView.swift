//
//  MultiplayerView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI
import FirebaseAuth

struct MultiplayerView: View {
    @ObservedObject var vm : MultiplayerVM
    let user = Auth.auth().currentUser
    
    @Binding var multiplayerShow : Bool
    @State var gameRoom = ""
    @State var newGame = false
    
    var body: some View {
        if newGame{
            NewGameView(vm: vm, newGameShow: $newGame)
        }else{
            VStack{
                HStack{
                    Button(action:{
                        multiplayerShow.toggle()
                    }){
                        Text("Back")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.bordered)
                    .background(Color.purple)
                    
                    Spacer()
                }
                
                Text("Multiplayer")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.purple)
                
                Spacer()
                
                
                Button(action:{
                    vm.addGame()
                    vm.subscribeToGame()
                    newGame.toggle()
                }){
                    Text("Create new game")
                        .foregroundColor(.white)
                }
                .buttonStyle(.bordered)
                .background(Color.purple)
                
                Spacer()
                
                TextField("Enter game room key", text: $gameRoom)
                    .textFieldStyle(.roundedBorder)
                    .background(Color.purple)
                    .foregroundColor(.purple)
                
                Button(action:{
                    vm.gameId = gameRoom
                    vm.joinGame()
                    newGame.toggle()
                }){
                    Text("Join")
                        .foregroundColor(.white)
                }
                .buttonStyle(.bordered)
                .background(Color.purple)
                Spacer()
            }
            .background(Color.black)
            
        }
    }
}

