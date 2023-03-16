//
//  DashboardRowView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 22/02/23.
//

import SwiftUI

struct DashboardRowView: View {
    @ObservedObject var viewModel: DashboardViewModel
    var recipe: Recipe.Dashboard?

    var body: some View {
        VStack {
            Text(recipe?.food ?? "")
                .frame(maxWidth: 280, alignment: .leading)
                .padding([.bottom], -5)
                .foregroundColor(.gray)

            //RecipeCardBreakFast
            VStack {
                AsyncImage(url: URL(string: server + (recipe?.photo ?? ""))) { photoDownload in
                    photoDownload
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 90)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 90)
                        .clipped()
                }
                HStack {
                    Text(recipe?.title ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold, design: .none))
                        .padding([.leading], 10)
                    Spacer()
                    Image("clock")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("\(recipe?.duration ?? 0) min")
                        .foregroundColor(.gray)
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
                Text(recipe?.food ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 17, weight: .regular, design: .none))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading], 10)
                HStack {
                    Text(recipe?.desc ?? "")
                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14, weight: .regular, design: .none))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .truncationMode(.tail)
                    Button {
                        //TODO: LLamada para cambiar de receta la receta
                        viewModel.popRecipe(id: recipe?.id ?? 0, food: recipe?.food ?? "")
                    } label: {
                        Image("refresh")
                            .resizable()
                            .frame(width: 19, height: 19)
                    }
                }
                .padding([.leading, .trailing], 10)
                .padding(.bottom, 20)
                Spacer()

            }
            .frame(width: 300, height: 200)
            .background(.white)
            .cornerRadius(8)
            .shadow(
                color: Color.gray.opacity(0.4),
                radius: 4,
                x: 0,
                y: 4
            )
        }
    }
}

struct DashboardRowView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardRowView(viewModel: DashboardViewModel(testing: true), recipe: Recipe.Dashboard(id: 1, rating: 2, title: "Breakfast1", duration: 2, photo: "/imageRecipes/SalmonBowl.jpg", desc: "kljasndkljasndkljasndjklasndjklnasldjknaskldjnaslkdjnaslkjdnaslkjdnalskjdnlaskdjnalskjdnlaksjdnlaksjdnlaksjdn", food: "breakfast"))
    }
}
