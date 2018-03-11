//
//  RequestToBinanceBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestToBinanceBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.binance.com/api/v1/ticker/24hr"
        return requestString
    }
}
