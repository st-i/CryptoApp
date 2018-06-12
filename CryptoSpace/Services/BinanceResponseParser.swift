//
//  BinanceResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class BinanceResponseParser: NSObject {

    class func parseResponse(response: [Dictionary<String, AnyObject>], coinsArray: [Coin], btcRate: Double, btc24hPercentChange: Double) -> Dictionary<String, Dictionary<String, Double>> {
        
        let kBinanceCoinsPair = "symbol"
        let kBinanceCoinLastPrice = "lastPrice"
        let kBinanceCoinOpenPrice = "openPrice"
        let btcPart = "BTC"
        
        var actualCoinsRates = Dictionary<String, Dictionary<String, Double>>()
//            Dictionary<String, Double>()
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.Binance {
                for currentDict in response {
                    let coinsPair = currentDict[kBinanceCoinsPair] as! String
                    if coinsPair.contains(btcPart) {
                        let lastThreeChars = coinsPair.suffix(3)
                        
                        if lastThreeChars == btcPart {
                            let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                            let end = coinsPair.index(lastThreeChars.startIndex, offsetBy: 0)
                            let range = start ..< end
                        
                            let coinName = coinsPair[range]
                        
                            if someCoin.shortName == coinName {
                                let coinPrice = Double(currentDict[kBinanceCoinLastPrice] as! String)! * btcRate
                                let coinOpenPrice = Double(currentDict[kBinanceCoinOpenPrice] as! String)! * btcRate
                                
                                let coinDetailsDict = PercentChangeCalculator.determine24hPriceChangeInPercents(coinPrice: coinPrice, coinPrice24h: coinOpenPrice, btc24hPercentChange: btc24hPercentChange)
                                
                                actualCoinsRates.updateValue(coinDetailsDict, forKey: String(coinName))
//                                let currentCoinArray = [coinName, coinPrice] as [Any]
//                                print(currentCoinArray)
                            }
                        }
                    }
                }
            }
        }
//        print(actualCoinsRates)
//        print("Binance запрос")
        return actualCoinsRates
    }
}
