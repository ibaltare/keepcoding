//
//  RecipeModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 9/03/23.
//

import Foundation

//struct Recipe {
//    struct RowRecipe {
//        let id: String
//        let menu: String
//        let title: String
//        let desc: String
//        let rating: Int
//        let duration: Int
//        let difficulty: String
//    }
//    struct DetailRecipe {
//        let id: String
//        let title: String
//        let desc: String
//        let ingredients: [Ingredient]
//        let steps: [Step]
//        let rating: Int
//        let duration: Int
//        let difficulty: String
//    }
//}
//
//struct Ingredient: Identifiable {
//    let id = UUID()
//    let name: String
//    let amount: String
//}
//
//struct Step: Identifiable {
//    let id = UUID()
//    let stepNum: Int
//    let stepDesc: String
//}

struct Recipe {
    struct Dashboard: Decodable {
        let id: Int
        let rating: Int
        let title: String
        let duration: Int
        let photo: String
        let desc: String
        let food: String
    }
    
    struct Detail: Decodable {
        let rating, id, proteins, calories: Int
        let desc: String
        let carbs, fats: Int
        let title: String
        let ingredients: [Ingredient]
        let duration: Int
        let photo: String
        let steps: [RecipeStep]
    }
    
    struct RecipeId: Decodable {
        let id: Int
    }
}

// MARK: - Ingredient
struct Ingredient: Decodable, Identifiable {
    let amount: String
    let id: Int
    let recipe: Recipe.RecipeId
    let ingredient: String
    let idRecipe: Int

    enum CodingKeys: String, CodingKey {
        case amount, id, recipe, ingredient
        case idRecipe = "id_recipe"
    }
}

// MARK: - Step
struct RecipeStep: Decodable, Identifiable {
    let id: Int
    let recipe: Recipe.RecipeId
    let step: Int
    let description: String
    let idRecipe: Int

    enum CodingKeys: String, CodingKey {
        case id, recipe, step, description
        case idRecipe = "id_recipe"
    }








    //    struct Detail: Decodable {
    //        let rating: Int
    //        let id: Int
    //        let proteins: Int
    //        let calories: Int
    //        let desc: String
    //        let carbs: Int
    //        let fats: Int
    //        let title: String
    //        let ingredients: [Ingredient]
    //        let duration: Int
    //        let photo: String
    //        let steps: [RecipeStep]
    //    }
    }

    //struct Ingredient: Decodable, Identifiable {
    //    let amount: String
    //    let id: Int
    //    let ingredient: String
    //    let recipe: Recipe.RecipeId
    //    let id_recipe: Int
    //}
    //struct RecipeStep: Decodable, Identifiable {
    //    let id: Int
    //    let recipe: Recipe.RecipeId
    //    let step: Int
    //    let description: String
    //    let id_recipe: Int
    //}
