//
//  BinanceResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class BinanceResponseParser: NSObject {

    class func parseResponse(response: [Dictionary<String, AnyObject>], coinsArray: [Coin], btcRate: Double)/* -> Array<Any>*/ { //Dictionary<String, Double> {
        
        let kCoinsPair = "symbol"
        let kLastCoinPrice = "lastPrice"
        let btcPart = "BTC"
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Binance {
                for currentDict in response {
                    let coinsPair = currentDict[kCoinsPair] as! String
                    if coinsPair.contains(btcPart) {
                        let lastThreeChars = coinsPair.suffix(3)
                        
                        if lastThreeChars == btcPart {
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(lastThreeChars.startIndex, offsetBy: 0)
                            let range = start ..< end
                        
                            let coinName = coinsPair[range]
                        
                            if someCoin.shortName == coinName {
                                let coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * btcRate
                                let currentCoinArray = [coinName, coinPrice] as [Any]
                                print(currentCoinArray)
                            }
                        }
                    }
                }
            }
        }
    }
}
