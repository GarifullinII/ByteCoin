//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Ildar Garifullin on 24/02/2023.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let assetIDBase: String
    let assetIDQuote: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
