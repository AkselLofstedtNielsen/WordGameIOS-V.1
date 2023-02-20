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
                        Spacer()
                        
                        Button(action:{
                            logInShow.toggle()
                        }){
                            Image(systemName: "person.circle")
                                .frame(width: 35.0,height: 35.0)
                                .foregroundColor(.white)
                                
                        }
                        .background(Color.purple)
                        .buttonStyle(.bordered)
                        
                       
                
                    }//_Hstack
                    Spacer()
                    
                    Text("TYPE FIGHT")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action:{
                        multiplayerShow.toggle()
                    }){
                        Text("Multiplayer")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.bordered)
                    .background(Color.purple)
                    
                    Spacer()
                    

                    Text("SINGLE PLAYER")
                        .foregroundColor(.white)
                    
                       HStack{
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 9.0
                               singlePlayerShow.toggle()
                           }){
                               Text("Easy")
                                   .foregroundColor(.white)
                           }
                           .buttonStyle(.bordered)
                           .background(Color.purple)
                           
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 6.5
                               singlePlayerShow.toggle()
                           }){
                               Text("Medium")
                                   .foregroundColor(.white)
                           }
                           .buttonStyle(.bordered)
                           .background(Color.purple)
                           
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 4.0
                               singlePlayerShow.toggle()
                           }){
                               Text("Hard")
                                   .foregroundColor(.white)
                           }
                           .buttonStyle(.bordered)
                           .background(Color.purple)
                           
                           Spacer()
                     
                     
                       }//_Hstack
                    
                    Spacer()
                }//_VStack
                
                .onAppear(perform: {
                    print("User email\(user?.email)")
                })
            }
            .background(Color.black)
        }
    }
        
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
