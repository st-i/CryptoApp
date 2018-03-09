//
//  RequestToBigONEBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://api.big.one/markets
class RequestToBigONEBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.big.one/markets"
        return requestString
    }
}
