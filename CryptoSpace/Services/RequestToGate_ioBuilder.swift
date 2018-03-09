//
//  RequestToGate_ioBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http ://data.gate.io/api2/1/tickers
class RequestToGate_ioBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requestString = "http://data.gate.io/api2/1/tickers"
        return requestString
    }
}
