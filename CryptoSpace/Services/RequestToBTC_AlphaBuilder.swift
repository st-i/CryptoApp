//
//  RequestToBTC_AlphaBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//https ://btc-alpha.com/api/v1/exchanges/
class RequestToBTC_AlphaBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://btc-alpha.com/api/v1/exchanges/"
        return requestString
    }
}
