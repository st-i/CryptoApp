//
//  RequestToPoloniexBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://poloniex.com/public?command=returnTicker
class RequestToPoloniexBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://poloniex.com/public?command=returnTicker"
        return requestString
    }
}
