//
//  ForgotPasswordView.swift
//  Nutris
//
//  Created by Nicolas on 18/02/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
            
            Text("Forgot Password")
                .fontWeight(.semibold)
                .font(.system(size: 25))
                .padding(.top, 50)
            
            Text("Don’t worry! Enter your registered email below to receive a new password.")
                .multilineTextAlignment(.center)
                .font(.system(size: 17))
                .opacity(0.45)
                .frame(width: 270)
                .padding(.top, 25)
            
            Text("Email Address")
                .font(.system(size: 17))
                .foregroundColor(.gray)
                .padding(.top, 70)
                .frame(width: 240, alignment: .leading)
            
            TextInput {
                Image(systemName: "envelope")
                TextField("Your Email Address", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .frame(width: 200)
            }.padding(.top, 20)
            
            PrimaryButton{
                Button {
                    //TODO: mainViewModel.status = .LoginForm
                } label: {
                    Text("Recover")
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
