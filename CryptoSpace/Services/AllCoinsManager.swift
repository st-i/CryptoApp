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
        bitcoinCoin.fullName = "Bitcoin" //1Quoine or bitfinex
        bitcoinCoin.shortName = "BTC"
        bitcoinCoin.id = "btc"
        bitcoinCoin.exchange = ExchangeBehavior.Quoine
        bitcoinCoin.bitfinexId = "btc"
//        bitcoinCoin.okexId = "btc"
        allCoins.append(bitcoinCoin)
        
        //2
        let ethereumCoin = Coin.init()
        ethereumCoin.fullName = "Ethereum" //1Quoine or bittrex or okex
        ethereumCoin.shortName = "ETH"
        ethereumCoin.id = "eth"
        ethereumCoin.exchange = ExchangeBehavior.Quoine
//        ethereumCoin.bitfinexId = "eth"
        ethereumCoin.okexId = "eth"
        allCoins.append(ethereumCoin)
        
        //3
        let rippleCoin = Coin.init()
        rippleCoin.fullName = "Ripple" //1bittrex or okex
        rippleCoin.shortName = "XRP"
        rippleCoin.id = "xpr"
        rippleCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(rippleCoin)
        
        //4
        let bitcoinCashCoin = Coin.init()
        bitcoinCashCoin.fullName = "Bitcoin Cash" //1bittrex or okex
        bitcoinCashCoin.shortName = "BCC" //нужно на BCH
        bitcoinCashCoin.id = "bcc"
        bitcoinCashCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(bitcoinCashCoin)
        
        //5
        let litecoinCoin = Coin.init()
        litecoinCoin.fullName = "Litecoin" //1bittrex or okex
        litecoinCoin.shortName = "LTC"
        litecoinCoin.id = "ltc"
        litecoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(litecoinCoin)
        
        //6
        let neoCoin = Coin.init()
        neoCoin.fullName = "NEO" //1bittrex or okex
        neoCoin.shortName = "NEO"
        neoCoin.id = "neo"
        neoCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(neoCoin)
        
        //7
        let cardanoCoin = Coin.init()
        cardanoCoin.fullName = "Cardano" //1bittrex or abucoins
        cardanoCoin.shortName = "ADA"
        cardanoCoin.id = "ada"
        cardanoCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(cardanoCoin)
        
        //8
        let stellarCoin = Coin.init()
        stellarCoin.fullName = "Stellar" //1bittrex or okex
        stellarCoin.shortName = "XLM"
        stellarCoin.id = "xlm"
        stellarCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(stellarCoin)
        
        //9
        let eosCoin = Coin.init()
        eosCoin.fullName = "EOS" //1hitbtc or okex
        eosCoin.shortName = "EOS"
        eosCoin.id = "eos"
        eosCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(eosCoin)
        
        //10
        let dashCoin = Coin.init()
        dashCoin.fullName = "Dash" //1bittrex or okex
        dashCoin.shortName = "DASH"
        dashCoin.id = "dash"
        dashCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(dashCoin)
        
        //11
        let moneroCoin = Coin.init()
        moneroCoin.fullName = "Monero" //1bittrex or okex
        moneroCoin.shortName = "XMR"
        moneroCoin.id = "xmr"
        moneroCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(moneroCoin)
        
        //12
        let iotaCoin = Coin.init()
        iotaCoin.fullName = "IOTA" //1gate.io or okex(!iota)
        iotaCoin.shortName = "IOTA"
        iotaCoin.id = "iota"
        iotaCoin.exchange = ExchangeBehavior.Gate_io
        iotaCoin.okexId = "iota"
        allCoins.append(iotaCoin)
        
        //13
        let nemCoin = Coin.init()
        nemCoin.fullName = "NEM" //1bittrex or okex
        nemCoin.shortName = "XEM"
        nemCoin.id = "xem"
        nemCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(nemCoin)
        
        //14
        let ethereumClassicCoin = Coin.init()
        ethereumClassicCoin.fullName = "Ethereum Classic" //1bittrex or okex
        ethereumClassicCoin.shortName = "ETC"
        ethereumClassicCoin.id = "etc"
        ethereumClassicCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(ethereumClassicCoin)
        
        //15
        let tronCoin = Coin.init()
        tronCoin.fullName = "TRON" //1bittrex or okex
        tronCoin.shortName = "TRX"
        tronCoin.id = "trx"
        tronCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(tronCoin)
        
        //16
        let veChainCoin = Coin.init()
        veChainCoin.fullName = "VeChain" //1hitbtc or Quoine/Qryptos and liqui
        veChainCoin.shortName = "VEN"
        veChainCoin.id = "ven"
        veChainCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(veChainCoin)
        
        //17
        let tetherCoin = Coin.init()
        tetherCoin.fullName = "Tether" //1hitbtc. or okex, но нужно считать по-другому, так как запрос btc_usdt
        tetherCoin.shortName = "USDT"
        tetherCoin.id = "usdt"
        tetherCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(tetherCoin)
        
        //18
        let liskCoin = Coin.init()
        liskCoin.fullName = "Lisk" //1bittrex or abucoins
        liskCoin.shortName = "LSK"
        liskCoin.id = "lsk"
        liskCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(liskCoin)
        
        //19
        let bitcoinGoldCoin = Coin.init()
        bitcoinGoldCoin.fullName = "Bitcoin Gold" //1bittrex or okex
        bitcoinGoldCoin.shortName = "BTG"
        bitcoinGoldCoin.id = "btg"
        bitcoinGoldCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(bitcoinGoldCoin)
        
        //20
        let qtumCoin = Coin.init()
        qtumCoin.fullName = "Qtum" //1bittrex or okex
        qtumCoin.shortName = "QTUM"
        qtumCoin.id = "qtum"
        qtumCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(qtumCoin)
        
        //21
        let omiseGoCoin = Coin.init()
        omiseGoCoin.fullName = "OmiseGo" //1bittrex or okex
        omiseGoCoin.shortName = "OMG"
        omiseGoCoin.id = "omg"
        omiseGoCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(omiseGoCoin)
        
        //22
        let iconCoin = Coin.init()
        iconCoin.fullName = "ICON" //1hitbtc or okex
        iconCoin.shortName = "ICX"
        iconCoin.id = "icx"
        iconCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(iconCoin)
        
        //23
        let zcashCoin = Coin.init()
        zcashCoin.fullName = "Zcash" //1bittrex or okex
        zcashCoin.shortName = "ZEC"
        zcashCoin.id = "zec"
        zcashCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(zcashCoin)
        
        //24
        let nanoCoin = Coin.init()
        nanoCoin.fullName = "Nano" //1kucoin or okex
        nanoCoin.shortName = "XRB"
        nanoCoin.id = "xrb"
        nanoCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(nanoCoin)
        
        //25
        let binanceCoinCoin = Coin.init()
        binanceCoinCoin.fullName = "Binance Coin" //1binance.
        binanceCoinCoin.shortName = "BNB"
        binanceCoinCoin.id = "bnb"
        binanceCoinCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(binanceCoinCoin)
        
        //26
        let bytecoinCoin = Coin.init()
        bytecoinCoin.fullName = "Bytecoin" //1poloniex
        bytecoinCoin.shortName = "BCN"
        bytecoinCoin.id = "bcn"
        bytecoinCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(bytecoinCoin)
        
        //27
        let steemCoin = Coin.init()
        steemCoin.fullName = "Steem" //1bittrex or poloniex
        steemCoin.shortName = "STEEM"
        steemCoin.id = "steem"
        steemCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(steemCoin)
        
        //28
        let vergeCoin = Coin.init()
        vergeCoin.fullName = "Verge" //1bittrex or yobit
        vergeCoin.shortName = "XVG"
        vergeCoin.id = "xvg"
        vergeCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(vergeCoin)
        
        //29
        let populousCoin = Coin.init()
        populousCoin.fullName = "Populous" //1hitbtc or okex
        populousCoin.shortName = "PPT"
        populousCoin.id = "ppt"
        populousCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(populousCoin)
        
        //30
        let rChainCoin = Coin.init()
        rChainCoin.fullName = "RChain" //1kucoin
        rChainCoin.shortName = "RHOC"
        rChainCoin.id = "rhoc"
        rChainCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(rChainCoin)
        
        //31
        let siacoinCoin = Coin.init()
        siacoinCoin.fullName = "Siacoin" //1bittrex or abucoins and poloniex
        siacoinCoin.shortName = "SC"
        siacoinCoin.id = "sc"
        siacoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(siacoinCoin)
        
        //32
        let stratisCoin = Coin.init()
        stratisCoin.fullName = "Stratis" //1bittrex or abucoins and poloniex
        stratisCoin.shortName = "STRAT"
        stratisCoin.id = "strat"
        stratisCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(stratisCoin)
        
        //33
        let dogecoinCoin = Coin.init()
        dogecoinCoin.fullName = "Dogecoin" //1bittrex or poloniex
        dogecoinCoin.shortName = "DOGE"
        dogecoinCoin.id = "doge"
        dogecoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(dogecoinCoin)
        
        //34
        let wavesCoin = Coin.init()
        wavesCoin.fullName = "Waves" //1bittrex or Livecoin
        wavesCoin.shortName = "WAVES"
        wavesCoin.id = "waves"
        wavesCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(wavesCoin)
        
        //35
        let digixDaoCoin = Coin.init()
        digixDaoCoin.fullName = "DigixDAO" //1hitbtc or liqui или okex(очень низкий курс)
        digixDaoCoin.shortName = "DGD"
        digixDaoCoin.id = "dgd"
        digixDaoCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(digixDaoCoin)
        
        //36
        let statusCoin = Coin.init()
        statusCoin.fullName = "Status" //1bittrex or okex
        statusCoin.shortName = "SNT"
        statusCoin.id = "snt"
        statusCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(statusCoin)
        
        
        //37
        let makerCoin = Coin.init()
        makerCoin.fullName = "Maker" //1idex. or okex or Gate.io or radar relay
        makerCoin.shortName = "MKR"
        makerCoin.id = "mkr"
        makerCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(makerCoin)
        
        //38
        let bitSharesCoin = Coin.init()
        bitSharesCoin.fullName = "BitShares" //1poloniex
        bitSharesCoin.shortName = "BTS"
        bitSharesCoin.id = "bts"
        bitSharesCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(bitSharesCoin)
        
        //39
        let aeternityCoin = Coin.init()
        aeternityCoin.fullName = "Aeternity" //1hitbtc or Aex
        aeternityCoin.shortName = "AE"
        aeternityCoin.id = "ae"
        aeternityCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(aeternityCoin)
        
        //40
        let waltonchainCoin = Coin.init()
        waltonchainCoin.fullName = "Waltonchain" //1hitbtc or okex
        waltonchainCoin.shortName = "WTC"
        waltonchainCoin.id = "wtc"
        waltonchainCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(waltonchainCoin)
        
        //41
        let decredCoin = Coin.init()
        decredCoin.fullName = "Decred" //1bittrex or poloniex
        decredCoin.shortName = "DCR"
        decredCoin.id = "dcr"
        decredCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(decredCoin)
        
        //42
        let veritaseumCoin = Coin.init()
        veritaseumCoin.fullName = "Veritaseum" //1Hitbtc
        veritaseumCoin.shortName = "VERI"
        veritaseumCoin.id = "veri"
        veritaseumCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(veritaseumCoin)
        
        //43
        let augurCoin = Coin.init()
        augurCoin.fullName = "Augur" //1bittrex or abucoins and poloniex
        augurCoin.shortName = "REP"
        augurCoin.id = "rep"
        augurCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(augurCoin)
        
        //44
        let zClassicCoin = Coin.init()
        zClassicCoin.fullName = "ZClassic" //1bittrex or coinexchange
        zClassicCoin.shortName = "ZCL"
        zClassicCoin.id = "zcl"
        zClassicCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(zClassicCoin)
        
        //45
        let zero0xCoin = Coin.init()
        zero0xCoin.fullName = "0x" //1bittrex or okex
        zero0xCoin.shortName = "ZRX"
        zero0xCoin.id = "zrx"
        zero0xCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(zero0xCoin)
        
        //46
        let electroneumCoin = Coin.init()
        electroneumCoin.fullName = "Electroneum" //1cryptopia or Qryptos or tradeogre
        electroneumCoin.shortName = "ETN"
        electroneumCoin.id = "etn"
        electroneumCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(electroneumCoin)
        
        //47
        let hshareCoin = Coin.init()
        hshareCoin.fullName = "Hshare" //1hitbtc or okex
        hshareCoin.shortName = "HSR"
        hshareCoin.id = "hsr"
        hshareCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(hshareCoin)
        
        //48
        let revainCoin = Coin.init()
        revainCoin.fullName = "Revain" //1hitbtc or okex
        revainCoin.shortName = "R"
        revainCoin.id = "r"
        revainCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(revainCoin)
        
        //49
        let komodoCoin = Coin.init()
        komodoCoin.fullName = "Komodo" //1bittrex or cryptopia or hitbtc or cryptox or coinexchange
        komodoCoin.shortName = "KMD"
        komodoCoin.id = "kmd"
        komodoCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(komodoCoin)
        
        //50
        let ardorCoin = Coin.init()
        ardorCoin.fullName = "Ardor" //1bittrex or hitbtc or poloniex or LiteBit.eu or Aex
        ardorCoin.shortName = "ARDR"
        ardorCoin.id = "ardr"
        ardorCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(ardorCoin)
        
        //51
        let kuCoinSharesCoin = Coin.init()
        kuCoinSharesCoin.fullName = "KuCoin Shares" //1kucoin
        kuCoinSharesCoin.shortName = "KCS"
        kuCoinSharesCoin.id = "kcs"
        kuCoinSharesCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(kuCoinSharesCoin)
        
        //52
        let arkCoin = Coin.init()
        arkCoin.fullName = "Ark" //1cryptopia or okex
        arkCoin.shortName = "ARK"
        arkCoin.id = "ark"
        arkCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(arkCoin)
        
        //53
        let gasCoin = Coin.init()
        gasCoin.fullName = "Gas" //1poloniex or okex
        gasCoin.shortName = "GAS"
        gasCoin.id = "gas"
        gasCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(gasCoin)
        
        //54
        let zilliqaCoin = Coin.init()
        zilliqaCoin.fullName = "Zilliqa" //1idex. or gate.io
        zilliqaCoin.shortName = "ZIL"
        zilliqaCoin.id = "zil"
        zilliqaCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(zilliqaCoin)
        
        //55
        let basicAttentionTokenCoin = Coin.init()
        basicAttentionTokenCoin.fullName = "Basic Attention Token" //1gate.io or bitfinex (Ethfinex)
        basicAttentionTokenCoin.shortName = "BAT"
        basicAttentionTokenCoin.id = "bat"
        basicAttentionTokenCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(basicAttentionTokenCoin)
        
        //56
        let loopringCoin = Coin.init()
        loopringCoin.fullName = "Loopring" //1hitbtc or okex or bittrex(добавили позже на биржу)
        loopringCoin.shortName = "LRC"
        loopringCoin.id = "lrc"
        loopringCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(loopringCoin)
        
        //57
        let digiByteCoin = Coin.init()
        digiByteCoin.fullName = "DigiByte" //1poloniex or okex
        digiByteCoin.shortName = "DGB"
        digiByteCoin.id = "dgb"
        digiByteCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(digiByteCoin)
        
        //58
        let bytomCoin = Coin.init()
        bytomCoin.fullName = "Bytom" //1hitbtc or okex
        bytomCoin.shortName = "BTM"
        bytomCoin.id = "btm"
        bytomCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(bytomCoin)
        
        //59
        let aelfCoin = Coin.init()
        aelfCoin.fullName = "aelf" //1kucoin or okex
        aelfCoin.shortName = "ELF"
        aelfCoin.id = "elf"
        aelfCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(aelfCoin)
        
        //60
        let cryptonexCoin = Coin.init()
        cryptonexCoin.fullName = "Cryptonex" //1hitbtc or Yobit
        cryptonexCoin.shortName = "CNX"
        cryptonexCoin.id = "cnx"
        cryptonexCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(cryptonexCoin)
        
        //61
        let dragonchainCoin = Coin.init()
        dragonchainCoin.fullName = "Dragonchain" //1kucoin or Gate.io or fatbtc or tidex
        dragonchainCoin.shortName = "DRGN"
        dragonchainCoin.id = "drgn"
        dragonchainCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(dragonchainCoin)
        
        //62
        let monacoinCoin = Coin.init()
        monacoinCoin.fullName = "MonaCoin" //1livecoin. or Bleutrade
        monacoinCoin.shortName = "MONA"
        monacoinCoin.id = "mona"
        monacoinCoin.exchange = ExchangeBehavior.Livecoin
        allCoins.append(monacoinCoin)
        
        //63
        let syscoinCoin = Coin.init()
        syscoinCoin.fullName = "Syscoin" //1poloniex or livecoin or aex or tradebytrade
        syscoinCoin.shortName = "SYS"
        syscoinCoin.id = "sys"
        syscoinCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(syscoinCoin)
        
        //64
        let dentCoin = Coin.init()
        dentCoin.fullName = "Dent" //1hitbtc. or okex
        dentCoin.shortName = "DENT"
        dentCoin.id = "dent"
        dentCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(dentCoin)
        
        //65
        let qashCoin = Coin.init()
        qashCoin.fullName = "QASH" //1idex. or Ethfinex or quoine or aex
        qashCoin.shortName = "QASH"
        qashCoin.id = "qash"
        qashCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(qashCoin)
        
        //66
        let nebulasCoin = Coin.init()
        nebulasCoin.fullName = "Nebulas" //1idex. or okex
        nebulasCoin.shortName = "NAS"
        nebulasCoin.id = "nas"
        nebulasCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(nebulasCoin)
        
        //67
        let kyberNetwork = Coin.init()
        kyberNetwork.fullName = "Kyber Network" //1kucoin or okex
        kyberNetwork.shortName = "KNC"
        kyberNetwork.id = "knc"
        kyberNetwork.exchange = ExchangeBehavior.Kucoin
        allCoins.append(kyberNetwork)
        
        //68
        let pivxCoin = Coin.init()
        pivxCoin.fullName = "PIVX" //1cryptopia or TradeByTrade or yobit(30per60) or livecoin(высокий курс) or litebit.eu(к евро)
        pivxCoin.shortName = "PIVX"
        pivxCoin.id = "pivx"
        pivxCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(pivxCoin)
        
        //69
        let polymathCoin = Coin.init()
        polymathCoin.fullName = "Polymath" //1kucoin or idex
        polymathCoin.shortName = "POLY"
        polymathCoin.id = "poly"
        polymathCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(polymathCoin)
        
        //70
        let aionCoin = Coin.init()
        aionCoin.fullName = "Aion" //1kucoin or liqui or idex or radar relay
        aionCoin.shortName = "AION"
        aionCoin.id = "aion"
        aionCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(aionCoin)
        
        //71
        let dentacoinCoin = Coin.init()
        dentacoinCoin.fullName = "Dentacoin" //1Hitbtc. or coinexchange or coinfalcon
        dentacoinCoin.shortName = "DCN"
        dentacoinCoin.id = "dcn"
        dentacoinCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(dentacoinCoin)
        
        //72
        let golemCoin = Coin.init()
        golemCoin.fullName = "Golem" //1poloniex or okex
        golemCoin.shortName = "GNT"
        golemCoin.id = "gnt"
        golemCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(golemCoin)
        
        //73
        let reddCoinCoin = Coin.init()
        reddCoinCoin.fullName = "ReddCoin" //1cryptopia or litebit or yobit or Bleutrade
        reddCoinCoin.shortName = "RDD"
        reddCoinCoin.id = "rdd"
        reddCoinCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(reddCoinCoin)
        
        //74
        let bitcoreCoin = Coin.init()
        bitcoreCoin.fullName = "Bitcore" //1hitbtc or bitz or cryptopia
        bitcoreCoin.shortName = "BTX"
        bitcoreCoin.id = "btx"
        bitcoreCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(bitcoreCoin)
        
        //75
        let byteballBytesCoin = Coin.init()
        byteballBytesCoin.fullName = "Byteball Bytes" //1bittrex or cryptopia or cryptox
        byteballBytesCoin.shortName = "GBYTE"
        byteballBytesCoin.id = "gbyte"
        byteballBytesCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(byteballBytesCoin)
        
        //76
        let iostokenCoin = Coin.init()
        iostokenCoin.fullName = "IOStoken" //1kucoin or okex
        iostokenCoin.shortName = "IOST"
        iostokenCoin.id = "iost"
        iostokenCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(iostokenCoin)
        
        //77
        let factomCoin = Coin.init()
        factomCoin.fullName = "Factom" //1poloniex or bitz or cryptopia or qryptos
        factomCoin.shortName = "FCT"
        factomCoin.id = "fct"
        factomCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(factomCoin)
        
        //78
        let ethosCoin = Coin.init()
        ethosCoin.fullName = "Ethos" //1hitbtc or coinexchange or livecoin(высокий) or radarrelay or cobinhood
        ethosCoin.shortName = "BQX"
        ethosCoin.id = "bqx"
        ethosCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(ethosCoin)
        
        //79
        let gxchainCoin = Coin.init()
        gxchainCoin.fullName = "GXChain" //1gate.io or bitz or bigone or Allcoin(курс выше)
        gxchainCoin.shortName = "GXS"
        gxchainCoin.id = "gxs"
        gxchainCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(gxchainCoin)
        
        //80
        let kinCoin = Coin.init()
        kinCoin.fullName = "Kin" //1idex. or fatbtc or coinfalcon or Stellar Decentralized Exchange(~)
        kinCoin.shortName = "KIN"
        kinCoin.id = "kin"
        kinCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(kinCoin)
        
        //81
        let funFairCoin = Coin.init()
        funFairCoin.fullName = "FunFair" //1hitbtc or okex
        funFairCoin.shortName = "FUN"
        funFairCoin.id = "fun"
        funFairCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(funFairCoin)
        
        //82
        let chainLinkCoin = Coin.init()
        chainLinkCoin.fullName = "ChainLink" //1idex. or okex
        chainLinkCoin.shortName = "LINK"
        chainLinkCoin.id = "link"
        chainLinkCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(chainLinkCoin)
        
        //83
        let powerLedgerCoin = Coin.init()
        powerLedgerCoin.fullName = "Power Ledger" //1kucoin or Bxthailand or cryptopia or Gate.io or bigone(высокий) or TDAX
        powerLedgerCoin.shortName = "POWR"
        powerLedgerCoin.id = "powr"
        powerLedgerCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(powerLedgerCoin)
        
        //84
        let saltCoin = Coin.init()
        saltCoin.fullName = "SALT" //1idex. or okex
        saltCoin.shortName = "SALT"
        saltCoin.id = "salt"
        saltCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(saltCoin)
        
        //85
        let cindicatorCoin = Coin.init()
        cindicatorCoin.fullName = "Cindicator" //1Hitbtc
        cindicatorCoin.shortName = "CND"
        cindicatorCoin.id = "cnd"
        cindicatorCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(cindicatorCoin)
        
        //86
        let zCoinCoin = Coin.init()
        zCoinCoin.fullName = "ZCoin" //1cryptopia or aex or Bxthailand or coinexchange or LiteBit.eu
        zCoinCoin.shortName = "XZC"
        zCoinCoin.id = "xzc"
        zCoinCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(zCoinCoin)
        
        //87
        let nxtCoin = Coin.init()
        nxtCoin.fullName = "Nxt" //1Poloniex or aex or Hitbtc or livecoin or coinegg
        nxtCoin.shortName = "NXT"
        nxtCoin.id = "nxt"
        nxtCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(nxtCoin)
        
        //88
        let pillarCoin = Coin.init()
        pillarCoin.fullName = "Pillar" //1hitbtc or cryptopia or idex
        pillarCoin.shortName = "PLR"
        pillarCoin.id = "plr"
        pillarCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(pillarCoin)
        
        //89
        let particlCoin = Coin.init()
        particlCoin.fullName = "Particl" //1bittrex or LiteBit.eu or bitz
        particlCoin.shortName = "PART"
        particlCoin.id = "part"
        particlCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(particlCoin)
        
        //90
        let bancorCoin = Coin.init()
        bancorCoin.fullName = "Bancor" //1hitbtc or okex
        bancorCoin.shortName = "BNT"
        bancorCoin.id = "bnt"
        bancorCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(bancorCoin)
        
        //91
        let requestNetworkCoin = Coin.init()
        requestNetworkCoin.fullName = "Request Network" //1kucoin or okex
        requestNetworkCoin.shortName = "REQ"
        requestNetworkCoin.id = "req"
        requestNetworkCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(requestNetworkCoin)
        
        //92
        let enigmaCoin = Coin.init()
        enigmaCoin.fullName = "Enigma" //1hitbtc.(к ETH) or okex
        enigmaCoin.shortName = "ENG"
        enigmaCoin.id = "eng"
        enigmaCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(enigmaCoin)
        
        //93
        let maidSafeCoinCoin = Coin.init()
        maidSafeCoinCoin.fullName = "MaidSafeCoin" //1bittrex or poloniex or
        maidSafeCoinCoin.shortName = "MAID"
        maidSafeCoinCoin.id = "maid"
        maidSafeCoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(maidSafeCoinCoin)
        
        //94
        let smartCashCoin = Coin.init()
        smartCashCoin.fullName = "SmartCash" //1Hitbtc(высокий курс) or coinexchange or Stocks.Exchange
        smartCashCoin.shortName = "SMART"
        smartCashCoin.id = "smart"
        smartCashCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(smartCashCoin)
        
        //95
        let neblioCoin = Coin.init()
        neblioCoin.fullName = "Neblio" //1Hitbtc or Kucoin or cryptopia
        neblioCoin.shortName = "NEBL"
        neblioCoin.id = "nebl"
        neblioCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(neblioCoin)
        
        //96
        let tenXCoin = Coin.init()
        tenXCoin.fullName = "TenX" //1hitbtc or okex
        tenXCoin.shortName = "PAY"
        tenXCoin.id = "pay"
        tenXCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(tenXCoin)
        
        //97
        let emercoinCoin = Coin.init()
        emercoinCoin.fullName = "Emercoin" //1bittrex or hitbtc or livecoin or cryptopia or xBTCe or LiteBit.eu or coinexchange or
        emercoinCoin.shortName = "EMC"
        emercoinCoin.id = "emc"
        emercoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(emercoinCoin)
        
        //98
        let blocknetCoin = Coin.init()
        blocknetCoin.fullName = "Blocknet" //1bittrex
        blocknetCoin.shortName = "BLOCK"
        blocknetCoin.id = "block"
        blocknetCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(blocknetCoin)
        
        //99
        let vertcoinCoin = Coin.init()
        vertcoinCoin.fullName = "Vertcoin" //1bittrex or poloniex or coinegg
        vertcoinCoin.shortName = "VTC"
        vertcoinCoin.id = "vtc"
        vertcoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(vertcoinCoin)
        
        //100
        let ignisCoin = Coin.init()
        ignisCoin.fullName = "Ignis" //1bittrex or Aex or hitbtc or Stocks.Exchange
        ignisCoin.shortName = "IGNIS"
        ignisCoin.id = "ignis"
        ignisCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(ignisCoin)
        
        //101
        let raidenNetworkTokenCoin = Coin.init()
        raidenNetworkTokenCoin.fullName = "Raiden Network Token" //1kucoin or okex
        raidenNetworkTokenCoin.shortName = "RDN"
        raidenNetworkTokenCoin.id = "rdn"
        raidenNetworkTokenCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(raidenNetworkTokenCoin)
        
        //102
        let gameCreditsCoin = Coin.init()
        gameCreditsCoin.fullName = "GameCredits" //1bittrex or poloniex or Hitbtc or...
        gameCreditsCoin.shortName = "GAME"
        gameCreditsCoin.id = "game"
        gameCreditsCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(gameCreditsCoin)
        
        //103
        let quantstampCoin = Coin.init()
        quantstampCoin.fullName = "Quantstamp" //1kucoin or Gate.io or idex or radar relay
        quantstampCoin.shortName = "QSP"
        quantstampCoin.id = "qsp"
        quantstampCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(quantstampCoin)
        
        //104
        let singularityNetCoin = Coin.init()
        singularityNetCoin.fullName = "SingularityNET" //1kucoin or Tidex or idex
        singularityNetCoin.shortName = "AGI"
        singularityNetCoin.id = "agi"
        singularityNetCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(singularityNetCoin)
        
        //105
        let waxCoin = Coin.init()
        waxCoin.fullName = "WAX" //1bittrex or coinfalcon or kucoin or hitbtc or...
        waxCoin.shortName = "WAX"
        waxCoin.id = "wax"
        waxCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(waxCoin)
        
        //106
        let iconomiCoin = Coin.init()
        iconomiCoin.fullName = "Iconomi" //1hitbtc or okex
        iconomiCoin.shortName = "ICN"
        iconomiCoin.id = "icn"
        iconomiCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(iconomiCoin)
        
        //107
        let gnosisCoin = Coin.init()
        gnosisCoin.fullName = "Gnosis" //1bittrex or poloniex or liqui or hitbtc or livecoin or...
        gnosisCoin.shortName = "GNO"
        gnosisCoin.id = "gno"
        gnosisCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(gnosisCoin)
        
        //108
        let poDotEtCoin = Coin.init()
        poDotEtCoin.fullName = "Po.et" //1hitbtc or okex
        poDotEtCoin.shortName = "POE"
        poDotEtCoin.id = "poe"
        poDotEtCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(poDotEtCoin)
        
        //109
        let digitalNoteCoin = Coin.init()
        digitalNoteCoin.fullName = "DigitalNote" //1bittrex or hitbtc
        digitalNoteCoin.shortName = "XDN"
        digitalNoteCoin.id = "xdn"
        digitalNoteCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(digitalNoteCoin)
        
        //110
        let enjinCoinCoin = Coin.init()
        enjinCoinCoin.fullName = "Enjin Coin" //1hitbtc or Qryptos or cryptopia or kucoin
        enjinCoinCoin.shortName = "ENJ"
        enjinCoinCoin.id = "enj"
        enjinCoinCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(enjinCoinCoin)
        
        //111
        let experiencePointsCoin = Coin.init()
        experiencePointsCoin.fullName = "Experience Points" //1coinexchange or Trade Satoshi
        experiencePointsCoin.shortName = "XP"
        experiencePointsCoin.id = "xp"
        experiencePointsCoin.exchange = ExchangeBehavior.CoinExchange
        allCoins.append(experiencePointsCoin)
        
        //112
        let skycoinCoin = Coin.init()
        skycoinCoin.fullName = "Skycoin" //1cryptopia or c2cx
        skycoinCoin.shortName = "SKY"
        skycoinCoin.id = "sky"
        skycoinCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(skycoinCoin)
        
        //113
