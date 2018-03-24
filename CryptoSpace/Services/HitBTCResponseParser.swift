//
//  HitBTCResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class HitBTCResponseParser: NSObject {

    class func parseResponse(response: [Dictionary<String, AnyObject>], coinsArray: [Coin], btcRate: Double) -> Dictionary<String, Double> {
        
        let kCoinsPair = "symbol"
        let kLastCoinPrice = "last"
        let btcName = "BTC"
        let ethName = "ETH"
        
        var actualCoinsRates = Dictionary<String, Double>()
        
        var ethRate = 0.0
        var xrpRate = 0.0
        var usdtRate = 0.0
        for currentDict in response {
            let coinsPair = currentDict[kCoinsPair] as! String
            if coinsPair == "ETHBTC" {
                ethRate = Double(currentDict[kLastCoinPrice] as! String)! * btcRate
            }else if coinsPair == "XRPBTC"{
                xrpRate = Double(currentDict[kLastCoinPrice] as! String)! * btcRate
            }else if coinsPair == "XRPUSDT"{
                usdtRate = xrpRate / Double(currentDict[kLastCoinPrice] as! String)!
                actualCoinsRates.updateValue(usdtRate, forKey: "USDT")
//                print("\(["USDT", usdtRate])")
            }
        }
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.HitBTC {
        
                for currentDict in response {
                    let coinsPair = currentDict[kCoinsPair] as! String
                    if coinsPair.contains(btcName) {
                    
                        let btcLastThreeChars = coinsPair.suffix(3)
                        if btcLastThreeChars == btcName {
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(btcLastThreeChars.startIndex, offsetBy: 0)
                            let range = start ..< end
                    
                            let coinName = coinsPair[range]
                    
                            if someCoin.shortName == coinName {
                                var coinPrice = 888888888888.0
                                if !((currentDict[kLastCoinPrice]?.isKind(of: NSNull.self))!) {
                                    coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * btcRate
                                }
                                actualCoinsRates.updateValue(coinPrice, forKey: String(coinName))
//                                let currentCoinArray = [coinsPair, coinPrice] as [Any]
//                                print(currentCoinArray)
                            }
                        }
                    }
                    
                    if coinsPair.contains(ethName) {
                        let ethLastThreeChars = coinsPair.suffix(3)
                        if ethLastThreeChars == ethName {
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(ethLastThreeChars.startIndex, offsetBy: 0)
                            let range = start ..< end
                            
                            let coinName = coinsPair[range]
                            if HitBTCCoinToEth.isCoinToEth(testedCoin: String(coinName)) && someCoin.shortName == coinName {
                                var coinPrice = 888888888888.0
                                if !((currentDict[kLastCoinPrice]?.isKind(of: NSNull.self))!) {
                                    coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * ethRate
                                }
                                actualCoinsRates.updateValue(coinPrice, forKey: String(coinName))
//                                let currentCoinArray = [coinsPair, coinPrice] as [Any]
//                                print(currentCoinArray)
                            }
                        }
                    }
                }
            }
        }
//        print(actualCoinsRates)
//        print("HitBTC запрос")
        return actualCoinsRates
    }
}
