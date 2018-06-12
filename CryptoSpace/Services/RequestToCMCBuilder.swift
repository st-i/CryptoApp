//
//  RequestToCMCBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 15.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestToCMCBuilder: NSObject {
    
    class func buildCMCRequest() -> String {
        let requstString = "https://api.coinmarketcap.com/v1/global/"
        return requstString
    }
}
