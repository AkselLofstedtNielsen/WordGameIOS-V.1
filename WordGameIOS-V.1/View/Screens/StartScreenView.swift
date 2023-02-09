//
//  StartScreenView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-08.
//

import SwiftUI

struct StartScreenView: View {
    @EnvironmentObject var typingVM : TypingViewModel
    @State var gameShow = false
    @State var logInShow = false
    
    var body: some View {
        if gameShow{
            GameView(vm: typingVM)
        }
        else if logInShow{
            LogInScreen(logInShow: $logInShow)
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
                        
                    }//_Hstack
                    Spacer()
                    
                    Text("TYPE FIGHT")
                        .bold()
                        .foregroundColor(.blue)
                    
                    Spacer()
                    

                       HStack{
                           Button(action:{
                               typingVM.gameSpeed = 9.0
                               gameShow.toggle()
                           }){
                               Text("Easy Mode")
                           }
                           .buttonStyle(.bordered)
                           
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 6.5
                               gameShow.toggle()
                           }){
                               Text("Medium Mode")
                           }
                           .buttonStyle(.bordered)
                           
                           Spacer()
                           
                           Button(action:{
                               typingVM.gameSpeed = 4.0
                               gameShow.toggle()
                           }){
                               Text("Hard Mode")
                           }
                           .buttonStyle(.bordered)
                     
                     
                       }//_Hstack
                    
                    Spacer()
                }//_VStack
            }
        }

    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
