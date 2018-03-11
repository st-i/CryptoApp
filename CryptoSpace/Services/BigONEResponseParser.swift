//
//  BigONEResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class BigONEResponseParser: NSObject {

    class func parseResponseForSingleCoin(response: [String: AnyObject], btcRate: Double)/* -> Array<Any>*/ { //Dictionary<String, Double> {
        
        let kAllDicts = "data"
        let kCoinsPair = "symbol"
        let kCoinDict = "ticker"
        let kLastCoinPrice = "price"
        
        let dictsArray = response[kAllDicts] as! Dictionary<String, AnyObject>
        
        var coinsPair = ""
        var coinName = ""
        var coinPrice = 0.0
        
        for dictKey in dictsArray.keys {
            if dictKey == kCoinsPair {
                coinsPair = dictsArray[kCoinsPair] as! String
                let lastThreeChars = coinsPair.suffix(4)
                
                let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                let end = coinsPair.index(lastThreeChars.startIndex, offsetBy: 0)
                let range = start ..< end
                
                coinName = String(coinsPair[range])
                
            }else if dictKey == kCoinDict {
                let coinDict = dictsArray[kCoinDict] as! Dictionary<String, AnyObject>
                coinPrice = Double(coinDict[kLastCoinPrice] as! String)! * btcRate
            }
        }
        let currentCoinArray = [coinName, coinPrice] as [Any]
        print(currentCoinArray)
    }
}
