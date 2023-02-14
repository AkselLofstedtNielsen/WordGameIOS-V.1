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
                    vm.addGame()
                    newGame.toggle()
                }){
                    Text("Create new game")
                }
                .buttonStyle(.bordered)
                
                Spacer()
                
                TextField("Enter game room key", text: $gameRoom)
                    .textFieldStyle(.roundedBorder)
                Button(action:{
//                    vm.subscribeToGame(id: <#T##String?#>)
                }){
                    Text("Join")
                }
                .buttonStyle(.bordered)
                Spacer()
            }
        }
    }
}

