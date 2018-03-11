//
//  RequestToYobitBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestToYobitBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://yobit.net/api/3/ticker/"
        return requestString
    }
    
    //https ://yobit.net/api/3/ticker/wgr_btc
    class func buildWagerrRateRequest() -> String {
        let requestString = "https://yobit.net/api/3/ticker/wgr_btc"
        return requestString
    }
}