//        let superNetCoin = Coin.init()
//        superNetCoin.fullName = "SuperNET" //BarterDEX
//        superNetCoin.shortName = "UNITY"
//        superNetCoin.id = "unity"
//        allCoins.append(superNetCoin)
        
        //114
        let santimentNetworkTokenCoin = Coin.init()
        santimentNetworkTokenCoin.fullName = "Santiment Network Token" //1hitbtc.(к ETH) or okex
        santimentNetworkTokenCoin.shortName = "SAN"
        santimentNetworkTokenCoin.id = "san"
        santimentNetworkTokenCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(santimentNetworkTokenCoin)
        
        //115
        let storjCoin = Coin.init()
        storjCoin.fullName = "Storj" //1poloniex or okex
        storjCoin.shortName = "STORJ"
        storjCoin.id = "storj"
        storjCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(storjCoin)
        
        //116
        let bitcoinDarkCoin = Coin.init()
        bitcoinDarkCoin.fullName = "BitcoinDark" //1poloniex or tradebytrade or Bleutrade(низкий курс) or cryptopia
        bitcoinDarkCoin.shortName = "BTCD"
        bitcoinDarkCoin.id = "btcd"
        bitcoinDarkCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(bitcoinDarkCoin)
        
        //117
        let civicCoin = Coin.init()
        civicCoin.fullName = "Civic" //1poloniex or okex
        civicCoin.shortName = "CVC"
        civicCoin.id = "cvc"
        civicCoin.exchange = ExchangeBehavior.Poloniex
        allCoins.append(civicCoin)
        
        //118
        let stormCoin = Coin.init()
        stormCoin.fullName = "Storm" //1hitbtc or idex or radar relay
        stormCoin.shortName = "STORM"
        stormCoin.id = "storm"
        stormCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(stormCoin)
        
        //119
        let substratumCoin = Coin.init()
        substratumCoin.fullName = "Substratum" //1hitbtc or okex
        substratumCoin.shortName = "SUB"
        substratumCoin.id = "sub"
        substratumCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(substratumCoin)
        
        //120
        let nexusCoin = Coin.init()
        nexusCoin.fullName = "Nexus" //1bittrex or cryptopia or tradebytrade(высокий)
        nexusCoin.shortName = "NXS"
        nexusCoin.id = "nxs"
        nexusCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(nexusCoin)
        
        //121
        let achainCoin = Coin.init()
        achainCoin.fullName = "Achain" //1hitbtc or okex
        achainCoin.shortName = "ACT"
        achainCoin.id = "act"
        achainCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(achainCoin)
        
        //122
        let decentralandCoin = Coin.init()
        decentralandCoin.fullName = "Decentraland" //1hitbtc or okex
        decentralandCoin.shortName = "MANA"
        decentralandCoin.id = "mana"
        decentralandCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(decentralandCoin)
        
        //123
