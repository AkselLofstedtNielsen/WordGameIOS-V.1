//
//  FirebaseTestView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-07.
//

import SwiftUI

struct FirebaseTestView: View {
    @StateObject var fm = FirestoreManager()
    
    var body: some View {
        VStack{
            ForEach(fm.words){ word in
                Text(word.word)
            }
        }
        
    }
}

struct FirebaseTestView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseTestView()
    }
}
