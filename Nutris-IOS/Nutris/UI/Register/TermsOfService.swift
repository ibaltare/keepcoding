//
//  TermsOfService.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

struct TermsOfService: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0){
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top, 50)
            
            Text("Terms of Service")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Text("Before we continue, please make sure you read and accept our terms of service and privacy policy.")
                .font(.system(size: 17))
                .multilineTextAlignment(.center)
                .opacity(0.45)
                .frame(width: 270,height: 70)
                .padding(.top, 40)
            
            Image("Accept-terms")
                .resizable()
                .scaledToFit()
                .frame(width: 295, height: 235)
                .padding(.top,20)
            
            PrimaryButton{
                Button {
                    mainViewModel.terms.toggle()
                    mainViewModel.register()
                } label: {
                    Text("Accept")
                }
            }
            .padding(.top,50)
            
            HStack {
                Text("Read")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                Button {
                    //TODO:
                    
                } label: {
                    Text("Terms of Service")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding(.top,25)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TermsOfService_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfService().environmentObject(MainViewModel(testing: true))
    }
}
