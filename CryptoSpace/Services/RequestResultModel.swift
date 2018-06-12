//
//  RequestResultModel.swift
//  CryptoSpace
//
//  Created by st.i on 05.05.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestResultModel: NSObject {
    var value: Double?
    var coinsSortedByExchanges: [Dictionary<String, Coin>]?
    var singleCoinDict: Dictionary<String, Dictionary<String, Double>>?
    var error: String?
}
