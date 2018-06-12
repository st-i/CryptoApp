//
//  RequestToCryptopiaBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://www.cryptopia.co.nz/api/GetMarkets
class RequestToCryptopiaBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://www.cryptopia.co.nz/api/GetMarkets"
        return requestString
    }
}
