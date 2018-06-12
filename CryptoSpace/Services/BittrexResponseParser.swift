//
//  BittrexResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 04.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class BittrexResponseParser: NSObject {

    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], btcRate: Double, btc24hPercentChange: Double) -> Dictionary<String, Dictionary<String, Double>> {
        
        let kBittrexAllDicts = "result"
        let kBittrexCoinsPair = "MarketName"
        let kBittrexCoinLastPrice = "Last"
        let kBittrexCoinPrevDayPrice = "PrevDay"
        let btcPrefix = "BTC-"
        
        var actualCoinsRates = Dictionary<String, Dictionary<String, Double>>()
        
        let dictsArray = response[kBittrexAllDicts] as! [Dictionary<String, AnyObject>]
    
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Bittrex {
                for currentDict in dictsArray {
                    let coinsPair = currentDict[kBittrexCoinsPair] as! String
                    if coinsPair.contains(btcPrefix) {
                        let start = coinsPair.index(coinsPair.startIndex, offsetBy: 4)
                        let end = coinsPair.index(coinsPair.endIndex, offsetBy: 0)
                        let range = start ..< end
                        
                        let coinName = coinsPair[range]
                        if someCoin.shortName == coinName {
                            let coinPrice = ((currentDict[kBittrexCoinLastPrice] as? NSNumber)?.doubleValue)! * btcRate
                            
                            let coinPrice24h = ((currentDict[kBittrexCoinPrevDayPrice] as? NSNumber)?.doubleValue)! * btcRate
//                            var priceDifference = 0.0
//                            if coinPrice >= coinPrice24h {
//                                priceDifference = coinPrice - coinPrice24h
//                            }else{
//                                priceDifference = coinPrice24h - coinPrice
//                            }
//                            var priceDifferencePercent = (priceDifference / coinPrice24h) * 100.0
//                            if coinPrice < coinPrice24h {
//                                priceDifferencePercent = btc24hPercentChange - priceDifferencePercent
//                            }else{
//                                priceDifferencePercent = btc24hPercentChange + priceDifferencePercent
//                            }
                            
                            let coinDetailsDict = PercentChangeCalculator.determine24hPriceChangeInPercents(coinPrice: coinPrice, coinPrice24h: coinPrice24h, btc24hPercentChange: btc24hPercentChange)

                            actualCoinsRates.updateValue(coinDetailsDict, forKey: String(coinName))
//                            let currentCoinArray = [coinName, coinPrice] as [Any]
//                            print(currentCoinArray)
                        }
                    }
                }
            }
        }
//        print(actualCoinsRates)
//        print("Bittrex запрос")
        return actualCoinsRates
    }
}
