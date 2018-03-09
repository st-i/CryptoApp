//
//  KucoinResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class KucoinResponseParser: NSObject {

    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], btcRate: Double)/* -> Array<Any>*/ { //Dictionary<String, Double> {
        
        let kAllDicts = "result"
        let kCoinsPair = "MarketName"
        let kLastCoinPrice = "Last"
        let btcPrefix = "BTC-"
        
        let dictsArray = response[kAllDicts] as! [Dictionary<String, AnyObject>]
        //        var allCoins = Array<Any>()
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Bittrex {
                for currentDict in dictsArray {
                    let coinsPair = currentDict[kCoinsPair] as! String
                    if coinsPair.contains(btcPrefix) {
                        let start = coinsPair.index(coinsPair.startIndex, offsetBy: 4)
                        let end = coinsPair.index(coinsPair.endIndex, offsetBy: 0)
                        let range = start ..< end
                        
                        let coinName = coinsPair[range]
                        if someCoin.shortName == coinName {
                            let coinPrice = ((currentDict[kLastCoinPrice] as? NSNumber)?.doubleValue)! * btcRate
                            let currentCoinArray = [coinName, coinPrice] as [Any]
                            
                            print(currentCoinArray)
                        }
                    }
                }
            }
            //            let coinPrice = Double((currentDict["Last"] as? String)!)! * 11670.0
            
            //            allCoins.append(currentCoinArray)
        }
        
        //        return newDict
        //        return allCoins
    }
}
