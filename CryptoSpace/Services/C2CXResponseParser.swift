//
//  C2CXResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//BTC_UCASH
//SUCCESS: {
//    code = 200;
//    data =     {
//        buy = "1.7e-06";
//        high = "2.5e-06";
//        last = "2.5e-06";
//        low = "1.7e-06";
//        sell = "2e-06";
//        timestamp = 1520769409;
//        volume = "40122.77";
//    };
//    message = success;
//}

class C2CXResponseParser: NSObject {
    
    class func parseResponseForSingleCoin(coinShortName: String, response: [String: AnyObject], btcRate: Double) -> Double {
        
        let kCoinDict = "data"
        let kLastCoinPrice = "last"
        
        let coinDict = response[kCoinDict] as! Dictionary<String, AnyObject>
        let coinPrice = (coinDict[kLastCoinPrice] as! NSNumber).doubleValue * btcRate
        
//        let currentCoinArray = [coinShortName, coinPrice] as [Any]
//        print(currentCoinArray)
        print(coinPrice)
        return coinPrice
    }
}
