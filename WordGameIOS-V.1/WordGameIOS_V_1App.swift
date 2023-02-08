//
//  WordGameIOS_V_1App.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2022-12-31.
//

import SwiftUI
import Firebase

@main
struct WordGameIOS_V_1App: App {
    @StateObject var typingVM = TypingViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(typingVM)
        }
    }
}
