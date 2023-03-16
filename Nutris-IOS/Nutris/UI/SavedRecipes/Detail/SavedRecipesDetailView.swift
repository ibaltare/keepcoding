//
//  SavedRecipesDetailView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct SavedRecipesDetailView: View {
    
    @StateObject private var viewModel = SavedRecipesDetailViewModel()
    @State private var commentText = ""
    
    var recipe: SavedRecipeModel.Public
    
    var body: some View {
        ScrollView {
            Image(recipe.photo)
                .resizable()
                .frame(height: 200)
                .frame(maxWidth: .infinity)
            
            HStack{
                Image("clock")
                    .resizable()
                    .frame(width: 18, height: 18)
                //          Text("\(viewModel.breakFastRecipe[viewModel.breakFastRecipe.count - 1].duration) min")
                Text("3min")
                    .font(.system(size: 13, weight: .regular, design: .none))
                //Barras de dificultad*
                //viewModel.breakFastRecipe[viewModel.breakFastRecipe.count - 1].difficulty
                Image("difficulty")
                    .resizable()
                    .frame(width: 18, height: 18)
                //Estrellas*
                //viewModel.breakFastRecipe[viewModel.breakFastRecipe.count - 1].rating
                Image("rating")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding([.trailing], 10)
            }
            HStack{
                Spacer()
                Text(recipe.title)
                    .font(.system(size: 20, weight: .semibold, design: .none))
                    .padding(.leading)
                    .offset(x: 10)
                Spacer()
                Button {
                    //Guardar receta
                } label: {
                    Image("save")
                        .resizable()
                        .frame(width: 16, height: 24)
                }
                .padding(.trailing)
                
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Delicious Mediterranean recipe made by marinating fish fillets in garlic, green chilies and blend of spices. Tender fish fillets smeared in a simple marinade of lime juice and salt, seared golden. Delicious, isn’t it?")
                    .foregroundColor(.gray.opacity(1))
                    .font(.system(size: 17, weight: .regular, design: .none))
                
                Text("Ingredients")
                    .font(.system(size: 20, weight: .semibold, design: .none))
                VStack {
                    ForEach(viewModel.getIngredientTest()) { ingredient in
                        Text("\(ingredient.ingredient) \(ingredient.amount)")
                            .font(.system(size: 17, weight: .regular, design: .none))
                            .foregroundColor(.gray.opacity(1))
                            .padding([.top, .bottom], -4)
                    }
                }
                .padding([.bottom], 10)
                
                Text("Steps")
                    .font(.system(size: 20, weight: .semibold, design: .none))
                ForEach(viewModel.getStepTest()) { recipeStep in
                    HStack {
                        Text("Step")
                            .font(.system(size: 17, weight: .semibold, design: .none))
                            .padding(.trailing)
                        Text("\(recipeStep.step)")
                            .font(.system(size: 14, weight: .semibold, design: .none))
                            .background {
                                Circle()
                                    .frame(width: 27, height: 27)
                                    .foregroundColor(.green.opacity(0.7))
                            }
                    }
                    Text(recipeStep.description)
                        .font(.system(size: 17, weight: .regular, design: .none))
                        .foregroundColor(.gray.opacity(1))
                }
                HStack {
                    Text("Do you like the recipe?")
                        .font(.system(size: 17, weight: .bold, design: .none))
                    Button {
                        //Llenar estrellas y guardar calificaion de la receta
                    } label: {
                        Image("Star")
                    }
                    .frame(width: 32, height: 32)
                    
                    Button {
                        //Llenar estrellas y guardar calificaion de la receta
                    } label: {
                        Image("Star")
                    }
                    .frame(width: 32, height: 32)
                    
                    Button {
                        //Llenar estrellas y guardar calificaion de la receta
                    } label: {
                        Image("Star")
                    }
                    .frame(width: 32, height: 32)
                    
                }
                TextField("", text: $commentText)
                    .frame(height: 80)
                    .border(.black)
                Button {
                    //action
                } label: {
                    Text("Upload photo & win points")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.orange)
            }
            .padding([.leading, .trailing], 10)
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: TabBarButtonBack(), trailing: CustomLikeButton())
    }
}

struct SavedRecipesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesDetailView(recipe: SavedRecipeViewModel().getTempData1())
    }
}
