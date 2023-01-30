//
//  TypeHereAnimation.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-30.
//

import Foundation
import SwiftUI

struct typeHereAnimation: View{
    @State var bouncing = false

    var body: some View {
        VStack{
            VStack(spacing: 5){
                Text("Type here")
                Image(systemName: "arrow.down")
            }
            .offset(y: bouncing ? -15: -25)
            .animation(.easeIn(duration: 1).repeatForever())
            .onAppear(){
                self.bouncing.toggle()
            }
        }
    }
}
