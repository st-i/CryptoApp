//
//  LivecoinResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class LivecoinResponseParser: NSObject {
    
    class func parseResponse(response: [Dictionary<String, AnyObject>], coinsArray: [Coin], btcRate: Double) -> Dictionary<String, Double> {
        
        let kCoinsPair = "symbol"
        let kLastCoinPrice = "last"
        let btcPart = "/BTC"
        
        var actualCoinsRates = Dictionary<String, Double>()
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Livecoin {
                for currentDict in response {
                    let coinsPair = currentDict[kCoinsPair] as! String
                    if coinsPair.contains(btcPart) {
                        let lastThreeChars = coinsPair.suffix(4)
                    
                        if lastThreeChars == btcPart {
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(lastThreeChars.startIndex, offsetBy: 0)
                            let range = start ..< end
                    
                            let coinName = coinsPair[range]
                    
                            if someCoin.shortName == coinName {
                                let coinPrice = ((currentDict[kLastCoinPrice] as? NSNumber)?.doubleValue)! * btcRate
                                actualCoinsRates.updateValue(coinPrice, forKey: String(coinName))
//                                let currentCoinArray = [coinName, coinPrice] as [Any]
//                                print(currentCoinArray)
                            }
                        }
                    }
                }
            }
        }
//        print(actualCoinsRates)
//        print("Livecoin запрос")
        return actualCoinsRates
    }
}
