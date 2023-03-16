//
//  KeyChainManager.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 9/03/23.
//

import Foundation
import KeychainSwift

enum TokenType: String {
    case refresh = "REFRESHTOKEN"
    case access = "ACCESSTOKEN"
}

let keyChain = KeychainSwift()

func saveToken(token: String, type: TokenType) {
    keyChain.set(token, forKey: type.rawValue)
}

func deleteToken(type: TokenType) {
    keyChain.delete(type.rawValue)
}

func getToken(type: TokenType) -> String {
    guard let token = keyChain.get(type.rawValue) else {
        print("no se pudo obtener token")
        return ""
    }
    return token
}
