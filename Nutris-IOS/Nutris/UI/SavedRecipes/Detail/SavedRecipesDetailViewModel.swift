//
//  SavedRecipesDetailViewModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import Foundation
import Combine

class SavedRecipesDetailViewModel: ObservableObject {
    @Published var recipe: Recipe.Detail?
    @Published var status: DetailStatus = .none
    
    private var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool? = false) {
        if (testing!) {
            self.getRecipeForTest()
        }
    }
    
    func getIngredientTest() -> [Ingredient]{
        return [Ingredient(
                amount: "4 tbsp",
                id: 1,
                recipe: Recipe.RecipeId(id: 1),
                ingredient: "balsamic vinegar",
                idRecipe: 1),
            Ingredient(
                amount: "1/4 tsp",
                id: 2,
                recipe: Recipe.RecipeId(id: 1),
                ingredient: "cayenne pepper",
                idRecipe: 1),
            Ingredient(
                amount: "2 lb",
                id: 3,
                recipe: Recipe.RecipeId(id: 1),
                ingredient: "ground beef",
                idRecipe: 1)
        ]
    }
    
    func getStepTest() -> [RecipeStep]{
        return [RecipeStep(id: 1,
                 recipe: Recipe.RecipeId(id: 1),
                 step: 1,
                 description: "Preheat oven to 350° and grease a 9'-x-5' loaf pan with cooking spray.",
                       idRecipe: 1),
            RecipeStep(id: 2,
                 recipe: Recipe.RecipeId(id: 2),
                 step: 2,
                 description: "In a large bowl, combine vegetable mixture.",
                       idRecipe: 2),
            RecipeStep(id: 3,
                 recipe: Recipe.RecipeId(id: 3),
                 step: 3,
                 description: "In a small bowl, whisk together ketchup and brown sugar.",
                       idRecipe: 3)
        ]
    }
    
    func getRecipeForTest() {
        DispatchQueue.main.async {
            self.recipe = Recipe.Detail(rating: 1,
                                        id: 2,
                                        proteins: 3,
                                        calories: 4,
                                        desc: "desctest",
                                        carbs: 4,
                                        fats: 4,
                                        title: "Title",
                                        ingredients: [
                                            Ingredient(
                                                amount: "2",
                                                id: 1,
                                                recipe: Recipe.RecipeId(id: 1),
                                                ingredient: "ingredient 1",
                                                idRecipe: 1),
                                            Ingredient(
                                                amount: "6",
                                                id: 2,
                                                recipe: Recipe.RecipeId(id: 1),
                                                ingredient: "ingredient 2",
                                                idRecipe: 1),
                                            Ingredient(
                                                amount: "8",
                                                id: 3,
                                                recipe: Recipe.RecipeId(id: 1),
                                                ingredient: "ingredient 3",
                                                idRecipe: 1),
                                            Ingredient(
                                                amount: "4",
                                                id: 4,
                                                recipe: Recipe.RecipeId(id: 1),
                                                ingredient: "ingredient 4",
                                                idRecipe: 1)
                                        ],
                                        duration: 4,
                                        photo: "",
                                        steps: [
                                            RecipeStep(id: 1,
                                                 recipe: Recipe.RecipeId(id: 1),
                                                 step: 1,
                                                 description: "descstep1",
                                                       idRecipe: 1),
                                            RecipeStep(id: 2,
                                                 recipe: Recipe.RecipeId(id: 2),
                                                 step: 2,
                                                 description: "descstep2",
                                                       idRecipe: 2),
                                            RecipeStep(id: 3,
                                                 recipe: Recipe.RecipeId(id: 3),
                                                 step: 3,
                                                 description: "descstep3",
                                                       idRecipe: 3),
                                            RecipeStep(id: 4,
                                                 recipe: Recipe.RecipeId(id: 4),
                                                 step: 4,
                                                 description: "descstep4",
                                                       idRecipe: 4)
                                        ]
            )
            self.status = .done
        }
    }
}
