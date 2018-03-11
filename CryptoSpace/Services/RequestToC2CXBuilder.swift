//
//  RequestToC2CXBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 11.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestToC2CXBuilder: NSObject {
    
    //https ://api.c2cx.com/v1/ticker/?symbol=BTC_UCASH
    class func buildUcashRateRequest() -> String {
        let requestString = "https://api.c2cx.com/v1/ticker/?symbol=BTC_UCASH"
        return requestString
    }
}
