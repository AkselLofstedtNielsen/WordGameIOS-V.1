//
//  WordView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import SwiftUI
//View for the words

struct WordView: View {
    @EnvironmentObject var list : WordList
    @State var word : String = ""
    @State var i = 0
    
    var body: some View {
        VStack{
            Spacer()
            Text(word)
            Spacer()
            Button(action:{
                word = list.getRandomWord()?.word ?? "§"
            }){
                Text("Tryck för ord")
            }
            Spacer()
        
        }
    }
    
    

}

//struct WordView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordView()
//    }
//}
