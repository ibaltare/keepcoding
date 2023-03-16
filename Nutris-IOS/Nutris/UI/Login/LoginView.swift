//
//  LoginView.swift
//  Nutris
//
//  Created by Nicolas on 18/02/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
            
            Text("Email Address")
                .font(.system(size: 17))
                .foregroundColor(.gray)
                .padding(.top, 65)
                .frame(width: 240, alignment: .leading)
            
            TextInput {
                Image(systemName: "envelope")
                TextField("Your Email Address", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .frame(width: 200)
            }.padding(.top, 20)
          
            Text("Password")
                .font(.system(size: 17))
                .foregroundColor(.gray)
                .padding(.top, 35)
                .frame(width: 240, alignment: .leading)
            
            TextInput {
                Image(systemName: "lock")
                SecureField("Your Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .frame(width: 200)
            }
            .padding(.top, 20)
            
            HStack {
                Text("Forgot password?")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                Button {
                    mainViewModel.status = .ForgotPassword
                } label: {
                    Text("Recover")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding(.top,50)
            
            PrimaryButton{
                Button {
                    mainViewModel.login(email: email, password: password)
                } label: {
                    Text("Login")
                }
            }
            .padding(.top, 170)
            
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
