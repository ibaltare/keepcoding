//
//  DashboardView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

struct DashboardView: View {

    @StateObject var viewModel: DashboardViewModel

    var body: some View {
        switch(viewModel.status) {
        case .none:
            LoadingView()
            let _ = viewModel.getAllRecipes()
        case .done:
            NavigationStack {
                //MARK: Cambiar Dias
                HStack {
                    Button {
                        //TODO: Dia anterior
                    } label: {
                        Image("Arrow_btn")
                            .rotationEffect(Angle(degrees: 180))
                    }
                    Text("Monday")
                        .padding([.leading, .trailing], 20)
                    Button {
                        //TODO: Siguiente dia
                    } label: {
                        Image("Arrow_btn")
                    }

                }
                //MARK: Cambiar Dias
                ScrollView(showsIndicators: false) {
                    //MARK: Menu de Recetas
                    //RecipeCardBreakFast
                    VStack(spacing: 20) {
                        NavigationLink {
                            DashboardDetailView(viewModel: DashboardDetailViewModel(), id: viewModel.breakfastRecipe?.id)
                        } label: {
                            DashboardRowView(viewModel: viewModel, recipe: viewModel.breakfastRecipe)
                        }
                        //RecipeCardBreakFast

                        //RecipeCardLunch
                        NavigationLink {
                            DashboardDetailView(viewModel: DashboardDetailViewModel(), id: viewModel.lunchRecipe?.id)
                        } label: {
                            DashboardRowView(viewModel: viewModel, recipe: viewModel.lunchRecipe)
                        }
                        //RecipeCardLunch

                        //RecipeCardDinner
                        NavigationLink {
                            DashboardDetailView(viewModel: DashboardDetailViewModel(), id: viewModel.dinnerRecipe?.id)

                        } label: {
                            DashboardRowView(viewModel: viewModel, recipe: viewModel.dinnerRecipe)
                        }
                        //RecipeCardDinner
                    }
                }
                //MARK: Menu de Recetas
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel(testing: true))
    }
}
