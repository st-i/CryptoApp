//
//  PoloniexResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 10.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class PoloniexResponseParser: NSObject {

    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], btcRate: Double) -> Dictionary<String, Double> {
        
        let kLastCoinPrice = "last"
        let btcPrefix = "BTC_"
        
        var actualCoinsRates = Dictionary<String, Double>()

        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Poloniex {
                for currentCoinsPair in response.keys {
                    if currentCoinsPair.contains(btcPrefix) {
                        let start = currentCoinsPair.index(currentCoinsPair.startIndex, offsetBy: 4)
                        let end = currentCoinsPair.index(currentCoinsPair.endIndex, offsetBy: 0)
                        let range = start ..< end
                        
                        let coinName = currentCoinsPair[range]
                        if someCoin.shortName == coinName {
                            let currentDict = response[currentCoinsPair] as! Dictionary<String, AnyObject>
                            let coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * btcRate
                            actualCoinsRates.updateValue(coinPrice, forKey: String(coinName))
//                            let currentCoinArray = [coinName, coinPrice] as [Any]
//                            print(currentCoinArray)
                        }
                    }
                }
            }
        }
//        print(actualCoinsRates)
//        print("Poloniex запрос")
        return actualCoinsRates
    }
}
