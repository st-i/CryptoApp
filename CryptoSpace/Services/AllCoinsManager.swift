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
        let moneroCoin = Coin.init()
        moneroCoin.fullName = "Monero"
        moneroCoin.shortName = "XMR"
        moneroCoin.id = "xmr"
        allCoins.append(moneroCoin)
        
        //12
        let iotaCoin = Coin.init()
        iotaCoin.fullName = "IOTA"
        iotaCoin.shortName = "MIOTA"
        iotaCoin.id = "miota"
        allCoins.append(iotaCoin)
        
        //13
        let nemCoin = Coin.init()
        nemCoin.fullName = "NEM"
        nemCoin.shortName = "XEM"
        nemCoin.id = "xem"
        allCoins.append(nemCoin)
        
        //14
        let ethereumClassicCoin = Coin.init()
        ethereumClassicCoin.fullName = "Ethereum Classic"
        ethereumClassicCoin.shortName = "ETC"
        ethereumClassicCoin.id = "etc"
        allCoins.append(ethereumClassicCoin)
        
        //15
        let tronCoin = Coin.init()
        tronCoin.fullName = "TRON"
        tronCoin.shortName = "TRX"
        tronCoin.id = "trx"
        allCoins.append(tronCoin)
        
        //16
        let veChainCoin = Coin.init()
        veChainCoin.fullName = "VeChain"
        veChainCoin.shortName = "VEN"
        veChainCoin.id = "ven"
        allCoins.append(veChainCoin)
        
        //17
        let tetherCoin = Coin.init()
        tetherCoin.fullName = "Tether"
        tetherCoin.shortName = "USDT"
        tetherCoin.id = "usdt"
        allCoins.append(tetherCoin)
        
        //18
        let liskCoin = Coin.init()
        liskCoin.fullName = "Lisk"
        liskCoin.shortName = "LSK"
        liskCoin.id = "lsk"
        allCoins.append(liskCoin)
        
        //19
        let bitcoinGoldCoin = Coin.init()
        bitcoinGoldCoin.fullName = "Bitcoin Gold"
        bitcoinGoldCoin.shortName = "BTG"
        bitcoinGoldCoin.id = "btg"
        allCoins.append(bitcoinGoldCoin)
        
        //20
        let qtumCoin = Coin.init()
        qtumCoin.fullName = "Qtum"
        qtumCoin.shortName = "QTUM"
        qtumCoin.id = "qtum"
        allCoins.append(qtumCoin)
        
        //21
        let omiseGoCoin = Coin.init()
        omiseGoCoin.fullName = "OmiseGo"
        omiseGoCoin.shortName = "OMG"
        omiseGoCoin.id = "omg"
        allCoins.append(omiseGoCoin)
        
        //22
        let iconCoin = Coin.init()
        iconCoin.fullName = "ICON"
        iconCoin.shortName = "ICX"
        iconCoin.id = "icx"
        allCoins.append(iconCoin)
        
        //23
        let zcashCoin = Coin.init()
        zcashCoin.fullName = "Zcash"
        zcashCoin.shortName = "ZEC"
        zcashCoin.id = "zec"
        allCoins.append(zcashCoin)
        
        //24
        let nanoCoin = Coin.init()
        nanoCoin.fullName = "Nano"
        nanoCoin.shortName = "NANO"
        nanoCoin.id = "nano"
        allCoins.append(nanoCoin)
        
        //25
        let binanceCoin = Coin.init()
        binanceCoin.fullName = "Binance Coin"
        binanceCoin.shortName = "BNB"
        binanceCoin.id = "bnb"
        allCoins.append(binanceCoin)
        
        //26
        let bytecoinCoin = Coin.init()
        bytecoinCoin.fullName = "Bytecoin"
        bytecoinCoin.shortName = "BCN"
        bytecoinCoin.id = "bcn"
        allCoins.append(bytecoinCoin)
        
        //27
        let steemCoin = Coin.init()
        steemCoin.fullName = "Steem"
        steemCoin.shortName = "STEEM"
        steemCoin.id = "steem"
        allCoins.append(steemCoin)
        
        //28
        let vergeCoin = Coin.init()
        vergeCoin.fullName = "Verge"
        vergeCoin.shortName = "XVG"
        vergeCoin.id = "xvg"
        allCoins.append(vergeCoin)
        
        //29
        let populousCoin = Coin.init()
        populousCoin.fullName = "Populous"
        populousCoin.shortName = "PPT"
        populousCoin.id = "ppt"
        allCoins.append(populousCoin)
        
        //30
        let stratisCoin = Coin.init()
        stratisCoin.fullName = "Stratis"
        stratisCoin.shortName = "STRAT"
        stratisCoin.id = "strat"
        allCoins.append(stratisCoin)
        
        //31 siacoin
        
        return allCoins
    }
}
