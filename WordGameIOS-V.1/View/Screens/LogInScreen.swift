//
//  LogInScreen.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-09.
//

import SwiftUI
import FirebaseAuth

struct LogInScreen: View {
    @Binding var logInShow : Bool
    @State var email : String = ""
    @State var password : String = ""
    @State var showPassword : Bool = false

    
    var body: some View {
        VStack(alignment: .leading,spacing: 15){
          Spacer()
            
            TextField("Email", text: $email, prompt: Text("Email").foregroundColor(.blue))
                .padding(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.blue, lineWidth: 3)
                }
                .padding(.horizontal)
            
            HStack{
                Group{
                    if showPassword{
                        TextField("PassWord",
                                  text: $password,
                                  prompt: Text("Password").foregroundColor(.red))
                    }else{
                        SecureField("Password",
                                    text: $password,
                                    prompt: Text("Password").foregroundColor(.red))
                    }
                }
                .padding(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.red,lineWidth: 3)
                }
                Button{
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red)
                }
                
            
            }.padding(.horizontal)
            Spacer()
            
            Button{
                login()
                
            } label: {
                Text("Sign in")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.green)
                .cornerRadius(20)
                .padding()
            
            Button{
                createUser()
            } label: {
                Text("Create User")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.blue)
        }
        
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ (result,error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
                
            }else{
                logInShow.toggle()
                print("Logged in")
            }
        }
    }
    func createUser(){
        Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else{
                logInShow.toggle()
                print("User created")
            }
        }
    }
    
    
}
