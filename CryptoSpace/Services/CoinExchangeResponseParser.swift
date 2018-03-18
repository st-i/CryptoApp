//
//  CoinExchangeResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//SUCCESS: {
//    message = "";
//    request = "/api/v1/getmarket";
//    result =     {
//        AskPrice = "0.00000003";
//        BTCVolume = "35.73160018";
//        BidPrice = "0.00000002";
//        BuyOrderCount = 1152;
//        Change = "-25.00";
//        HighPrice = "0.00000004";
//        LastPrice = "0.00000003";
//        LowPrice = "0.00000002";
//        MarketID = 135;
//        SellOrderCount = 15640;
//        TradeCount = 548;
//        Volume = "35.73160018";
//    };
//    success = 1;
//}

class CoinExchangeResponseParser: NSObject {

    class func parseResponseForSingleCoin(coinShortName: String, response: [String: AnyObject], btcRate: Double) -> Double {
        
        let kCoinDict = "result"
        let kLastCoinPrice = "LastPrice"
        
        let coinDict = response[kCoinDict] as! Dictionary<String, AnyObject>
        let coinPrice = Double(coinDict[kLastCoinPrice] as! String)! * btcRate
        
//        let currentCoinArray = [coinShortName, coinPrice] as [Any]
//        print(currentCoinArray)
        print(coinPrice)
        return coinPrice
    }
}
