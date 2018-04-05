//
//  Coin.swift
//  CryptoSpace
//
//  Created by st.i on 21.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class Coin: NSObject {
    var fullName: String = ""
    var shortName: String = ""
    var id: String = ""
    var uniqueId: Int = 0
    var coinType: CoinType = CoinType(rawValue: 0)!
    var exchange: ExchangeBehavior = ExchangeBehavior(rawValue: 0)!
    var bitfinexId: String = ""
    var okexId: String = ""
    var imageLink: String = ""
    var exchangeRate: Double = 0.0
    var purchaseExchangeRate: Double = 0.0
    var amount: Double = 0.0
    var sum: Double = 0.0
    var rate24hPercentChange: Double = 0.0
}