//        let bridgeCoinCoin = Coin.init()
//        bridgeCoinCoin.fullName = "BridgeCoin" //не нашел апи
//        bridgeCoinCoin.shortName = "BCO"
//        bridgeCoinCoin.id = "bco"
//        allCoins.append(bridgeCoinCoin)
        
        //124
        let ethlendCoin = Coin.init()
        ethlendCoin.fullName = "ETHLend" //1hitbtc or okex
        ethlendCoin.shortName = "LEND"
        ethlendCoin.id = "lend"
        ethlendCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(ethlendCoin)
        
        //125
        let navcoinCoin = Coin.init()
        navcoinCoin.fullName = "NAV Coin" //1bittrex or poloniex or cryptopia or litebit.eu
        navcoinCoin.shortName = "NAV"
        navcoinCoin.id = "nav"
        navcoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(navcoinCoin)
        
        //126
        let uDotCashCoin = Coin.init()
        uDotCashCoin.fullName = "U.CASH" //1c2cx or btcalpha(нет в json)
        uDotCashCoin.shortName = "UCASH"
        uDotCashCoin.id = "ucash"
        uDotCashCoin.exchange = ExchangeBehavior.C2CX
        allCoins.append(uDotCashCoin)
        
        //127
        let adExCoin = Coin.init()
        adExCoin.fullName = "AdEx" //1bittrex or liqui or hitbtc
        adExCoin.shortName = "ADX"
        adExCoin.id = "adx"
        adExCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(adExCoin)
        
        //128
        let zenCashCoin = Coin.init()
        zenCashCoin.fullName = "ZenCash" //1cryptopia or okex
        zenCashCoin.shortName = "ZEN"
        zenCashCoin.id = "zen"
        zenCashCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(zenCashCoin)
        
        //129
        let dynamicTradingRightsCoin = Coin.init()
        dynamicTradingRightsCoin.fullName = "Dynamic Trading Rights" //1livecoin.
        dynamicTradingRightsCoin.shortName = "DTR"
        dynamicTradingRightsCoin.id = "dtr"
        dynamicTradingRightsCoin.exchange = ExchangeBehavior.Livecoin
        allCoins.append(dynamicTradingRightsCoin)
        
        //130
        let oysterCoin = Coin.init()
        oysterCoin.fullName = "Oyster" //1kucoin or cryptopia or coinexchange or idex
        oysterCoin.shortName = "PRL"
        oysterCoin.id = "prl"
        oysterCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(oysterCoin)
        
        //131
        let dewCoin = Coin.init()
        dewCoin.fullName = "DEW" //1bigone
        dewCoin.shortName = "DEW"
        dewCoin.id = "dew"
        dewCoin.exchange = ExchangeBehavior.BigONE
        allCoins.append(dewCoin)
        
        //132
