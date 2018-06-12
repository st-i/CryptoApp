//
//  RequestToBittrexBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://bittrex.com/api/v1.1/public/getmarketsummaries
class RequestToBittrexBuilder: NSObject {
    
    class func buildAllCoinsRequest() -> String {
        let requstString = "https://bittrex.com/api/v1.1/public/getmarketsummaries"
        return requstString
    }
}
