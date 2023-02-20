//
//  NewGameView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct NewGameView: View {
    @ObservedObject var vm : MultiplayerVM
    @Binding var newGameShow : Bool
    
    var body: some View {
        ZStack{
            LoadingView(isShowing: $vm.game.waitingForPlayer ){
                    VStack{
                        MultiplayerTopBarView(vm: vm)
                        Spacer()
                            .alert(vm.printWinner(), isPresented: $vm.gameEnded){
                                Button(action:{
                                    newGameShow.toggle()
                                }){
                                    Text("Return to homescreen")
                                }
                            }
                        MultiplayerFallingWords(vm: vm)
                        Spacer()
                        MultiplayerTypingView(vm: vm)
                    }
                }
           
        }
        .background(Color.black)
        
        
    }
}

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 0 : 0)

                VStack {
                    Text("Waiting for player")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }

}
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
