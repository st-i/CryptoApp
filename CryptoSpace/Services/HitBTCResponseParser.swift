//
//  HitBTCResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class HitBTCResponseParser: NSObject {

    //приходят даже в паре с USD, но не все!!! поэтому лучше к BTC
    class func parseResponse(response: [Dictionary<String, AnyObject>], coinsArray: [Coin], btcRate: Double, btc24hPercentChange: Double) -> Dictionary<String, Dictionary<String, Double>> {
        
        let kHitBTCCoinsPair = "symbol"
        let kHitBTCCoinLastPrice = "last"
        let kHitBTCCoinOpenPrice = "open"
        let btcName = "BTC"
        let ethName = "ETH"
        
        var actualCoinsRates = Dictionary<String, Dictionary<String, Double>>()
        
        var ethRate = 0.0
        var xrpRate = 0.0
        var usdtRate = 0.0
        for currentDict in response {
            let coinsPair = currentDict[kHitBTCCoinsPair] as! String
            if coinsPair == "ETHBTC" {
                if !((currentDict[kHitBTCCoinLastPrice]?.isKind(of: NSNull.self))!) {
                    ethRate = Double(currentDict[kHitBTCCoinLastPrice] as! String)! * btcRate
                }
            }else if coinsPair == "XRPBTC"{
                if !((currentDict[kHitBTCCoinLastPrice]?.isKind(of: NSNull.self))!) {
                    xrpRate = Double(currentDict[kHitBTCCoinLastPrice] as! String)! * btcRate
                }
            }else if coinsPair == "XRPUSDT"{
                if !((currentDict[kHitBTCCoinLastPrice]?.isKind(of: NSNull.self))!) {
                    usdtRate = xrpRate / Double(currentDict[kHitBTCCoinLastPrice] as! String)!
                }
                var coinDetailsDict = Dictionary<String, Double>()
                if !((currentDict[kHitBTCCoinOpenPrice]?.isKind(of: NSNull.self))!) {
                    let usdtOpenPrice = xrpRate / Double(currentDict[kHitBTCCoinOpenPrice] as! String)!
                    coinDetailsDict = PercentChangeCalculator.determine24hPriceChangeInPercents(coinPrice: usdtRate, coinPrice24h: usdtOpenPrice, btc24hPercentChange: btc24hPercentChange)
                }
                
                actualCoinsRates.updateValue(coinDetailsDict, forKey: "USDT")
//                print("\(["USDT", usdtRate])")
            }
        }
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.HitBTC {
        
                for currentDict in response {
                    let coinsPair = currentDict[kHitBTCCoinsPair] as! String
                    if coinsPair.contains(btcName) {
                    
                        let btcLastThreeChars = coinsPair.suffix(3)
                        if btcLastThreeChars == btcName {
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(btcLastThreeChars.startIndex, offsetBy: 0)
                            let range = start ..< end
                    
                            let coinName = coinsPair[range]
                    
                            if someCoin.shortName == coinName {
                                var coinPrice = 0.0
                                if !((currentDict[kHitBTCCoinLastPrice]?.isKind(of: NSNull.self))!) {
                                    coinPrice = Double(currentDict[kHitBTCCoinLastPrice] as! String)! * btcRate
                                }
                                var coinDetailsDict = Dictionary<String, Double>()
                                if !((currentDict[kHitBTCCoinOpenPrice]?.isKind(of: NSNull.self))!) {
                                    let coinOpenPrice = Double(currentDict[kHitBTCCoinOpenPrice] as! String)! * btcRate
                                    coinDetailsDict = PercentChangeCalculator.determine24hPriceChangeInPercents(coinPrice: coinPrice, coinPrice24h: coinOpenPrice, btc24hPercentChange: btc24hPercentChange)
                                }
                                
                                actualCoinsRates.updateValue(coinDetailsDict, forKey: String(coinName))
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
                                var coinPrice = 0.0
                                if !((currentDict[kHitBTCCoinLastPrice]?.isKind(of: NSNull.self))!) {
                                    coinPrice = Double(currentDict[kHitBTCCoinLastPrice] as! String)! * ethRate
                                }
                                var coinDetailsDict = Dictionary<String, Double>()
                                if !((currentDict[kHitBTCCoinOpenPrice]?.isKind(of: NSNull.self))!) {
                                    let coinOpenPrice = Double(currentDict[kHitBTCCoinOpenPrice] as! String)! * ethRate
                                    coinDetailsDict = PercentChangeCalculator.determine24hPriceChangeInPercents(coinPrice: coinPrice, coinPrice24h: coinOpenPrice, btc24hPercentChange: btc24hPercentChange)
                                }
                                
                                actualCoinsRates.updateValue(coinDetailsDict, forKey: String(coinName))
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
