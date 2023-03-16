//
//  OnboardingView.swift
//  Nutris
//
//  Created by Nicolas on 16/02/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            PageView(page: OnboardingPage(
                title: "Eat Healthy",
                description: "Maintaining good health should be the primary focus of everyone.",
                image: "eat_healthy",
                number: 1))
            PageView(page: OnboardingPage(
                title: "Healthy Recipes",
                description: "Browse thousands of healthy recipes from all over the world.",
                image: "healthy_recipes",
                number: 2))
            PageView(page: OnboardingPage(
                title: "Track Your Health",
                description: "With amazing inbuilt tools you can track your progress.",
                image: "track_health",
                number: 3))
        }
        .tabViewStyle(PageTabViewStyle())
        .transition(.opacity)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
