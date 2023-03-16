//
//  DashboardDetailView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 21/02/23.
//

import SwiftUI

struct DashboardDetailView: View {
    @StateObject var viewModel: DashboardDetailViewModel
    @State private var commentText = ""
    
    var id: Int?
        
    var body: some View {
        switch(viewModel.status) {
        case .none:
            let _ = viewModel.getRecipeById(id: id ?? 0)
        case .done:
            ScrollView {
                AsyncImage(url: URL(string: server + (viewModel.recipe?.photo ?? ""))) { photoDownload in
                    photoDownload
                        .resizable()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                }
                
                HStack{
                    Image("clock")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("\(viewModel.recipe?.duration ?? 0)min")
                        .font(.system(size: 13, weight: .regular, design: .none))
                    //Barras de dificultad*
                    Image("difficulty")
                        .resizable()
                        .frame(width: 18, height: 18)
                    //Estrellas*
                    Image("rating")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding([.trailing], 10)
                }
                HStack{
                    Spacer()
                    Text(viewModel.recipe?.title ?? "")
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
                    Text(viewModel.recipe?.desc ?? "")
                        .foregroundColor(.gray.opacity(1))
                        .font(.system(size: 17, weight: .regular, design: .none))
                    
                    Text("Ingredients")
                        .font(.system(size: 20, weight: .semibold, design: .none))
                        .multilineTextAlignment(.leading)
                    VStack {
                        ForEach(viewModel.recipe?.ingredients ?? []) { ingredient in
                            Text("\(ingredient.ingredient) \(ingredient.amount)")
                                .font(.system(size: 17, weight: .regular, design: .none))
                                .foregroundColor(.gray.opacity(1))
                                .padding([.top, .bottom], -4)
                        }
                    }
                    .padding([.bottom], 10)
                    
                    Text("Steps")
                        .font(.system(size: 20, weight: .semibold, design: .none))
                    ForEach(viewModel.recipe?.steps ?? []) { recipeStep in
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
}

struct DashboardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardDetailView(viewModel: DashboardDetailViewModel(testing: true))
    }
}
