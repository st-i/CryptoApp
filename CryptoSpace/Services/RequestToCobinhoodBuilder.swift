//
//  RequestToCobinhoodBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//https ://api.cobinhood.com/v1/market/tickers/(<trading_pair_id>)
class RequestToCobinhoodBuilder: NSObject {

    //не проверял
    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.cobinhood.com/v1/market/tickers/"
        return requestString
    }
    
    //https ://api.cobinhood.com/v1/market/tickers/COB-BTC
    class func buildCobinhoodRateRequest() -> String {
        let requestString = "https://api.cobinhood.com/v1/market/tickers/COB-BTC"
        return requestString
    }
}
