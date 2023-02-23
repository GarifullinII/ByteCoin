//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Ildar Garifullin on 22/02/2023.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "???"
    
    let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK", "NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
//        let urlString = "\("https://rest.coinapi.io/v1/exchangerate/BTC")/\("EUR")?apikey=\("???")"
        
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
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                }
                
            }
            
            //start the task
            task.resume()
        }
    }
}
