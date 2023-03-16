//
//  MainViewModel.swift
//  Nutris
//
//  Created by Nicolas on 16/02/23.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI

final class MainViewModel: ObservableObject {
    @Published var status = Status.Splash
    
    var goals: [Goal] = []
    var activities: [Activity] = []
    var countries: [DropDownModel] = []
    var genders: [String] = ["Male", "Female"]
    var allergies: [Allergy.App] = []
    
    //MARK: Register Variables
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var photo: String = ""
    @Published var photoExtension: String = "jpeg"
    @Published var countryId: Int = 0
    @Published var goalId: Int = 0
    @Published var activityId: Int = 0
    @Published var terms: Bool = false
    @Published var allergiesIds: [Allergy.Server] = []
    //
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            if let photo = selectedPhoto {
                processPhoto(photo: photo)
            }
        }
    }
    
    private var suscriptors = Set<AnyCancellable>()
    
    static func cancel(suscriptor:  inout Set<AnyCancellable>){
        suscriptor.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
    
    init(testing: Bool = false) {
        if (!testing) {
            getCountries()
            getGoals()
            getActivities()
            getAllergies()
        } else {
            setUpForTest()
        }
    }
    
    func login(email: String, password: String) {
        let data = UserModel.LoginModel(email: email, password: password)
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLoginUser(creds: data))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                print("Status Code: \(response.statusCode)")
                return $0.data
            }
            .decode(type: UserModel.Tokens.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Se inicio sesion correctamente")
                    self.status = .Dashboard
                case .failure(let err):
                    print("Ha ocurrido un error al iniciar sesion: \(err)")
                }
            } receiveValue: { data in
                saveToken(token: data.accessToken, type: .access)
                saveToken(token: data.refreshToken, type: .refresh)
            }
            .store(in: &suscriptors)
        
    }
    
    func register() {
        let data = UserModel.RegisterModel(fullname: self.fullname,
                                           email: self.email,
                                           password: self.password,
                                           age: Int(self.age)!,
                                           gender: self.gender,
                                           weight: Float(self.weight)!,
                                           height: Int(self.height)!,
                                           photo: self.photo,
                                           ext: self.photoExtension,
                                           countryId: self.countryId,
                                           goalId: self.goalId,
                                           activityId: self.activityId,
                                           terms: self.terms,
                                           allergies: self.allergiesIds)
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionRegisterUser(data: data))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: UserTokensModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Se registro correctamente")
                    self.status = .Dashboard
                case .failure(let err):
                    print("Ha ocurrido un error en el registro: \(err)")
                }
            } receiveValue: { data in
                saveToken(token: data.accessToken, type: .access)
                saveToken(token: data.refreshToken, type: .refresh)
            }
            .store(in: &suscriptors)
        
    }
    
    private func getCountries() {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionCountry())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Paises obtenidos")
                case .failure(let err):
                    print("Ha ocurrido un error al obtener los paises: \(err)")
                }
            } receiveValue: { data in
                let mappedData: [DropDownModel] = data.map{DropDownModel(id: $0.id, name: $0.country)}
                self.countries = mappedData
            }
            .store(in: &suscriptors)
        
    }
    
    private func getGoals() {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionGoal())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Goal].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Goals obtenidos")
                case .failure(let err):
                    print("Ha ocurrido un error al obtener los goals: \(err)")
                }
            } receiveValue: { data in
                self.goals = data
            }
            .store(in: &suscriptors)
        
    }
    
    private func getActivities() {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionActivity())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Activity].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Activities obtenidos")
                case .failure(let err):
                    print("Ha ocurrido un error al obtener los activities: \(err)")
                }
            } receiveValue: { data in
                self.activities = data
            }
            .store(in: &suscriptors)
        
    }
    
    private func getAllergies() {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionAllergy())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Allergy.App].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Allergies obtenidas")
                case .failure(let err):
                    print("Ha ocurrido un error al obtener las allergies: \(err)")
                }
            } receiveValue: { data in
                self.allergies = data
            }
            .store(in: &suscriptors)
        
    }
    
    private func setUpForTest() {
        DispatchQueue.main.async {
            self.goals = [Goal(id: 1, goal: "Lose Fat"),
                                 Goal(id: 2, goal: "Maintain Weight"),
                                 Goal(id: 3, goal: "Body Volume"),
                                 Goal(id: 4, goal: "Improve Feeding")]
            self.activities = [Activity(activity: "Light", id: 1),
                                          Activity(activity: "Moderate", id: 2),
                                          Activity(activity: "Heavy", id: 3)]
            self.countries = [DropDownModel(id: 1, name: "Peru"),
                                              DropDownModel(id: 2, name: "Colombia")]
            self.genders = ["Male", "Female"]
            self.allergies = [Allergy.App(id: 1, allergy: "Gluten"),
                                             Allergy.App(id: 2, allergy: "Diary"),
                                             Allergy.App(id: 3, allergy: "Egg"),
                                             Allergy.App(id: 4, allergy: "Seafood"),
                                             Allergy.App(id: 5, allergy: "Fish"),
                                             Allergy.App(id: 6, allergy: "Nuts"),
                                             Allergy.App(id: 7, allergy: "Soy")]
        }
    }
    
    private func processPhoto(photo: PhotosPickerItem) {
        photo.loadTransferable(type: Data.self) { result in
            switch result {
            case .success(let data):
                if let data, let image = UIImage(data: data) {
                    let imageData: Data = image.jpegData(compressionQuality: 0.1) ?? Data()
                    let phototest = imageData.base64EncodedString()
                    DispatchQueue.main.async {
                        self.photo = phototest
                    }
                }
            case .failure(let err):
                print("Hubo un erro al procesar la imagen: \(err)")
            }
        }
    }
}
