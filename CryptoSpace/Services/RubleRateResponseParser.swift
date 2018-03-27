//
//  RubleRateResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 26.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//SUCCESS: {
//    "USD_RUB" = "57.212601";
//}

class RubleRateResponseParser: NSObject {
    
    class func parseResponse(response: Dictionary<String, AnyObject>) -> Double {
        
//        let responseDict = response as! Dictionary<String, String>
        let rubleRate = (response["USD_RUB"] as! NSNumber).doubleValue
        return rubleRate
    }
}
