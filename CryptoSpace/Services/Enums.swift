//
//  Enums.swift
//  CryptoSpace
//
//  Created by st.i on 08.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import Foundation

enum CoinType: Int {
    case Tracked
    case Observed
}

enum ExchangeBehavior: Int {
    case Quoine
    case Bittrex
    case HitBTC
    case Binance
    case Poloniex
    case Cryptopia

    case Kucoin
    case IDEX
    case Gate_io
    case Livecoin
    case BigONE
    case C2CX
    case Cobinhood
    case CoinExchange
    case Yobit
    case Bitfinex
}

let HitBTCCoinsToEth = ["DENT", "DCN", "ENG", "SAN", "GVT", "JNT"]

let Gate_ioCoinsToEth = ["med", "mds", "rcn", "ost"]







