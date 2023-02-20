//
//  StartScreenView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-08.
//

import SwiftUI
import FirebaseAuth

struct StartScreenView: View {
    @EnvironmentObject var typingVM : SinglePlayerVM
    @ObservedObject var multiplayerVM = MultiplayerVM()
    @State var logInShow = false
    @State var singlePlayerShow = false
    @State var multiplayerShow = false
    var user = Auth.auth().currentUser
    
    var body: some View {
        if singlePlayerShow{
            GameView(vm: typingVM,singlePlayerShow: $singlePlayerShow)
        }
        else if logInShow{
            LogInScreen(logInShow: $logInShow)
        }
        else if multiplayerShow{
            MultiplayerView(vm: multiplayerVM, multiplayerShow: $multiplayerShow)
        }
        else{
            ZStack{
                VStack{
                    HStack{
                        Button(action:{
                            logInShow.toggle()
                        }){
                            Image(systemName: "person.circle")
                        }
                        .imageScale(.medium)
                        .buttonStyle(.bordered)
                        
                        Spacer()
                        
                        Text("TYPE FIGHT")
                            .bold()
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                    }//_Hstack
                    Spacer()
                    
                    Button(action:{
                        multiplayerShow.toggle()
                    }){
                        Text("Multiplayer")
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    

                    Text("Single player")
                    
                       HStack{
                           Button(action:{
                               typingVM.gameSpeed = 9.0
                               singlePlayerShow.toggle()
                           }){
                               Text("Easy Mode")
                           }
                           .buttonStyle(.bordered)
                           
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 6.5
                               singlePlayerShow.toggle()
                           }){
                               Text("Medium Mode")
                           }
                           .buttonStyle(.bordered)
                           
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 4.0
                               singlePlayerShow.toggle()
                           }){
                               Text("Hard Mode")
                           }
                           .buttonStyle(.bordered)
                     
                     
                       }//_Hstack
                    
                    Spacer()
                }//_VStack
                
                .onAppear(perform: {
                    print("User email\(user?.email)")
                })
            }
        }

    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
