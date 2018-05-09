//
//  Enums.swift
//  CryptoSpace
//
//  Created by st.i on 08.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import Foundation

// Test AdMob app ID: ca-app-pub-3940256099942544/2934735716
let testAdMobAppId = "ca-app-pub-3940256099942544/2934735716"
// Prod AdMob app ID: ca-app-pub-5229719486999701/4762328246
let prodAdMobAppId = "ca-app-pub-5229719486999701/4762328246"

let convertToJSONError = "Не могу перевести в JSON"

enum NoDataTextType {
    case trackedCoins
    case observedCoins
    case searchingResults
}

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







