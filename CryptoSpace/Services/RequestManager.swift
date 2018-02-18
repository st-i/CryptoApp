//
//  RequestManager.swift
//  CryptoSpace
//
//  Created by st.i on 11.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit
import Alamofire

class RequestManager: NSObject {
    
    //массив с данными в будущем будет
    var btcRate:Double = 0.0
    var updatedUserCoins = [Coin]()
    
    func exchangeRateForCurrency(currencyId: String) -> String {
        return currencyId
    }
    
    func updateCoins(coinsArray: [Coin], completion: @escaping ([Double]) -> Void) { //(coinsArray: [Coin]) -> [Coin] {
        
        var coinRequestUrl = ""
        var keyForDict1 = ""
        var keyForDict2 = ""
        var coinsRates = [Double]()
        for someCoin in coinsArray {
//            switch: такая-то биржа, такой-то запрос
            switch someCoin.shortName { //буду спрашивать биржу
            case "BTC": //буду сравнивать с behaviour биржи
                coinRequestUrl = RequestToBitfinexBuilder.buildRequest(currencyId: someCoin.id)
                keyForDict1 = "mid" //вместо этого хардкода будет передаваться behaviour...
                sendRequest(url: coinRequestUrl, dictKey1: keyForDict1, dictKey2: keyForDict2, completion: { (exchangeRate) in
                    coinsRates.append(exchangeRate)
                    })
            case "ETH":
                coinRequestUrl = RequestToOKEXBuilder.buildRequest(currencyId: someCoin.id)
                keyForDict1 = "ticker"
                keyForDict2 = "last"
                sendRequest(url: coinRequestUrl, dictKey1: keyForDict1, dictKey2: keyForDict2, completion: { (exchangeRate) in
                    coinsRates.append(exchangeRate)
                    })
            default:
                coinRequestUrl = ""
                coinsRates.append(0.0)
            }
        }
        completion(coinsRates)
    }
//        let coinId = "btc"
//        let coinEthId = "eth"
    
//        let coinRequestUrl = RequestToBitfinexBuilder.buildRequest(currencyId: coinId)
//        let coinRequestUrl = RequestToOKEXBuilder.buildRequest(currencyId: coinEthId)
//    }
    
    private func sendRequest(url: String, dictKey1: String, dictKey2: String, completion: @escaping (Double) -> Void) {
        request(url)
            .responseJSON(completionHandler: { response in
                
                guard response.result.isSuccess else{
                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
                    return
                }
                
                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                    print("Не могу перевести в JSON")
                    return
                }
                print(arrayOfData)
                
                var currentRate = 0.0
                if dictKey2 == "" { //...а тут будет обработчик массива в зависимости от behaviour
                    currentRate = Double((arrayOfData[dictKey1] as? String)!)! //bitfinex
                }else{
                    currentRate = Double((arrayOfData[dictKey1]![dictKey2] as? String)!)! //okex
                }
                
                print(currentRate)
                
                completion(currentRate) //* 10600.09)
            })
    }
}
