//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Ildar Garifullin on 22/02/2023.
//

import Foundation

protocol CoinManagerDelegate {
    func getRate(rate: Double)
    func getCurrency(currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "..."
    
    let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK", "NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //create a URL
        if let url = URL(string: urlString) {
            //create a URLSession
            let session = URLSession(configuration: .default)
            
            //give thesession a task
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    //                    let dataString = String(data: safeData, encoding: .utf8)
                    //                    print(dataString!)
                    
                    self.parseJSON(coinData: safeData)
                }
            }
            
            //start the task
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodeData.rate
            let currency = decodeData.assetIDQuote
            
            delegate?.getRate(rate: rate)
            delegate?.getCurrency(currency: currency)
        } catch {
            delegate?.didFailWithError(error: error)
        }
    }
}
