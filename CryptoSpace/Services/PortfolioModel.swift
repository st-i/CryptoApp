//
//  PortfolioModel.swift
//  CryptoSpace
//
//  Created by st.i on 18.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class PortfolioModel: NSObject {
    var currentDollarValue = "$0"
    var currentRubleValue = "₽0"
    var initialDollarValue = "$0"
    var initialRubleValue = "₽0"
    var dollarProfitOrLoss = "$0"
    var rubleProfitOrLoss = "₽0"
    var last24hValueDollarChange = "$0"
    var last24hValueRubleChange = "₽0"
    var percentProfitOrLoss = "0%"
    var last24hValuePercentChange = "0%"
}
