//
//  SavedRecipes.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct SavedRecipesView: View {
    @StateObject var viewModel: SavedRecipeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    NavigationLink {
                        SavedRecipesDetailView(recipe: viewModel.getTempData1())
                    } label: {
                        SavedRecipesRowView(recipe: viewModel.getTempData1())
                    }
                    NavigationLink {
                        SavedRecipesDetailView(recipe: viewModel.getTempData2())
                    } label: {
                        SavedRecipesRowView(recipe: viewModel.getTempData2())
                    }
                    NavigationLink {
                        SavedRecipesDetailView(recipe: viewModel.getTempData3())
                    } label: {
                        SavedRecipesRowView(recipe: viewModel.getTempData3())
                    }
                }
            }
        }
    }
}

struct SavedRecipes_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView(viewModel: SavedRecipeViewModel())
    }
}
