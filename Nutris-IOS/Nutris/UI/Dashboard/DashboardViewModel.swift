//
//  DashboardViewModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 21/02/23.
//

import Foundation
import Combine

enum dashboardStatus {
    case done, none
}

class DashboardViewModel: ObservableObject {
    
    //TODO: Recipe Model
    //Cada vez que de al boton de refresh, se guardara el id de la receta y se pedira otra receta excluyendo a las ya refrescadas.
    @Published var breakfastRecipe: Recipe.Dashboard?
    @Published var lunchRecipe: Recipe.Dashboard?
    @Published var dinnerRecipe: Recipe.Dashboard?
    
    var breakfastArray: [Recipe.Dashboard] = []
    var lunchArray: [Recipe.Dashboard] = []
    var dinnerArray: [Recipe.Dashboard] = []
    
    @Published var status: dashboardStatus = .none
    
    init(testing: Bool = false) {
        if (testing) {
            getRecipesForTest()
            setRecipes()
        }
    }
    
    var suscriptors = Set<AnyCancellable>()
    
    private func setRecipes() {
        if self.breakfastArray.isEmpty {return}
        DispatchQueue.main.async {
            self.breakfastRecipe = self.breakfastArray[Int.random(in: 0...self.breakfastArray.count-1)]
            self.lunchRecipe = self.lunchArray[Int.random(in: 0...self.lunchArray.count-1)]
            self.dinnerRecipe = self.dinnerArray[Int.random(in: 0...self.dinnerArray.count-1)]
        }
    }
    
    func popRecipe(id: Int, food: String) {
        print(id, food)
        switch(food) {
        case "Breakfast":
            breakfastArray.removeAll{$0.id == id}
            breakfastArray.isEmpty ? self.getAllRecipes() : self.setRecipes()
        case "Lunch":
            lunchArray.removeAll{$0.id == id}
            lunchArray.isEmpty ? self.getAllRecipes() : self.setRecipes()
        case "Dinner":
            dinnerArray.removeAll{$0.id == id}
            dinnerArray.isEmpty ? self.getAllRecipes() : self.setRecipes()
        default:
            break;
        }
    }
    
    func getAllRecipes() {
        //TODO: Llamada a API
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionDashboard())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Recipe.Dashboard].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .done
                    print("Recetas obtenidas")
                case .failure(_):
                    print("Error al obtener recetas")
                }
            } receiveValue: { data in
                data.forEach { recipe in
                    switch(recipe.food) {
                    case "Breakfast":
                        self.breakfastArray.append(recipe)
                    case "Lunch":
                        self.lunchArray.append(recipe)
                    case "Dinner":
                        self.dinnerArray.append(recipe)
                    default:
                        break
                    }
                }
                print(data)
                print("este es el LUNCH",self.lunchArray)
                print("este es el BREAK",self.breakfastArray)
                print("este es el DINNER",self.dinnerArray)
                self.setRecipes()
            }
            .store(in: &suscriptors)
    }
    
    func getRecipesForTest() {
        breakfastArray.append(Recipe.Dashboard(id: 1, rating: 2, title: "Breakfast1", duration: 2, photo: "", desc: "Desciption Breakfast1", food: "Breakfast"))
        lunchArray.append(Recipe.Dashboard(id: 2, rating: 5, title: "Lunch1", duration: 2, photo: "", desc: "Desciption Breakfast1", food: "Lunch"))
        dinnerArray.append(Recipe.Dashboard(id: 3, rating: 4, title: "Dinner1", duration: 2, photo: "", desc: "Desciption Dinner1", food: "Dinner"))
    }
}
