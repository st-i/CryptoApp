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

    class func parseResponse(response: [Dictionary<String, AnyObject>]) -> Dictionary<String, Dictionary<String, Double>> {
        
        let kQuoineCoinsPair = "currency_pair_code"
        let kQuoineCoinLastPrice = "last_traded_price"
        let kQuoineCoin24hLastPrice = "last_price_24h"
        
        let btcusd = "BTCUSD"
        let ethusd = "ETHUSD"
        let qashbtc = "QASHUSD"
        
        var actualCoinsRates = Dictionary<String, Dictionary<String, Double>>()
        
        for currentDict in response {
            let coinsPair = currentDict[kQuoineCoinsPair] as! String
            if coinsPair == btcusd || coinsPair == ethusd || coinsPair == qashbtc {
                let start = coinsPair.index(coinsPair.startIndex, offsetBy: 0)
                var end: String.Index
                if coinsPair == qashbtc {
                    end = coinsPair.index(coinsPair.startIndex, offsetBy: 4)
                }else{
                    end = coinsPair.index(coinsPair.startIndex, offsetBy: 3)
                }
                let range = start ..< end
                
                let coinName = coinsPair[range]
                let coinPrice = Double(currentDict[kQuoineCoinLastPrice] as! String)!
                
                //находим изменение цены за 24ч в процентах
                let coinPrice24h = Double(currentDict[kQuoineCoin24hLastPrice] as! String)!
                
//                var priceDifference = 0.0
//                if coinPrice >= coinPrice24h {
//                    priceDifference = coinPrice - coinPrice24h
//                }else{
//                    priceDifference = coinPrice24h - coinPrice
//                }
//                var priceDifferencePercent = (priceDifference / coinPrice24h) * 100.0
//                if coinPrice < coinPrice24h {
//                    priceDifferencePercent = 0 - priceDifferencePercent
//                }
                
                let coinDetailsDict = PercentChangeCalculator.determine24hPriceChangeInPercentsForQuoine(coinPrice: coinPrice, coinPrice24h: coinPrice24h)

                print("\(coinName): \(coinPrice)")
                actualCoinsRates.updateValue(coinDetailsDict, forKey: String(coinName))
            }
        }
//        print(actualCoinsRates)
//        print("Quoine запрос")
        return actualCoinsRates
    }
}
