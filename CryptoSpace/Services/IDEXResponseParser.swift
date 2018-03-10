//
//  IDEXResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 10.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class IDEXResponseParser: NSObject {
    
    class func parseResponse(response: [String: AnyObject], coinsArray: [Coin], ethRate: Double)/* -> Array<Any>*/ { //Dictionary<String, Double> {
        
        let kLastCoinPrice = "last"
        let ethPrefix = "ETH_"
        
        for someCoin in coinsArray {
            if someCoin.exchange == ExchangeBehavior.IDEX {
                for currentCoinsPair in response.keys {
                    if currentCoinsPair.contains(ethPrefix) {
                        let start = currentCoinsPair.index(currentCoinsPair.startIndex, offsetBy: 4)
                        let end = currentCoinsPair.index(currentCoinsPair.endIndex, offsetBy: 0)
                        let range = start ..< end
                    
                        let coinName = currentCoinsPair[range]
                        if someCoin.shortName == coinName {
                            let currentDict = response[currentCoinsPair] as! Dictionary<String, AnyObject>
                            let coinPrice = Double(currentDict[kLastCoinPrice] as! String)! * ethRate
                            let currentCoinArray = [coinName, coinPrice] as [Any]
                            
                            print(currentCoinArray)
                        }
                    }
                }
            }
        }
    }
}
