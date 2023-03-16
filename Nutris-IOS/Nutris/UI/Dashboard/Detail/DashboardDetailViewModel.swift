//
//  DashboardDetailViewModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 21/02/23.
//

import Foundation
import Combine

enum DetailStatus {
    case none, done
}

class DashboardDetailViewModel: ObservableObject {
    @Published var recipe: Recipe.Detail?
    @Published var status: DetailStatus = .none
    
    private var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool? = false) {
        if (testing!) {
            self.getRecipeForTest()
        }
    }
    
    func getRecipeById(id: Int) {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionRecipeById(recipeId: id))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: Recipe.Detail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .done
                    print("Receta obtenida correctament")
                case .failure(let err):
                    print("Ha ocurrido un error al obtener la receta: \(err)")
                }
            } receiveValue: { data in
                self.recipe = data
            }
            .store(in: &suscriptors)
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
        }
    }
}
