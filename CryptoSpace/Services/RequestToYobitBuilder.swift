//
//  RequestToYobitBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//https ://yobit.net/api/3/ticker/(ltc_btc)
class RequestToYobitBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://yobit.net/api/3/ticker/"
        return requestString
    }
}
