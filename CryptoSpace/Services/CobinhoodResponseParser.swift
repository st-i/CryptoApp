//
//  CobinhoodResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//COB-BTC
//SUCCESS: {
//    result =     {
//        ticker =         {
//            "24h_high" = "0.0000137";
//            "24h_low" = "0.00001";
//            "24h_open" = "0.00001339";
//            "24h_volume" = "2075960.0929392106";
//            "highest_bid" = "0.00001148";
//            "last_trade_price" = "0.00001175";
//            "lowest_ask" = "0.00001175";
//            timestamp = 1520771220000;
//            "trading_pair_id" = "COB-BTC";
//        };
//    };
//    success = 1;
//}

class CobinhoodResponseParser: NSObject {
    
    class func parseResponseForSingleCoin(coinShortName: String, response: [String: AnyObject], btcRate: Double) -> Double {
        
        let kResult = "result"
        let kCoinDict = "ticker"
        let kLastCoinPrice = "last_trade_price"
        
        let resultDict = response[kResult] as! Dictionary<String, AnyObject>
        let coinDict = resultDict[kCoinDict] as! Dictionary<String, AnyObject>
        
        let coinPrice = Double(coinDict[kLastCoinPrice] as! String)! * btcRate
        
//        let currentCoinArray = [coinShortName, coinPrice] as [Any]
//        print(currentCoinArray)
        print(coinPrice)
        return coinPrice
    }
}