//        let xpaCoin = Coin.init()
//        xpaCoin.fullName = "XPA" //не нашел апи
//        xpaCoin.shortName = "XPA"
//        xpaCoin.id = "xpa"
//        allCoins.append(xpaCoin)
        
        //133
        let mediBlocCoin = Coin.init()
        mediBlocCoin.fullName = "MediBloc" //1gate.io.
        mediBlocCoin.shortName = "MED"
        mediBlocCoin.id = "med"
        mediBlocCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(mediBlocCoin)
        
        //134
        let telcoinCoin = Coin.init()
        telcoinCoin.fullName = "Telcoin" //1kucoin or idex
        telcoinCoin.shortName = "TEL"
        telcoinCoin.id = "tel"
        telcoinCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(telcoinCoin)
        
        //135
        let highPerformanceBlockchainCoin = Coin.init()
        highPerformanceBlockchainCoin.fullName = "High Performance Blockchain" //1kucoin or Allcoin
        highPerformanceBlockchainCoin.shortName = "HPB"
        highPerformanceBlockchainCoin.id = "hpb"
        highPerformanceBlockchainCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(highPerformanceBlockchainCoin)
        
        //136
        let aragonCoin = Coin.init()
        aragonCoin.fullName = "Aragon" //1bittrex or liqui or hitbtc or radar relay
        aragonCoin.shortName = "ANT"
        aragonCoin.id = "ant"
        aragonCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(aragonCoin)
        
        //137
        let blockVCoin = Coin.init()
        blockVCoin.fullName = "BLOCKv" //1idex. or okex
        blockVCoin.shortName = "VEE"
        blockVCoin.id = "vee"
        blockVCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(blockVCoin)
        
        //138
        let timeNewBankCoin = Coin.init()
        timeNewBankCoin.fullName = "Time New Bank" //1bigone or Ethfinex or c2cx or okex
        timeNewBankCoin.shortName = "TNB"
        timeNewBankCoin.id = "tnb"
        timeNewBankCoin.exchange = ExchangeBehavior.BigONE
        allCoins.append(timeNewBankCoin)
        
        //139
        let ubiqCoin = Coin.init()
        ubiqCoin.fullName = "Ubiq" //1bittrex or cryptopia or LiteBit.eu
        ubiqCoin.shortName = "UBQ"
        ubiqCoin.id = "ubq"
        ubiqCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(ubiqCoin)
        
        //140
        let monacoCoin = Coin.init()
        monacoCoin.fullName = "Monaco" //1hitbtc or okex
        monacoCoin.shortName = "MCO"
        monacoCoin.id = "mco"
        monacoCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(monacoCoin)
        
        //141
        let sophiaTXCoin = Coin.init()
        sophiaTXCoin.fullName = "SophiaTX" //1idex. or Qryptos or cobinhood or bitz or Yobit or coinfalcon(высокий)
        sophiaTXCoin.shortName = "SPHTX"
        sophiaTXCoin.id = "sphtx"
        sophiaTXCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(sophiaTXCoin)
        
        //142
        let mediSharesCoin = Coin.init()
        mediSharesCoin.fullName = "MediShares" //1Gate.io
        mediSharesCoin.shortName = "MDS"
        mediSharesCoin.id = "mds"
        mediSharesCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(mediSharesCoin)
        
        //143
        let iotChainCoin = Coin.init()
        iotChainCoin.fullName = "IoT Chain" //1kucoin or okex
        iotChainCoin.shortName = "ITC"
        iotChainCoin.id = "itc"
        iotChainCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(iotChainCoin)
        
        //144
        let iExecRLCCoin = Coin.init()
        iExecRLCCoin.fullName = "iExec RLC" //1bittrex or liqui or Hitbtc or gate.io or livecoin or radar relay
        iExecRLCCoin.shortName = "RLC"
        iExecRLCCoin.id = "rlc"
        iExecRLCCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(iExecRLCCoin)
        
        //145
        let bluzelleCoin = Coin.init()
        bluzelleCoin.fullName = "Bluzelle" //1idex. or Gate.io
        bluzelleCoin.shortName = "BLZ"
        bluzelleCoin.id = "blz"
        bluzelleCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(bluzelleCoin)
        
        //146
        let dataCoin = Coin.init()
        dataCoin.fullName = "DATA" //1kucoin or idex
        dataCoin.shortName = "DTA"
        dataCoin.id = "dta"
        dataCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(dataCoin)
        
        //147
        let genesisVisionCoin = Coin.init()
        genesisVisionCoin.fullName = "Genesis Vision" //1hitbtc. or kucoin
        genesisVisionCoin.shortName = "GVT"
        genesisVisionCoin.id = "gvt"
        genesisVisionCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(genesisVisionCoin)
        
        //148
