//
//  RequestToBigONEBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestToBigONEBuilder: NSObject {
    
    //падает приложение на ответе, когда запрашиваешь все монеты (когда на телефоне. на симуляторе не падает)
    //http s://api.big.one/markets
    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.big.one/markets"
        return requestString
    }
    
    //https ://api.big.one/markets/TNB-BTC
    class func buildCoinRateRequest(coinShortName: String) -> String {
        let requestString = String.init(format: "https://api.big.one/markets/%@-BTC", coinShortName)
        return requestString
    }
}
