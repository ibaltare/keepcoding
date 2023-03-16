//
//  SplashView.swift
//  Nutris
//
//  Created by Nicolas on 16/02/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            Text("Nutris")
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 64))
            
            Image("splash")
                .resizable()
                .scaledToFit()
                .frame(width: 245, height: 245)
                .padding(.top,50)
            
            Text("Healthy habits")
                .fontWeight(.heavy)
                .foregroundColor(Color("PrimaryLight"))
                .font(.custom("Nunito-ExtraBold", size: 25))
                .padding(.top,115)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color("Primary"))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
