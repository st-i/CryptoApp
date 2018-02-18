//
//  UserCoinsManager.swift
//  CryptoSpace
//
//  Created by st.i on 17.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

struct Coin {
        var id: String
    //    var fullName: String
    var shortName: String
    var exchangeRate: Double
}

class UserCoinsManager: NSObject {
    
    class func fetchAllUserCoins() -> [Coin] {
        //здесь должен быть код, который забирает массив из CoreData
        let btcCoin = "BTC"
        let btcId = "btc"
        
        let ethCoin = "ETH"
        let ethId = "eth"
        
        let xprCoin = "XPR"
        let xprId = "xpr"
        
        let bchCoin = "BCH"
        let bchId = "bch"
        
        let ltcCoin = "LTC"
        let ltcId = "ltc"
        
        let adaCoin = "ADA"
        let adaId = "ada"
        
        let xlmCoin = "XLM"
        let xlmId = "xlm"
        
        let neoCoin = "NEO"
        let neoId = "neo"
        
        let eosCoin = "EOS"
        let eosId = "eos"
        
        let iotaCoin = "MIOTA"
        let iotaId = "miota"
        
        let shortNames = [btcCoin, ethCoin, xprCoin, bchCoin, ltcCoin, adaCoin, xlmCoin, neoCoin, eosCoin, iotaCoin]
        let identifiers = [btcId, ethId, xprId, bchId, ltcId, adaId, xlmId, neoId, eosId, iotaId]
        
        var coinsArray = [Coin]()
        for i in 0..<10 {
            
            let exchangeRate = 10000.54
            let someCoin = Coin(id: identifiers[i], shortName: shortNames[i], exchangeRate: exchangeRate)
            coinsArray.append(someCoin)
        }
        return coinsArray
    }

    class func refreshValuesForCoins(coinsArray: [Coin], coinsRates: [Double]) -> [Coin] {//(coinsArray: [Coin]) -> [Coin] { //в будущем будет приниматься массив
        var updatedCoins = [Coin]()
        
        for i in 0..<coinsArray.count - 1 {
            var currentCoin = coinsArray[i]
            if i < 2 {
                currentCoin.exchangeRate = coinsRates[i]
            }
            updatedCoins.append(currentCoin)
        }
        
//        for var someCoin in coinsArray {
//            if someCoin.shortName == "ETH" {
//                someCoin.exchangeRate = btcRate
//            }
            
//            someCoin.exchangeRate = coinsRates[coinsArray.index(of: someCoin)]
//            updatedCoins.append(someCoin)
//        }
//        return coinsArray
        
        return updatedCoins
    }
}
