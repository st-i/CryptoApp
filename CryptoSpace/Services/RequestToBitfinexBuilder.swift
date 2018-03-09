//
//  RequestToBitfinexBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 16.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://api.bitfinex.com/v1/pubticker/btcusd
class RequestToBitfinexBuilder: NSObject {
    
    class func buildRequest(currencyId: String) -> String {
        let requestString = String(format:"https://api.bitfinex.com/v1/pubticker/%@usd", currencyId)
        return requestString
    }
    
    class func buildBtcRateRequest() -> String {
        let requestString = "https://api.bitfinex.com/v1/pubticker/btcusd"
        return requestString
    }
}
