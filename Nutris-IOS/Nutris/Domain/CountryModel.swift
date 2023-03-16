//
//  CountryModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 7/03/23.
//

import Foundation

struct Country: Decodable {
    let id: Int
    let country: String
    let code: String
}
