//
//  BitfinexResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class BitfinexResponseParser: NSObject {

    class func getBtcRate(response: [String: AnyObject]) -> Double {
        let kRate = "last_price"
        let btcRate = Double((response[kRate] as? String)!)!
        return btcRate
    }
    
    class func getEthRate(response: [String: AnyObject]) -> Double {
        let kRate = "last_price"
        let ethRate = Double((response[kRate] as? String)!)!
        return ethRate
    }
}
