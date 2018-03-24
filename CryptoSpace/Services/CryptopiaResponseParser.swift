//
//  CryptopiaResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 10.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class CryptopiaResponseParser: NSObject {

    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], btcRate: Double) -> Dictionary<String, Double> {
        
        let kAllDicts = "Data"
        let kCoinsPair = "Label"
        let kLastCoinPrice = "LastPrice"
        let btcPrefix = "/BTC"
        
        var actualCoinsRates = Dictionary<String, Double>()
        
        let dictsArray = response[kAllDicts] as! [Dictionary<String, AnyObject>]
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Cryptopia {
                for currentDict in dictsArray {
                    let coinsPair = currentDict[kCoinsPair] as! String
                    if coinsPair.contains(btcPrefix) {
                        
                        let btcLastThreeChars = coinsPair.suffix(4)
                        if btcLastThreeChars == btcPrefix {
                            
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(btcLastThreeChars.startIndex, offsetBy: 0)
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
//        print("Cryptopia запрос")
        return actualCoinsRates
    }
}
