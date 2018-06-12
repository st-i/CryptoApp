//
//  Gate_ioResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class Gate_ioResponseParser: NSObject {
    
    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], btcRate: Double, ethRate: Double) -> Dictionary<String, Double> {
        
        let kLastCoinPrice = "last"
        let btcPrefix = "_btc"
        let ethPrefix = "_eth"
        
        var actualCoinsRates = Dictionary<String, Double>()
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Gate_io {
                for currentCoinsPair in response.keys {
                    if currentCoinsPair.contains(btcPrefix) || currentCoinsPair.contains(ethPrefix) {
                        
                        let lastThreeChars = currentCoinsPair.suffix(4)
                        
                        let start = currentCoinsPair.index(currentCoinsPair.startIndex, offsetBy: 0)
                        let end = currentCoinsPair.index(lastThreeChars.startIndex, offsetBy: 0)
                        let range = start ..< end
                    
                        let coinName = currentCoinsPair[range]
                        
                        var coinMultiplier = 0.0
                        var needToShowCoin = false
                        
                        if lastThreeChars == ethPrefix && Gate_ioCoinToEth.isCoinToEth(testedCoin: String(coinName)) {
                            coinMultiplier = ethRate
                            needToShowCoin = true
                        }
                        
                        if lastThreeChars == btcPrefix && !Gate_ioCoinToEth.isCoinToEth(testedCoin: String(coinName)) {
                            coinMultiplier = btcRate
                            needToShowCoin = true
                        }
                        
                        if someCoin.id == coinName && needToShowCoin {
                            let currentDict = response[currentCoinsPair] as! Dictionary<String, AnyObject>
                            var coinPrice = 0.0
                            if (currentDict[kLastCoinPrice]?.isKind(of: NSString.self))! {
                                coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * coinMultiplier
                            }else if (currentDict[kLastCoinPrice]?.isKind(of: NSNumber.self))! {
                                coinPrice = ((currentDict[kLastCoinPrice] as? NSNumber)?.doubleValue)! * coinMultiplier
                            }else{
                                coinPrice = 8888888888888.0
                            }
                            actualCoinsRates.updateValue(coinPrice, forKey: String(coinName))
//                            let currentCoinArray = [coinName, coinPrice] as [Any]
//                            print(currentCoinArray)
                        }
                    }
                }
            }
        }
//        print(actualCoinsRates)
//        print("Gate_io запрос")
        return actualCoinsRates
    }
}
