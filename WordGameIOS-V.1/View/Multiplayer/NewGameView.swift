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
            MultiplayerTopBarView(game: vm)
            Spacer()
            
                .background(Color.black)
        }
    }
    
    
}
