//
//  RegisterModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 6/03/23.
//

import Foundation
struct UserModel {
    struct RegisterModel: Encodable {
        let fullname: String
        let email: String
        var password: String
        let age: Int
        let gender: String
        let weight: Float
        let height: Int
        let photo: String
        let ext: String
        let countryId: Int
        let goalId: Int
        let activityId: Int
        let terms: Bool
        let allergies: [Allergy.Server]
    }
    
    struct LoginModel: Encodable {
        let email: String
        let password: String
    }
    
    struct Tokens: Decodable {
        let refreshToken: String
        let accessToken: String
    }
    
    struct UserProfileModel: Decodable {
        let id: Int
        let fullname: String
        let email: String
        let age: Int
        let gender: String
        let weight: Float
        let height: Int
        let photo: String
        let countryId: Int
        let goalId: Int
        let activityId: Int
    }
}



