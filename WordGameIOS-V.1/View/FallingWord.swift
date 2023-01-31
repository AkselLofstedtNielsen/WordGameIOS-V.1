//
//  FallingWord.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-31.
//

import SwiftUI

struct FallingWord: View {
    var word: String = "TJAA"
    @State var gameSpeed : Double = 0.1
    
    //ypos för ändring/fallande
    @State var yPosText : CGFloat = -400
    @State var collision = false
    
    //Fix fallingSpeed-every(0.1-0.001)
    
    
    
    //skicka med xPos, vart i x led ordet ska vara mellan -150/150
    var xPos : CGFloat = 0
    
    //yPos för toppen av skärmen(rectangle)
    var yPosTop : CGFloat = -400
    var redZonePos : CGFloat = 30
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .offset(y: yPosTop)
                .frame(height: 10)
                .foregroundColor(.green)
            VStack {
                Text(word)
                    .font(.largeTitle)
                    .offset(x: xPos, y: yPosText )
                //30=stannar, -400=börjar
                    .onAppear(perform: {
                        Timer.scheduledTimer(withTimeInterval: gameSpeed, repeats: true){_ in
                            if !collision{
                                yPosText += 2
                                if yPosText >= redZonePos{
                                    collision = true
                                    print("Collision")
                                }
                            }
                        }
                    })
//                    .onReceive(fallingTimer){ _ in
//                        if !collision{
//                            yPosText += 5
//                            if yPosText >= redZonePos{
//                                collision = true
//                                print("Collision")
//                            }
//                        }
//                    }
                    
                    
            }//_Vstack
            Rectangle()
                .offset(y: redZonePos)
                .frame(height: 10)
                .foregroundColor(.red)
            
            
        }//_Zstack
    }
    func testing(obj : Text){
        
    }
}



struct FallingWord_Previews: PreviewProvider {
    static var previews: some View {
        FallingWord(word: "Hej")
    }
}
