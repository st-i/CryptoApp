//
//  BittrexResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 04.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class BittrexResponseParser: NSObject {

    class func parseResponse(response: [Dictionary<String, AnyObject>]/*, coinsArray: [Coin]*/) -> Array<Any> { //Dictionary<String, Double> {

//        let newDict = Dictionary<String, Double>()
    
        var allCoins = Array<Any>()
    
        for currentDict in response {
            let marketName = currentDict["MarketName"] as! String
        
            let start = marketName.index(marketName.startIndex, offsetBy: 4)
            let end = marketName.index(marketName.endIndex, offsetBy: 0)
            let range = start ..< end
            
            let coinName = marketName[range]
            let coinPrice = ((currentDict["Last"] as? NSNumber)?.doubleValue)! * 11670.0
//            let coinPrice = Double((currentDict["Last"] as? String)!)! * 11670.0
            let currentCoinArray = [coinName, coinPrice] as [Any]
            print(currentCoinArray)
            
            allCoins.append(currentCoinArray)
        }
        
//        return newDict
        return allCoins
    }
}
