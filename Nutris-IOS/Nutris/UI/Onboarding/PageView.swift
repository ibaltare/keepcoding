//
//  PageView.swift
//  Nutris
//
//  Created by Nicolas on 16/02/23.
//

import SwiftUI

struct PageView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    var page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
            
            Image(page.image)
                .resizable()
                .scaledToFit()
                .frame(width: 295, height: 235)
                .padding(.top,55)
            
            Text(page.title)
                .fontWeight(.bold)
                .font(.system(size: 25))
                .padding(.top,55)
            
            Text(page.description)
                .font(.system(size: 17))
                .frame(width: 272)
                .opacity(0.45)
                .padding(.top,15)
            
            HStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("Secondary"))
                    .if(page.number == 1, transform: { view in
                        view.frame(width: 20, height: 10)
                    })
                    .if(page.number != 1, transform: { view in
                        view.frame(width: 12, height: 8)
                            .opacity(0.80)
                    })
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("Secondary"))
                    .if(page.number == 2, transform: { view in
                        view.frame(width: 20, height: 10)
                    })
                    .if(page.number != 2, transform: { view in
                        view.frame(width: 12, height: 8)
                            .opacity(0.80)
                    })
            
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("Secondary"))
                    .if(page.number == 3, transform: { view in
                        view.frame(width: 20, height: 10)
                    })
                    .if(page.number != 3, transform: { view in
                        view.frame(width: 12, height: 8)
                            .opacity(0.80)
                    })
            }
            .padding(.top,15)
            
            PrimaryButton{
                Button {
                    mainViewModel.status = .LoginForm
                } label: {
                    Text("Get Started")
                }
            }
            .padding(.top,50)
            
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView( page: OnboardingPage(title: "Eat Healthy", description: "Maintaining good health should be the primary focus of everyone.", image: "eat_healthy", number: 1) )
    }
}
