//
//  SavedRecipesRowView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct SavedRecipesRowView: View {
    var recipe: SavedRecipeModel.Public
    
    var body: some View {
        VStack {
            HStack {
                Image(recipe.image)
                    .frame(width: 25, height: 25)
                    .cornerRadius(15)
                Text(recipe.userName)
                    .frame(maxWidth: 300, alignment: .leading)
                    .padding([.bottom], -5)
                    .foregroundColor(.gray)
            }
            VStack {
                Spacer()
                Text(recipe.desc)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 20)
                Spacer()
                HStack {
                    Text(recipe.title)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .none))
                        .padding([.leading, .trailing], 20)
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image("empty_heart")
                    }
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                    }
                    .padding(.trailing)
                    
                    Button {
                        //
                    } label: {
                        Image("save")
                    }
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                    }
                    .padding([.trailing], 30)
                }
                .padding([.bottom], 20)
                .frame(maxWidth: 350, maxHeight: 160, alignment: .bottomLeading)
                .background(
                    Image(recipe.photo)
                )
                .frame(width: 350, height: 160)
                .scaledToFill()
                .clipped()

            }
            .frame(width: 350, height: 220)
            .background(.white)
            .cornerRadius(8)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 4,
                x: 0,
                y: 4
            )
        }
    }
}

struct SavedRecipesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesRowView(recipe: SavedRecipeViewModel().getTempData1())
    }
}
