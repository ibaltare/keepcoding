//
//  PartSevenView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

struct PartSevenView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0){
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top, 50)
            
            Text("All ready!")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Text("Your plan has been configured correctly, you will be able to change the configuration of your plan by purchasing Nutris Pro.")
                .font(.system(size: 17))
                .multilineTextAlignment(.center)
                .opacity(0.45)
                .frame(width: 270,height: 100)
                .padding(.top, 40)
            
            Image("High-five")
                .resizable()
                .scaledToFit()
                .frame(width: 295, height: 235)
                .padding(.top,20)
            
            NavigationLink{
                TermsOfService()
                    .environmentObject(mainViewModel)
            } label: {
                PrimaryButton{
                    Text("Finish")
                }
            }
            .padding(.top,80)
            .padding(.bottom, 20)
            
            VStack(spacing: 0) {
                ProgressBar(value: 1.0).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct PartSevenView_Previews: PreviewProvider {
    static var previews: some View {
        PartSevenView().environmentObject(MainViewModel(testing: true))
    }
}
