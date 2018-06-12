//
//  RubleRateRequestBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 26.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RubleRateRequestBuilder: NSObject {

    class func buildRubleRequest() -> String {
        let requestString = "http://free.currencyconverterapi.com/api/v3/convert?q=USD_RUB&compact=ultra"
        return requestString
    }
}
