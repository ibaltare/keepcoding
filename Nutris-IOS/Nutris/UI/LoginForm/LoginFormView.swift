//
//  LoginFormView.swift
//  Nutris
//
//  Created by Nicolas on 17/02/23.
//

import SwiftUI

struct LoginFormView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    var body: some View {
        VStack(spacing: 0){
            
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top,0)
            
            Image("login_form")
                .resizable()
                .scaledToFit()
                .frame(width: 295, height: 235)
                .padding(.top,55)
            
            Button{
                //TODO: action
            } label: {
                HStack{
                    Image("face_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    Text("Continue with Facebook")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .frame(width: 280, height: 45)
            .background(.blue)
            .cornerRadius(12)
            .padding(.top,38)
            
            Button{
                //TODO: action
            } label: {
                HStack{
                    Image("google_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    Text("Continue with Google")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 280, height: 45)
                )
            }
            .padding(.top,24)
            
            HStack{
                VStack { Divider().background(.black) }.padding()
                
                Text("OR")
                    .foregroundColor(.gray)
                
                VStack { Divider().background(.black) }.padding()
            }
            .frame(width: 300)
            .padding(.top,22)
            
            Button{
                mainViewModel.status = .Login
            }label: {
                Text("Log In with email address")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
            }
            .padding(.top,22)
            
            
            HStack {
                Text("Don’t Have An Acount?")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                Button {
                    mainViewModel.status = .Register
                } label: {
                    Text("Sign Up")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding(.top,25)
            
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView()
    }
}
