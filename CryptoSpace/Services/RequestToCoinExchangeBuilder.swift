//
//  RequestToCoinExchangeBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//id 135

//https ://www.coinexchange.io/api/v1/getmarkets - узнаешь id маркета
//https ://www.coinexchange.io/api/v1/getmarketsummaries - парсишь с учетом id
class RequestToCoinExchangeBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://www.coinexchange.io/api/v1/getmarketsummaries"
        return requestString
    }
    
    class func buildExpPointsRateRequest() -> String {
        let requestString = "https://www.coinexchange.io/api/v1/getmarketsummary?market_id=135"
        return requestString
    }
}
