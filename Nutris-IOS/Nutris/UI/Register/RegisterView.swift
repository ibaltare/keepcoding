//
//  RegisterView.swift
//  Nutris
//
//  Created by Nicolas on 18/02/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 0){
                Text("Nutris")
                    .foregroundColor(Color("Primary"))
                    .fontWeight(.heavy)
                    .font(.custom("Nunito-ExtraBold", size: 48))
                    .padding(.top, 50)
                
                Text("The Basics")
                    .fontWeight(.semibold)
                    .font(.system(size: 25))
                    .padding(.top, 45)
                
                Text("Let’s start with the basic. Note: you cannot change these details later.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                    .opacity(0.45)
                    .frame(width: 270,height: 55)
                    .padding(.top, 25)
                
                Text("Email Address")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .padding(.top, 35)
                    .frame(width: 240, alignment: .leading)
                
                TextInput {
                    Image(systemName: "envelope")
                    TextField("Your Email Address", text: $mainViewModel.email)
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
                    SecureField("Your Password", text: $mainViewModel.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .frame(width: 200)
                }
                .padding(.top, 20)
                
                TextInput {
                    Image(systemName: "lock")
                    SecureField("Repeat Your Password", text: $confirmPassword)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .frame(width: 200)
                }
                .padding(.top, 40)
                    NavigationLink{
                        PartOneView()
                            .environmentObject(mainViewModel)
                    } label: {
                        PrimaryButton{
                            Text("Next")
                        }
                    }
                    .padding(.top,65)
                    .disabled(!(!mainViewModel.email.isEmpty && mainViewModel.password == confirmPassword && !confirmPassword.isEmpty && !mainViewModel.password.isEmpty))
                
                HStack {
                    Text("Already Have An Acount?")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                    Button {
                        mainViewModel.status = .Login
                    } label: {
                        Text("Log In")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))
                    }
                }
                .padding(.top,25)
                
            }
            
            VStack(spacing: 0) {
                ProgressBar(value: 0.125).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(MainViewModel(testing: true))
    }
}
