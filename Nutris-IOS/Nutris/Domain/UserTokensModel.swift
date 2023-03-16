//
//  UserTokensModel.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 6/03/23.
//

import Foundation

struct UserTokensModel: Decodable {
    let accessToken: String
    let refreshToken: String
}
