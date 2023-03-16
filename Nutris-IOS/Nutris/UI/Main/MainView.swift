//
//  MainView.swift
//  Nutris
//
//  Created by Nicolas on 16/02/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        switch (mainViewModel.status){
        case .Splash:
            SplashView()
                .onTapGesture {
                    mainViewModel.status = .Onboarding
                }
                .transition(.opacity)
        case .Onboarding:
            OnboardingView()
                .transition(.opacity)
        case .LoginForm:
            LoginFormView()
                .transition(.opacity)
        case .Login:
            LoginView()
                .transition(.opacity)
        case .ForgotPassword:
            ForgotPasswordView()
                .transition(.opacity)
        case .Register:
            RegisterView()
                .environmentObject(mainViewModel)
                .transition(.opacity)
        case .Dashboard:
            //TODO: Reemplazar por tabbar
            MainTabView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MainViewModel())
    }
}
