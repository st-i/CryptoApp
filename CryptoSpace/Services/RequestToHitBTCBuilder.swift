//
//  RequestToHitBTCBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://api.hitbtc.com/api/2/public/ticker
class RequestToHitBTCBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.hitbtc.com/api/2/public/ticker"
        return requestString
    }
}
