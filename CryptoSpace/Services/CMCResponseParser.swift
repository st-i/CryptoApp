//
//  CMCResponseParser.swift
//  CryptoSpace
//
//  Created by st.i on 15.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//SUCCESS: {
//    "active_assets" = 674;
//    "active_currencies" = 894;
//    "active_markets" = 10287;
//    "bitcoin_percentage_of_market_cap" = "42.38";
//    "last_updated" = 1523778574;
//    "total_24h_volume_usd" = 14474855238;
//    "total_market_cap_usd" = 323485917721;
//}

class CMCResponseParser: NSObject {
    
    class func parseResponse(response: [String: AnyObject]) -> Int {
        
        let kTotalMarketCap = "total_market_cap_usd"
        let coinMarketCapValue = (response[kTotalMarketCap] as! NSNumber).intValue
        return coinMarketCapValue
    }
}
