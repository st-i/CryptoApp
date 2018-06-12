//
//  RequestToTidexBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//https ://api.tidex.com/api/3/ticker/(eth_btc)
class RequestToTidexBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.tidex.com/api/3/ticker/"
        return requestString
    }
}
