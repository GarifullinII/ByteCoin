//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Ildar Garifullin on 22/02/2023.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "..."
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
//    func parseJSON(_ data: Data) -> Double? {
//        let decoder = JSONDecoder()
//
//        do {
//            let decodedData = try decoder.decode(CoinData.self, from: data)
//            let lastPrice = decodedData.last
//
//            return lastPrice
//        } catch {
//            delegate?.didFailWithError(self, error: error)
//            return nil
//        }
//    }
//
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        print(urlString)
    }
}
