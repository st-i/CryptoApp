//
//  RequestToKucoinBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://api.kucoin.com/v1/open/tick
class RequestToKucoinBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.kucoin.com/v1/open/tick"
        return requestString
    }
}
