//
//  Gate_ioResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class Gate_ioResponseParser: NSObject {
    
    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], btcRate: Double, ethRate: Double)/* -> Array<Any>*/ { //Dictionary<String, Double> {
        
        let kLastCoinPrice = "last"
        let btcPrefix = "_btc"
        let ethPrefix = "_eth"
        
//        for someCoin in coinsArray {
//            if someCoin.exchange == ExchangeBehavior.Poloniex {
                for currentCoinsPair in response.keys {
                    if currentCoinsPair.contains(btcPrefix) || currentCoinsPair.contains(ethPrefix) {
                        
                        let lastThreeChars = currentCoinsPair.suffix(4)
//                        if lastThreeChars == btcPrefix {
                        
                        let start = currentCoinsPair.index(currentCoinsPair.startIndex, offsetBy: 4)
                        let end = currentCoinsPair.index(lastThreeChars.startIndex, offsetBy: 0)
                        let range = start ..< end
                    
                        let coinName = currentCoinsPair[range]
                        if Gate_ioCoinToEth.isCoinToEth(testedCoin: String(coinName)) {
                        
//                        if someCoin.shortName == coinName {
                            let currentDict = response[currentCoinsPair] as! Dictionary<String, AnyObject>
//                            let coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * btcRate
                            var coinPrice = 0.0
                            if (currentDict[kLastCoinPrice]?.isKind(of: NSString.self))! {
                                coinPrice = Double(currentDict[kLastCoinPrice] as! String)!
                            }else if (currentDict[kLastCoinPrice]?.isKind(of: NSNumber.self))! {
                                coinPrice = ((currentDict[kLastCoinPrice] as? NSNumber)?.doubleValue)!
                            }else{
                                coinPrice = 8888888888888.0
                            }
                            let currentCoinArray = [currentCoinsPair, coinPrice] as [Any]
                            
                            print(currentCoinArray)
//                        }
                        }
                    }
                }
//            }
//        }
    }
}