//        let payPieCoin = Coin.init()
//        payPieCoin.fullName = "PayPie" //1fatbtc(удалили) or 1idex(нет в json, volume 0%)
//        payPieCoin.shortName = "PPP"
//        payPieCoin.id = "ppp"
//        payPieCoin.exchange = ExchangeBehavior.Fatbtc
//        allCoins.append(payPieCoin)
        
        //149
        let redPulseCoin = Coin.init()
        redPulseCoin.fullName = "Red Pulse" //1kucoin or TDAX(высокий)
        redPulseCoin.shortName = "RPX"
        redPulseCoin.id = "rpx"
        redPulseCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(redPulseCoin)
        
        //150
//        let biboxTokenCoin = Coin.init()
//        biboxTokenCoin.fullName = "Bibox Token" //не нашел апи
//        biboxTokenCoin.shortName = "BIX"
//        biboxTokenCoin.id = "bix"
//        allCoins.append(biboxTokenCoin)
        
        //151
        let inkCoin = Coin.init()
        inkCoin.fullName = "Ink" //1gate.io or bitz or coinegg or zb.com(ниже) or exx or bigone or Allcoin
        inkCoin.shortName = "INK"
        inkCoin.id = "ink"
        inkCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(inkCoin)
        
        //152
        let vibeCoin = Coin.init()
        vibeCoin.fullName = "VIBE" //1hitbtc
        vibeCoin.shortName = "VIBE"
        vibeCoin.id = "vibe"
        vibeCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(vibeCoin)
        
        //153
        let peercoinCoin = Coin.init()
        peercoinCoin.fullName = "Peercoin" //1bittrex or bitz or tradebytrade or wex or hitbtc or poloniex or...
        peercoinCoin.shortName = "PPC"
        peercoinCoin.id = "ppc"
        peercoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(peercoinCoin)
        
        //154
        let aschCoin = Coin.init()
        aschCoin.fullName = "Asch" //1kucoin or bitz or coinegg(выше)
        aschCoin.shortName = "XAS"
        aschCoin.id = "xas"
        aschCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(aschCoin)
        
        //155
        let ambrosusCoin = Coin.init()
        ambrosusCoin.fullName = "Ambrosus" //1hitbtc or kucoin or Gatecoin or Livecoin
        ambrosusCoin.shortName = "AMB"
        ambrosusCoin.id = "amb"
        ambrosusCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(ambrosusCoin)
        
        //156
        let crypto20Coin = Coin.init()
        crypto20Coin.fullName = "CRYPTO20" //1hitbtc or idex
        crypto20Coin.shortName = "C20"
        crypto20Coin.id = "c20"
        crypto20Coin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(crypto20Coin)
        
        //157
        let metalCoin = Coin.init()
        metalCoin.fullName = "Metal" //1cryptopia or okex
        metalCoin.shortName = "MTL"
        metalCoin.id = "mtl"
        metalCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(metalCoin)
        
        //158
        let wagerrCoin = Coin.init()
        wagerrCoin.fullName = "Wagerr" //1Yobit or Tidex
        wagerrCoin.shortName = "WGR"
        wagerrCoin.id = "wgr"
        wagerrCoin.exchange = ExchangeBehavior.Yobit
        allCoins.append(wagerrCoin)
        
        //159
        let sonmCoin = Coin.init()
        sonmCoin.fullName = "SONM" //1hitbtc(к ETH) or okex
        sonmCoin.shortName = "SNM"
        sonmCoin.id = "snm"
        sonmCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(sonmCoin)
        
        //160
        let agorasTokensCoin = Coin.init()
        agorasTokensCoin.fullName = "Agoras Tokens" //1bittrex
        agorasTokensCoin.shortName = "AGRS"
        agorasTokensCoin.id = "agrs"
        agorasTokensCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(agorasTokensCoin)
        
        //161
        let sirinLabsTokenCoin = Coin.init()
        sirinLabsTokenCoin.fullName = "SIRIN LABS Token" //1bittrex or liqui or idex(выше) or tidex(выше)
        sirinLabsTokenCoin.shortName = "SRN"
        sirinLabsTokenCoin.id = "srn"
        sirinLabsTokenCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(sirinLabsTokenCoin)
        
        //162
        let thetaTokenCoin = Coin.init()
        thetaTokenCoin.fullName = "Theta Token" //1idex. or okex
        thetaTokenCoin.shortName = "THETA"
        thetaTokenCoin.id = "theta"
        thetaTokenCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(thetaTokenCoin)
        
        //163
        let puraCoin = Coin.init()
        puraCoin.fullName = "Pura" //1kucoin or coinexchange or cryptopia or ccex
        puraCoin.shortName = "PURA"
        puraCoin.id = "pura"
        puraCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(puraCoin)
        
        //164
        let deepBrainChainCoin = Coin.init()
        deepBrainChainCoin.fullName = "DeepBrain Chain" //1kucoin or gate.io or Allcoin
        deepBrainChainCoin.shortName = "DBC"
        deepBrainChainCoin.id = "dbc"
        deepBrainChainCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(deepBrainChainCoin)
        
        //165
        let ripioCreditNetworkCoin = Coin.init()
        ripioCreditNetworkCoin.fullName = "Ripio Credit Network" //1gate.io. or okex
        ripioCreditNetworkCoin.shortName = "RCN"
        ripioCreditNetworkCoin.id = "rcn"
        ripioCreditNetworkCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(ripioCreditNetworkCoin)
        
        //166
        let eidooCoin = Coin.init()
        eidooCoin.fullName = "Eidoo" //1hitbtc or okex
        eidooCoin.shortName = "EDO"
        eidooCoin.id = "edo"
        eidooCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(eidooCoin)
        
        //167
        let appCoinsCoin = Coin.init()
        appCoinsCoin.fullName = "AppCoins" //1binance.
        appCoinsCoin.shortName = "APPC"
        appCoinsCoin.id = "appc"
        appCoinsCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(appCoinsCoin)
        
        //168
        let jibrelNetworkCoin = Coin.init()
        jibrelNetworkCoin.fullName = "Jibrel Network" //1hitbtc. or gate.io or kucoin or idex
        jibrelNetworkCoin.shortName = "JNT"
        jibrelNetworkCoin.id = "jnt"
        jibrelNetworkCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(jibrelNetworkCoin)
        
        //169
        let einsteiniumCoin = Coin.init()
        einsteiniumCoin.fullName = "Einsteinium" //1bittrex or poloniex or cryptopia
        einsteiniumCoin.shortName = "EMC2"
        einsteiniumCoin.id = "emc2"
        einsteiniumCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(einsteiniumCoin)
        
        //170
        let cyberMilesCoin = Coin.init()
        cyberMilesCoin.fullName = "CyberMiles" //1binance. or okex
        cyberMilesCoin.shortName = "CMT"
        cyberMilesCoin.id = "cmt"
        cyberMilesCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(cyberMilesCoin)
        
        //171
        let etherpartyCoin = Coin.init()
        etherpartyCoin.fullName = "Etherparty" //1hitbtc or gate.io or acx
        etherpartyCoin.shortName = "FUEL"
        etherpartyCoin.id = "fuel"
        etherpartyCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(etherpartyCoin)
        
        //172
        let waBiCoin = Coin.init()
        waBiCoin.fullName = "WaBi" //1idex. or binance
        waBiCoin.shortName = "WABI"
        waBiCoin.id = "wabi"
        waBiCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(waBiCoin)
        
        //173
        let airSwapCoin = Coin.init()
        airSwapCoin.fullName = "AirSwap" //1binance. or okex
        airSwapCoin.shortName = "AST"
        airSwapCoin.id = "ast"
        airSwapCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(airSwapCoin)
        
        //174
        let xtrabytesCoin = Coin.init()
        xtrabytesCoin.fullName = "XTRABYTES" //1cryptopia or yobit or coinfalcon or c-cex
        xtrabytesCoin.shortName = "XBY"
        xtrabytesCoin.id = "xby"
        xtrabytesCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(xtrabytesCoin)
        
        //175
        let simpleTokenCoin = Coin.init()
        simpleTokenCoin.fullName = "Simple Token" //1gate.io. or okex
        simpleTokenCoin.shortName = "OST"
        simpleTokenCoin.id = "ost"
        simpleTokenCoin.exchange = ExchangeBehavior.Gate_io
        allCoins.append(simpleTokenCoin)
        
        //176
        let minexCoinCoin = Coin.init()
        minexCoinCoin.fullName = "MinexCoin" //1livecoin. or coinexchange
        minexCoinCoin.shortName = "MNX"
        minexCoinCoin.id = "mnx"
        minexCoinCoin.exchange = ExchangeBehavior.Livecoin
        allCoins.append(minexCoinCoin)
        
        //177
        let melonCoin = Coin.init()
        melonCoin.fullName = "Melon" //1bittrex or liqui or Radar Relay or livecoin
        melonCoin.shortName = "MLN"
        melonCoin.id = "mln"
        melonCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(melonCoin)
        
        //178
        let streamrDATAcoinCoin = Coin.init()
        streamrDATAcoinCoin.fullName = "Streamr DATAcoin" //1hitbtc or Ethfinex or gate.io
        streamrDATAcoinCoin.shortName = "DATA"
        streamrDATAcoinCoin.id = "data"
        streamrDATAcoinCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(streamrDATAcoinCoin)
        
        //179
        let edgelessCoin = Coin.init()
        edgelessCoin.fullName = "Edgeless" //1bittrex or liqui or hitbtc or tidex
        edgelessCoin.shortName = "EDG"
        edgelessCoin.id = "edg"
        edgelessCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(edgelessCoin)
        
        //180
        let counterpartyCoin = Coin.init()
        counterpartyCoin.fullName = "Counterparty" //1bittrex or poloniex
        counterpartyCoin.shortName = "XCP"
        counterpartyCoin.id = "xcp"
        counterpartyCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(counterpartyCoin)
        
        //181
        let quantumResistantLedgerCoin = Coin.init()
        quantumResistantLedgerCoin.fullName = "Quantum Resistant Ledger" //1bittrex or liqui or coinexchange(низкий) or Tidex(очень низкий)
        quantumResistantLedgerCoin.shortName = "QRL"
        quantumResistantLedgerCoin.id = "qrl"
        quantumResistantLedgerCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(quantumResistantLedgerCoin)
        
        //182
        let bitBayCoin = Coin.init()
        bitBayCoin.fullName = "BitBay" //1bittrex or ccex or cryptopia
        bitBayCoin.shortName = "BAY"
        bitBayCoin.id = "bay"
        bitBayCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(bitBayCoin)
        
        //183
        let singularDTVCoin = Coin.init()
        singularDTVCoin.fullName = "SingularDTV" //1hitbtc or okex
        singularDTVCoin.shortName = "SNGLS"
        singularDTVCoin.id = "sngls"
        singularDTVCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(singularDTVCoin)
        
        //184
        let cobinhoodCoin = Coin.init()
        cobinhoodCoin.fullName = "Cobinhood" //1cobinhood
        cobinhoodCoin.shortName = "COB"
        cobinhoodCoin.id = "cob"
        cobinhoodCoin.exchange = ExchangeBehavior.Cobinhood
        allCoins.append(cobinhoodCoin)
        
        //185
        let giftoCoin = Coin.init()
        giftoCoin.fullName = "Gifto" //1binance. or okex
        giftoCoin.shortName = "GTO"
        giftoCoin.id = "gto"
        giftoCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(giftoCoin)
        
        //186
        let insEcosystemCoin = Coin.init()
        insEcosystemCoin.fullName = "INS Ecosystem" //1kucoin or okex
        insEcosystemCoin.shortName = "INS"
        insEcosystemCoin.id = "ins"
        insEcosystemCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(insEcosystemCoin)
        
        //187
        let utrustCoin = Coin.init()
        utrustCoin.fullName = "UTRUST" //1hitbtc or okex
        utrustCoin.shortName = "UTK"
        utrustCoin.id = "utk"
        utrustCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(utrustCoin)
        
        //188
        let metaverseETPCoin = Coin.init()
        metaverseETPCoin.fullName = "Metaverse ETP" //1hitbtc or bitfinex or bitz or TDAX(норм курс) or exx
        metaverseETPCoin.shortName = "ETP"
        metaverseETPCoin.id = "etp"
        metaverseETPCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(metaverseETPCoin)
        
        //189
        let wePowerCoin = Coin.init()
        wePowerCoin.fullName = "WePower" //1idex. or liqui or coinfalcon
        wePowerCoin.shortName = "WPR"
        wePowerCoin.id = "wpr"
        wePowerCoin.exchange = ExchangeBehavior.IDEX
        allCoins.append(wePowerCoin)
        
        //190
        let nulsCoin = Coin.init()
        nulsCoin.fullName = "Nuls" //1kucoin or okex
        nulsCoin.shortName = "NULS"
        nulsCoin.id = "nuls"
        nulsCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(nulsCoin)
        
        //191
        let coinDashCoin = Coin.init()
        coinDashCoin.fullName = "CoinDash" //1hitbtc or gate.io or bigone or Gatecoin
        coinDashCoin.shortName = "CDT"
        coinDashCoin.id = "cdt"
        coinDashCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(coinDashCoin)
        
        //192
        let breadCoin = Coin.init()
        breadCoin.fullName = "Bread" //1binance. or okex
        breadCoin.shortName = "BRD"
        breadCoin.id = "brd"
        breadCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(breadCoin)
        
        //193
        let pacCoinCoin = Coin.init()
        pacCoinCoin.fullName = "PACcoin" //1cryptopia or не нашел на коинмаркеткап
        pacCoinCoin.shortName = "$PAC"
        pacCoinCoin.id = "$pac"
        pacCoinCoin.exchange = ExchangeBehavior.Cryptopia
        allCoins.append(pacCoinCoin)
        
        //194
        let viacoinCoin = Coin.init()
        viacoinCoin.fullName = "Viacoin" //1bittrex or poloniex or Coinroom or LiteBit.eu or yobit
        viacoinCoin.shortName = "VIA"
        viacoinCoin.id = "via"
        viacoinCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(viacoinCoin)
        
        //195
        let nagaCoin = Coin.init()
        nagaCoin.fullName = "NAGA" //1hitbtc or okex
        nagaCoin.shortName = "NGC"
        nagaCoin.id = "ngc"
        nagaCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(nagaCoin)
        
        //196
        let tierionCoin = Coin.init()
        tierionCoin.fullName = "Tierion" //1hitbtc or liqui or gate.io or bigone
        tierionCoin.shortName = "TNT"
        tierionCoin.id = "tnt"
        tierionCoin.exchange = ExchangeBehavior.HitBTC
        allCoins.append(tierionCoin)
        
        //197
        let guldenCoin = Coin.init()
        guldenCoin.fullName = "Gulden" //1bittrex or LiteBit.eu or Bleutrade or yobit or coinexchange
        guldenCoin.shortName = "NLG"
        guldenCoin.id = "nlg"
        guldenCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(guldenCoin)
        
        //198
        let trinityNetworkCreditCoin = Coin.init()
        trinityNetworkCreditCoin.fullName = "Trinity Network Credit" //1kucoin or gate.io
        trinityNetworkCreditCoin.shortName = "TNC"
        trinityNetworkCreditCoin.id = "tnc"
        trinityNetworkCreditCoin.exchange = ExchangeBehavior.Kucoin
        allCoins.append(trinityNetworkCreditCoin)
        
        //199
        let burstCoin = Coin.init()
        burstCoin.fullName = "Burst" //1bittrex or poloniex or livecoin or Coinroom or cCEX
        burstCoin.shortName = "BURST"
        burstCoin.id = "burst"
        burstCoin.exchange = ExchangeBehavior.Bittrex
        allCoins.append(burstCoin)
        
        //200
        let triggersCoin = Coin.init()
        triggersCoin.fullName = "Triggers" //1binance.
        triggersCoin.shortName = "TRIG"
        triggersCoin.id = "trig"
        triggersCoin.exchange = ExchangeBehavior.Binance
        allCoins.append(triggersCoin)
        
        
        return allCoins
    }
    
    class func createArrayWithTopSixCoins() -> [Coin] {
        let allCoins = self.createArrayWithAllCoins()
        var topSixCoinsArray = [Coin]()
        
        for i in 0..<6 {
            topSixCoinsArray.append(allCoins[i])
        }
        
        return topSixCoinsArray
    }
}
