//
//  StartScreenView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-08.
//

import SwiftUI
import FirebaseAuth

struct StartScreenView: View {
    @ObservedObject var typingVM = SinglePlayerVM()
    @ObservedObject var multiplayerVM = MultiplayerVM()
    @State var signedIn = false
    @State var logInShow = false
    @State var singlePlayerShow = false
    @State var multiplayerShow = false
    
    var body: some View {
        
        if !signedIn {
            SignInView(signedIn: $signedIn)
        }else{
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
                            .buttonStyle(.bordered)
                            .background(Color.purple)
                            
                            
                            
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
                    
                }
                .background(Color.black)
            }
        }
    }
        
}
struct SignInView: View {
    @Binding var signedIn : Bool
    
    var body: some View {
        Text("Loading game.....")
            .onAppear(){
                Auth.auth().signInAnonymously{ authResult, error in
                    if let error = error {
                        print("error signing in= \(error)")
                    }else {
                        print("Signed in \(Auth.auth().currentUser?.uid)")
                        
                        //bool som är true ifall vi lyckas logga in
                        signedIn = true
                    }
                    
                }
            }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
