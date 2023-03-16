//
//  AllergieModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 9/03/23.
//

import Foundation

struct Allergy {
    struct App: Decodable, Identifiable {
        let id: Int
        let allergy: String
    }
    
    struct Server: Encodable, Equatable {
        let id: Int
    }
}
