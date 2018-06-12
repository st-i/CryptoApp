//
//  RequestToOKEXBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 14.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://www.okex.com/api/v1/ticker.do?symbol=ltc_btc
class RequestToOKEXBuilder: NSObject {
    
    class func buildRequest(currencyId: String) -> String {
        let requestString = String(format:"https://www.okex.com/api/v1/ticker.do?symbol=%@_btc", currencyId)
        return requestString
    }
    
}
