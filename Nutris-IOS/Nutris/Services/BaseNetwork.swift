//
//  BaseNetwork.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 6/03/23.
//

import Foundation

let server = "http://127.0.0.1:8080"

struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
    static let apiKey = "YFjOSZLW7c4cCQLDyvX2rdmbkbZTU5sQasjvranUZtM="
}

enum endpoints: String {
    case register = "/v1/users/register"
    case login = "/v1/users/login"
    case refreshToken = "/v1/users/refresh"
    case country = "/v1/cat/country"
    case goal = "/v1/cat/goal"
    case activity = "/v1/cat/activity"
    case allergy = "/v1/cat/allergy"
    case dashboard = "/v1/diet"
    case recipe = "/v1/recipe/"
    case profile = "/v1/users/profile"
}

struct BaseNetwork {
    
    func getSessionRegisterUser(data: UserModel.RegisterModel) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.register.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.post
        
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        request.httpBody = try? JSONEncoder().encode(data)
        
        return request
    }
    
    func getSessionLoginUser(creds: UserModel.LoginModel) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.login.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        let regExpCreds = String(format: "%@:%@", creds.email, creds.password)
        guard let encodedCreds = regExpCreds.data(using: .utf8) else {
            print("Error at encoding creds")
            return URLRequest(url: URL(string: "")!)
        }
        let base64Creds = encodedCreds.base64EncodedString()
        
        request.httpMethod = HTTPMethods.post
        
        request.addValue("Basic \(base64Creds)", forHTTPHeaderField: "Authorization")
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionRefreshToken(refreshToken: String) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.refreshToken.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue("Bearer \(refreshToken)", forHTTPHeaderField: "Authorization")
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionCountry() -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.country.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionGoal() -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.goal.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionActivity() -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.activity.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionAllergy() -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.allergy.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionDashboard() -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.dashboard.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        let token = getToken(type: .access)
        guard token != "" else {
            print("No se encontro AccessToken")
            return URLRequest(url: URL(string: "")!)
        }
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionRecipeById(recipeId: Int) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.recipe.rawValue)\(recipeId)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        let token = getToken(type: .access)
        guard token != "" else {
            print("No se encontro AccessToken")
            return URLRequest(url: URL(string: "")!)
        }
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
    
    func getSessionProfile() -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.profile.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        
        let token = getToken(type: .access)
        guard token != "" else {
            print("No se encontro AccessToken")
            return URLRequest(url: URL(string: "")!)
        }
        
        request.httpMethod = HTTPMethods.get
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue(HTTPMethods.apiKey, forHTTPHeaderField: "Nts-ApiKey")
        
        return request
    }
}
