//
//  MultiplayerTopBarView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct MultiplayerTopBarView: View {
    @State var roomKey : String = "123"
    var body: some View {
        HStack{
            Text("Room Key: \(roomKey)")
        }
    }
}

struct MultiplayerTopBarView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerTopBarView()
    }
}
