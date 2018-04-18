//
//  Portfolio.swift
//  CryptoSpace
//
//  Created by st.i on 18.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class Portfolio: NSObject {
    var initialValueInDollars: Double = 0.0
    var valueInDollars: Double = 0.0
    var last24hValueDollarChange: Double = 0.0
    var last24hValuePercentChange: Double = 0.0
    var rubleExchangeRate: Double = 0.0
}
