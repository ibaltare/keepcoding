//
//  MainTabView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 22/02/23.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.init(Color("PrimaryDark"))
        UITabBar.appearance().backgroundColor = UIColor.init(Color("PrimaryDark"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(Color("TabIcon"))
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                DashboardView(viewModel: DashboardViewModel()).tabItem {
                    VStack {
                        Text("Dashboard")
                        Image("DashboardItem").renderingMode(.template)
                    }
                }
                
                ProfileView(viewModel: ProfileViewModel()).tabItem {
                    VStack {
                        Text("Profile")
                        Image("ProfileItem").renderingMode(.template)
                    }
                }
                
                SavedRecipesView(viewModel: SavedRecipeViewModel()).tabItem {
                    VStack {
                        Text("Saved Recipes")
                        Image("SavedItem").renderingMode(.template)
                    }
                }
                
                ExercisesView(viewModel: ExerciseViewModel()).tabItem {
                    VStack {
                        Text("Exercises")
                        Image("ExerciseItem").renderingMode(.template)
                    }
                }
                
                GroupsView().tabItem {
                    VStack {
                        Text("Groups")
                        Image("GroupsItem").renderingMode(.template)
                    }
                }
            }
            .accentColor(.white)
            .tint(.white)
        }
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

