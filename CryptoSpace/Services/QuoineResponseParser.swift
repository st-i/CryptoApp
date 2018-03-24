//
//  QuoineResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 24.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//SUCCESS: (
//{
    //"base_currency" = UBTC;
    //"btc_minimum_withdraw" = "<null>";
    //code = CASH;
    //currency = ETH;
    //"currency_pair_code" = UBTCETH;
    //disabled = 1;
    //"fiat_minimum_withdraw" = "<null>";
    //"high_market_ask" = "0.0";
    //id = 75;
    //indicator = "-1";
    //"last_price_24h" = "0.0";
    //"last_traded_price" = "0.01220004";
    //"last_traded_quantity" = "0.0763386";
    //"low_market_bid" = "0.0";
    //"maker_fee" = 0;
    //"market_ask" = 0;
    //"market_bid" = 0;
    //name = "<null>";
    //"product_type" = CurrencyPair;
    //"pusher_channel" = "product_cash_ubtceth_75";
    //"quoted_currency" = ETH;
    //symbol = "\U0e3f";
    //"taker_fee" = 0;
    //"volume_24h" = "0.0";
//},

class QuoineResponseParser: NSObject {

    class func parseResponse(response: [Dictionary<String, AnyObject>]) -> Dictionary<String, Double> {
        
        let kCoinsPair = "currency_pair_code"
        let kLastCoinPrice = "last_traded_price"
        let btcusd = "BTCUSD"
        let ethusd = "ETHUSD"
        
        var actualCoinsRates = Dictionary<String, Double>()
        
        for currentDict in response {
            let coinsPair = currentDict[kCoinsPair] as! String
            if coinsPair == btcusd || coinsPair == ethusd {
                let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                let end = coinsPair.index(coinsPair.startIndex, offsetBy: 3)
                let range = start ..< end
                
                let coinName = coinsPair[range]
                let coinPrice = Double(currentDict[kLastCoinPrice] as! String)!
//                print([coinName, coinPrice])
                actualCoinsRates.updateValue(coinPrice, forKey: String(coinName))
            }
        }
//        print(actualCoinsRates)
//        print("Quoine запрос")
        return actualCoinsRates
    }
}
