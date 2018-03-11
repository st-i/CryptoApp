//
//  YobitResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//SUCCESS: {
//    "wgr_btc" =     {
//        avg = "3.189e-05";
//        buy = "3.043e-05";
//        high = "3.356e-05";
//        last = "3.041e-05";
//        low = "3.022e-05";
//        sell = "3.227e-05";
//        updated = 1520776818;
//        vol = "0.01026656";
//        "vol_cur" = "335.07794353";
//    };
//}

class YobitResponseParser: NSObject {

    class func parseResponseForSingleCoin(coinId: String, coinShortName: String, response: [String: AnyObject], btcRate: Double) {
        
        let kCoinDict = String.init(format: "%@_btc", coinId)
        let kLastCoinPrice = "last"
        
        let coinDict = response[kCoinDict] as! Dictionary<String, AnyObject>
        let coinPrice = (coinDict[kLastCoinPrice] as! NSNumber).doubleValue * btcRate
        
        let currentCoinArray = [coinShortName, coinPrice] as [Any]
        print(currentCoinArray)
    }
}
