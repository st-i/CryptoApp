//
//  AllCoinsManager.swift
//  CryptoSpace
//
//  Created by st.i on 21.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//struct Coin {
//    var id: String
//    //    var fullName: String
//    var shortName: String
//    var exchangeRate: Double
//}

class AllCoinsManager: NSObject {

    class func createArrayWithAllCoins() -> [Coin] {
        var allCoins = [Coin]()
        
        //1
        let bitcoinCoin = Coin.init()
        bitcoinCoin.fullName = "Bitcoin"
        bitcoinCoin.shortName = "BTC"
        bitcoinCoin.id = "btc"
        bitcoinCoin.bitfinexId = "btc"
//        bitcoinCoin.okexId = "btc"
        allCoins.append(bitcoinCoin)
        
        //2
        let ethereumCoin = Coin.init()
        ethereumCoin.fullName = "Ethereum"
        ethereumCoin.shortName = "ETH"
        ethereumCoin.id = "eth"
//        ethereumCoin.bitfinexId = "eth"
        ethereumCoin.okexId = "eth"
        allCoins.append(ethereumCoin)
        
        //3
        let rippleCoin = Coin.init()
        rippleCoin.fullName = "Ripple"
        rippleCoin.shortName = "XRP"
        rippleCoin.id = "xpr"
        allCoins.append(rippleCoin)
        
        //4
        let bitcoinCashCoin = Coin.init()
        bitcoinCashCoin.fullName = "Bitcoin Cash"
        bitcoinCashCoin.shortName = "BCH"
        bitcoinCashCoin.id = "bch"
        allCoins.append(bitcoinCashCoin)
        
        //5
        let litecoinCoin = Coin.init()
        litecoinCoin.fullName = "Litecoin"
        litecoinCoin.shortName = "LTC"
        litecoinCoin.id = "ltc"
        allCoins.append(litecoinCoin)
        
        //6
        let cardanoCoin = Coin.init()
        cardanoCoin.fullName = "Cardano"
        cardanoCoin.shortName = "ADA"
        cardanoCoin.id = "ada"
        allCoins.append(cardanoCoin)
        
        //7
        let neoCoin = Coin.init()
        neoCoin.fullName = "NEO"
        neoCoin.shortName = "NEO"
        neoCoin.id = "neo"
        allCoins.append(neoCoin)
        
        //8
        let stellarCoin = Coin.init()
        stellarCoin.fullName = "Stellar"
        stellarCoin.shortName = "XLM"
        stellarCoin.id = "xlm"
        allCoins.append(stellarCoin)
        
        //9
        let eosCoin = Coin.init()
        eosCoin.fullName = "EOS"
        eosCoin.shortName = "EOS"
        eosCoin.id = "eos"
        allCoins.append(eosCoin)
        
        //10
        let dashCoin = Coin.init()
        dashCoin.fullName = "Dash"
        dashCoin.shortName = "DASH"
        dashCoin.id = "dash"
        allCoins.append(dashCoin)
        
        //11
        let iotaCoin = Coin.init()
        iotaCoin.fullName = "IOTA"
        iotaCoin.shortName = "MIOTA"
        iotaCoin.id = "miota"
        allCoins.append(iotaCoin)
        
        //12
        
        
        return allCoins
    }
}
