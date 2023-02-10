//
//  MultiplayerView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct MultiplayerView: View {
    @Binding var multiplayerShow : Bool
    @State var gameRoom = ""
    
    var body: some View {
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
                //Server
            }){
                Text("Create new game")
            }
            .buttonStyle(.bordered)
            
            Spacer()
            
            TextField("Enter game room key", text: $gameRoom)
            
        }
    }
}

