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
        bitcoinCoin.fullName = "Bitcoin" //bitfinex
        bitcoinCoin.shortName = "BTC"
        bitcoinCoin.id = "btc"
        bitcoinCoin.bitfinexId = "btc"
//        bitcoinCoin.okexId = "btc"
        allCoins.append(bitcoinCoin)
        
        //2
        let ethereumCoin = Coin.init()
        ethereumCoin.fullName = "Ethereum" //okex
        ethereumCoin.shortName = "ETH"
        ethereumCoin.id = "eth"
//        ethereumCoin.bitfinexId = "eth"
        ethereumCoin.okexId = "eth"
        allCoins.append(ethereumCoin)
        
        //3
        let rippleCoin = Coin.init()
        rippleCoin.fullName = "Ripple" //okex
        rippleCoin.shortName = "XRP"
        rippleCoin.id = "xpr"
        allCoins.append(rippleCoin)
        
        //4
        let bitcoinCashCoin = Coin.init()
        bitcoinCashCoin.fullName = "Bitcoin Cash" //okex
        bitcoinCashCoin.shortName = "BCH"
        bitcoinCashCoin.id = "bch"
        allCoins.append(bitcoinCashCoin)
        
        //5
        let litecoinCoin = Coin.init()
        litecoinCoin.fullName = "Litecoin" //okex
        litecoinCoin.shortName = "LTC"
        litecoinCoin.id = "ltc"
        allCoins.append(litecoinCoin)
        
        //6
        let cardanoCoin = Coin.init()
        cardanoCoin.fullName = "Cardano" //abucoins
        cardanoCoin.shortName = "ADA"
        cardanoCoin.id = "ada"
        allCoins.append(cardanoCoin)
        
        //7
        let neoCoin = Coin.init()
        neoCoin.fullName = "NEO" //okex
        neoCoin.shortName = "NEO"
        neoCoin.id = "neo"
        allCoins.append(neoCoin)
        
        //8
        let stellarCoin = Coin.init()
        stellarCoin.fullName = "Stellar" //okex
        stellarCoin.shortName = "XLM"
        stellarCoin.id = "xlm"
        allCoins.append(stellarCoin)
        
        //9
        let eosCoin = Coin.init()
        eosCoin.fullName = "EOS" //okex
        eosCoin.shortName = "EOS"
        eosCoin.id = "eos"
        allCoins.append(eosCoin)
        
        //10
        let dashCoin = Coin.init()
        dashCoin.fullName = "Dash" //okex
        dashCoin.shortName = "DASH"
        dashCoin.id = "dash"
        allCoins.append(dashCoin)
        
        //11
        let moneroCoin = Coin.init()
        moneroCoin.fullName = "Monero" //okex
        moneroCoin.shortName = "XMR"
        moneroCoin.id = "xmr"
        allCoins.append(moneroCoin)
        
        //12
        let iotaCoin = Coin.init()
        iotaCoin.fullName = "IOTA" //okex !!!iota
        iotaCoin.shortName = "MIOTA"
        iotaCoin.id = "miota"
        iotaCoin.okexId = "iota"
        allCoins.append(iotaCoin)
        
        //13
        let nemCoin = Coin.init()
        nemCoin.fullName = "NEM" //okex
        nemCoin.shortName = "XEM"
        nemCoin.id = "xem"
        allCoins.append(nemCoin)
        
        //14
        let ethereumClassicCoin = Coin.init()
        ethereumClassicCoin.fullName = "Ethereum Classic" //okex
        ethereumClassicCoin.shortName = "ETC"
        ethereumClassicCoin.id = "etc"
        allCoins.append(ethereumClassicCoin)
        
        //15
        let tronCoin = Coin.init()
        tronCoin.fullName = "TRON" //okex
        tronCoin.shortName = "TRX"
        tronCoin.id = "trx"
        allCoins.append(tronCoin)
        
        //16
        let veChainCoin = Coin.init()
        veChainCoin.fullName = "VeChain" // Quoine/Qryptos and liqui
        veChainCoin.shortName = "VEN"
        veChainCoin.id = "ven"
        allCoins.append(veChainCoin)
        
        //17
        let tetherCoin = Coin.init()
        tetherCoin.fullName = "Tether" //okex, но нужно считать по-другому, так как запрос btc_usdt
        tetherCoin.shortName = "USDT"
        tetherCoin.id = "usdt"
        allCoins.append(tetherCoin)
        
        //18
        let liskCoin = Coin.init()
        liskCoin.fullName = "Lisk" //abucoins
        liskCoin.shortName = "LSK"
        liskCoin.id = "lsk"
        allCoins.append(liskCoin)
        
        //19
        let bitcoinGoldCoin = Coin.init()
        bitcoinGoldCoin.fullName = "Bitcoin Gold" //okex
        bitcoinGoldCoin.shortName = "BTG"
        bitcoinGoldCoin.id = "btg"
        allCoins.append(bitcoinGoldCoin)
        
        //20
        let qtumCoin = Coin.init()
        qtumCoin.fullName = "Qtum" //okex
        qtumCoin.shortName = "QTUM"
        qtumCoin.id = "qtum"
        allCoins.append(qtumCoin)
        
        //21
        let omiseGoCoin = Coin.init()
        omiseGoCoin.fullName = "OmiseGo" //okex
        omiseGoCoin.shortName = "OMG"
        omiseGoCoin.id = "omg"
        allCoins.append(omiseGoCoin)
        
        //22
        let iconCoin = Coin.init()
        iconCoin.fullName = "ICON" //okex
        iconCoin.shortName = "ICX"
        iconCoin.id = "icx"
        allCoins.append(iconCoin)
        
        //23
        let zcashCoin = Coin.init()
        zcashCoin.fullName = "Zcash" //okex
        zcashCoin.shortName = "ZEC"
        zcashCoin.id = "zec"
        allCoins.append(zcashCoin)
        
        //24
        let nanoCoin = Coin.init()
        nanoCoin.fullName = "Nano" //okex
        nanoCoin.shortName = "NANO"
        nanoCoin.id = "nano"
        allCoins.append(nanoCoin)
        
        //25
        let binanceCoinCoin = Coin.init()
        binanceCoinCoin.fullName = "Binance Coin" //binance
        binanceCoinCoin.shortName = "BNB"
        binanceCoinCoin.id = "bnb"
        allCoins.append(binanceCoinCoin)
        
        //26
        let bytecoinCoin = Coin.init()
        bytecoinCoin.fullName = "Bytecoin" //poloniex
        bytecoinCoin.shortName = "BCN"
        bytecoinCoin.id = "bcn"
        allCoins.append(bytecoinCoin)
        
        //27
        let steemCoin = Coin.init()
        steemCoin.fullName = "Steem" //poloniex
        steemCoin.shortName = "STEEM"
        steemCoin.id = "steem"
        allCoins.append(steemCoin)
        
        //28
        let vergeCoin = Coin.init()
        vergeCoin.fullName = "Verge" //yobit
        vergeCoin.shortName = "XVG"
        vergeCoin.id = "xvg"
        allCoins.append(vergeCoin)
        
        //29
        let populousCoin = Coin.init()
        populousCoin.fullName = "Populous" //okex
        populousCoin.shortName = "PPT"
        populousCoin.id = "ppt"
        allCoins.append(populousCoin)
        
        //30
        let rChainCoin = Coin.init()
        rChainCoin.fullName = "RChain" //kucoin
        rChainCoin.shortName = "RHOC"
        rChainCoin.id = "rhoc"
        allCoins.append(rChainCoin)
        
        //31
        let siacoinCoin = Coin.init()
        siacoinCoin.fullName = "Siacoin" //abucoins and poloniex
        siacoinCoin.shortName = "SC"
        siacoinCoin.id = "sc"
        allCoins.append(siacoinCoin)
        
        //32
        let stratisCoin = Coin.init()
        stratisCoin.fullName = "Stratis" //abucoins and poloniex
        stratisCoin.shortName = "STRAT"
        stratisCoin.id = "strat"
        allCoins.append(stratisCoin)
        
        //33
        let dogecoinCoin = Coin.init()
        dogecoinCoin.fullName = "Dogecoin" //poloniex
        dogecoinCoin.shortName = "DOGE"
        dogecoinCoin.id = "doge"
        allCoins.append(dogecoinCoin)
        
        //34
        let wavesCoin = Coin.init()
        wavesCoin.fullName = "Waves" //Livecoin
        wavesCoin.shortName = "WAVES"
        wavesCoin.id = "waves"
        allCoins.append(wavesCoin)
        
        //35
        let digixDaoCoin = Coin.init()
        digixDaoCoin.fullName = "DigixDAO" //liqui или okex, но очень низкий курс
        digixDaoCoin.shortName = "DGD"
        digixDaoCoin.id = "dgd"
        allCoins.append(digixDaoCoin)
        
        //36
        let statusCoin = Coin.init()
        statusCoin.fullName = "Status" //okex
        statusCoin.shortName = "SNT"
        statusCoin.id = "snt"
        allCoins.append(statusCoin)
        
        
        //37
        let makerCoin = Coin.init()
        makerCoin.fullName = "Maker" //okex
        makerCoin.shortName = "MKR"
        makerCoin.id = "mkr"
        allCoins.append(makerCoin)
        
        //38
        let bitSharesCoin = Coin.init()
        bitSharesCoin.fullName = "BitShares" //poloniex
        bitSharesCoin.shortName = "BTS"
        bitSharesCoin.id = "bts"
        allCoins.append(bitSharesCoin)
        
        //39
        let aeternityCoin = Coin.init()
        aeternityCoin.fullName = "Aeternity" //Aex
        aeternityCoin.shortName = "AE"
        aeternityCoin.id = "ae"
        allCoins.append(aeternityCoin)
        
        //40
        let waltonchainCoin = Coin.init()
        waltonchainCoin.fullName = "Waltonchain" //okex
        waltonchainCoin.shortName = "WTC"
        waltonchainCoin.id = "wtc"
        allCoins.append(waltonchainCoin)
        
        //41
        let decredCoin = Coin.init()
        decredCoin.fullName = "Decred" //poloniex
        decredCoin.shortName = "DCR"
        decredCoin.id = "dcr"
        allCoins.append(decredCoin)
        
        //42
        let veritaseumCoin = Coin.init()
        veritaseumCoin.fullName = "Veritaseum" //Hitbtc
        veritaseumCoin.shortName = "VERI"
        veritaseumCoin.id = "veri"
        allCoins.append(veritaseumCoin)
        
        //43
        let augurCoin = Coin.init()
        augurCoin.fullName = "Augur" //abucoins and poloniex
        augurCoin.shortName = "REP"
        augurCoin.id = "rep"
        allCoins.append(augurCoin)
        
        //44
        let zClassicCoin = Coin.init()
        zClassicCoin.fullName = "ZClassic" //coinexchange
        zClassicCoin.shortName = "ZCL"
        zClassicCoin.id = "zcl"
        allCoins.append(zClassicCoin)
        
        //45
        let zero0xCoin = Coin.init()
        zero0xCoin.fullName = "0x" //okex
        zero0xCoin.shortName = "ZRX"
        zero0xCoin.id = "zrx"
        allCoins.append(zero0xCoin)
        
        //46
        let electroneumCoin = Coin.init()
        electroneumCoin.fullName = "Electroneum" //!!!
        electroneumCoin.shortName = "ETN"
        electroneumCoin.id = "etn"
        allCoins.append(electroneumCoin)
        
        //47
        let hshareCoin = Coin.init()
        hshareCoin.fullName = "Hshare" //okex
        hshareCoin.shortName = "HSR"
        hshareCoin.id = "hsr"
        allCoins.append(hshareCoin)
        
        //48
        let revainCoin = Coin.init()
        revainCoin.fullName = "Revain" //okex
        revainCoin.shortName = "R"
        revainCoin.id = "r"
        allCoins.append(revainCoin)
        
        //49
        let komodoCoin = Coin.init()
        komodoCoin.fullName = "Komodo" //!!!
        komodoCoin.shortName = "KMD"
        komodoCoin.id = "kmd"
        allCoins.append(komodoCoin)
        
        //50
        let ardorCoin = Coin.init()
        ardorCoin.fullName = "Ardor" //!!!
        ardorCoin.shortName = "ARDR"
        ardorCoin.id = "ardr"
        allCoins.append(ardorCoin)
        
        //51
        let kuCoinSharesCoin = Coin.init()
        kuCoinSharesCoin.fullName = "KuCoin Shares" //!!!
        kuCoinSharesCoin.shortName = "KCS"
        kuCoinSharesCoin.id = "kcs"
        allCoins.append(kuCoinSharesCoin)
        
        //52
        let arkCoin = Coin.init()
        arkCoin.fullName = "Ark" //okex
        arkCoin.shortName = "ARK"
        arkCoin.id = "ark"
        allCoins.append(arkCoin)
        
        //53
        let gasCoin = Coin.init()
        gasCoin.fullName = "Gas" //okex
        gasCoin.shortName = "GAS"
        gasCoin.id = "gas"
        allCoins.append(gasCoin)
        
        //54
        let zilliqaCoin = Coin.init()
        zilliqaCoin.fullName = "Zilliqa" //!!!
        zilliqaCoin.shortName = "ZIL"
        zilliqaCoin.id = "zil"
        allCoins.append(zilliqaCoin)
        
        //55
        let basicAttentionTokenCoin = Coin.init()
        basicAttentionTokenCoin.fullName = "Basic Attention Token" //!!!
        basicAttentionTokenCoin.shortName = "BAT"
        basicAttentionTokenCoin.id = "bat"
        allCoins.append(basicAttentionTokenCoin)
        
        //56
        let loopringCoin = Coin.init()
        loopringCoin.fullName = "Loopring" //okex
        loopringCoin.shortName = "LRC"
        loopringCoin.id = "lrc"
        allCoins.append(loopringCoin)
        
        //57
        let digiByteCoin = Coin.init()
        digiByteCoin.fullName = "DigiByte" //okex
        digiByteCoin.shortName = "DGB"
        digiByteCoin.id = "dgb"
        allCoins.append(digiByteCoin)
        
        //58
        let bytomCoin = Coin.init()
        bytomCoin.fullName = "Bytom" //okex
        bytomCoin.shortName = "BTM"
        bytomCoin.id = "btm"
        allCoins.append(bytomCoin)
        
        //59
        let aelfCoin = Coin.init()
        aelfCoin.fullName = "aelf" //okex
        aelfCoin.shortName = "ELF"
        aelfCoin.id = "elf"
        allCoins.append(aelfCoin)
        
        //60
        let cryptonexCoin = Coin.init()
        cryptonexCoin.fullName = "Cryptonex" //!!!
        cryptonexCoin.shortName = "CNX"
        cryptonexCoin.id = "cnx"
        allCoins.append(cryptonexCoin)
        
        //61
        let dragonchainCoin = Coin.init()
        dragonchainCoin.fullName = "Dragonchain" //!!!
        dragonchainCoin.shortName = "DRGN"
        dragonchainCoin.id = "drgn"
        allCoins.append(dragonchainCoin)
        
        //62
        let monacoinCoin = Coin.init()
        monacoinCoin.fullName = "MonaCoin" //!!!
        monacoinCoin.shortName = "MONA"
        monacoinCoin.id = "mona"
        allCoins.append(monacoinCoin)
        
        //63
        let syscoinCoin = Coin.init()
        syscoinCoin.fullName = "Syscoin" //!!!
        syscoinCoin.shortName = "SYS"
        syscoinCoin.id = "sys"
        allCoins.append(syscoinCoin)
        
        //64
        let dentCoin = Coin.init()
        dentCoin.fullName = "Dent" //okex
        dentCoin.shortName = "DENT"
        dentCoin.id = "dent"
        allCoins.append(dentCoin)
        
        //65
        let qashCoin = Coin.init()
        qashCoin.fullName = "QASH" //!!!
        qashCoin.shortName = "QASH"
        qashCoin.id = "qash"
        allCoins.append(qashCoin)
        
        //66
        let nebulasCoin = Coin.init()
        nebulasCoin.fullName = "Nebulas" //okex
        nebulasCoin.shortName = "NAS"
        nebulasCoin.id = "nas"
        allCoins.append(nebulasCoin)
        
        //67
        let kyberNetwork = Coin.init()
        kyberNetwork.fullName = "Kyber Network" //okex
        kyberNetwork.shortName = "KNC"
        kyberNetwork.id = "knc"
        allCoins.append(kyberNetwork)
        
        //68
        let pivxCoin = Coin.init()
        pivxCoin.fullName = "PIVX" //!!!
        pivxCoin.shortName = "PIVX"
        pivxCoin.id = "pivx"
        allCoins.append(pivxCoin)
        
        //69
        let polymathCoin = Coin.init()
        polymathCoin.fullName = "Polymath" //!!!
        polymathCoin.shortName = "POLY"
        polymathCoin.id = "poly"
        allCoins.append(polymathCoin)
        
        //70
        let aionCoin = Coin.init()
        aionCoin.fullName = "Aion" //!!!
        aionCoin.shortName = "AION"
        aionCoin.id = "aion"
        allCoins.append(aionCoin)
        
        //71
        let dentacoinCoin = Coin.init()
        dentacoinCoin.fullName = "Dentacoin" //!!!
        dentacoinCoin.shortName = "DCN"
        dentacoinCoin.id = "dcn"
        allCoins.append(dentacoinCoin)
        
        //72
        let golemCoin = Coin.init()
        golemCoin.fullName = "Golem" //okex
        golemCoin.shortName = "GNT"
        golemCoin.id = "gnt"
        allCoins.append(golemCoin)
        
        //73
        let reddCoinCoin = Coin.init()
        reddCoinCoin.fullName = "ReddCoin" //!!!
        reddCoinCoin.shortName = "RDD"
        reddCoinCoin.id = "rdd"
        allCoins.append(reddCoinCoin)
        
        //74
        let bitcoreCoin = Coin.init()
        bitcoreCoin.fullName = "Bitcore" //!!!
        bitcoreCoin.shortName = "BTX"
        bitcoreCoin.id = "btx"
        allCoins.append(bitcoreCoin)
        
        //75
        let byteballBytesCoin = Coin.init()
        byteballBytesCoin.fullName = "Byteball Bytes" //!!!
        byteballBytesCoin.shortName = "GBYTE"
        byteballBytesCoin.id = "gbyte"
        allCoins.append(byteballBytesCoin)
        
        //76
        let iostokenCoin = Coin.init()
        iostokenCoin.fullName = "IOStoken" //okex
        iostokenCoin.shortName = "IOST"
        iostokenCoin.id = "iost"
        allCoins.append(iostokenCoin)
        
        //77
        let factomCoin = Coin.init()
        factomCoin.fullName = "Factom" //!!!
        factomCoin.shortName = "FCT"
        factomCoin.id = "fct"
        allCoins.append(factomCoin)
        
        //78
        let ethosCoin = Coin.init()
        ethosCoin.fullName = "Ethos" //!!!
        ethosCoin.shortName = "ETHOS"
        ethosCoin.id = "ethos"
        allCoins.append(ethosCoin)
        
        //79
        let gxsharesCoin = Coin.init()
        gxsharesCoin.fullName = "GXShares" //!!!
        gxsharesCoin.shortName = "GXS"
        gxsharesCoin.id = "gxs"
        allCoins.append(gxsharesCoin)
        
        //80
        let kinCoin = Coin.init()
        kinCoin.fullName = "Kin" //!!!
        kinCoin.shortName = "KIN"
        kinCoin.id = "kin"
        allCoins.append(kinCoin)
        
        //81
        let funFairCoin = Coin.init()
        funFairCoin.fullName = "FunFair" //okex
        funFairCoin.shortName = "FUN"
        funFairCoin.id = "fun"
        allCoins.append(funFairCoin)
        
        //82
        let chainLinkCoin = Coin.init()
        chainLinkCoin.fullName = "ChainLink" //okex
        chainLinkCoin.shortName = "LINK"
        chainLinkCoin.id = "link"
        allCoins.append(chainLinkCoin)
        
        //83
        let powerLedgerCoin = Coin.init()
        powerLedgerCoin.fullName = "Power Ledger" //!!!
        powerLedgerCoin.shortName = "POWR"
        powerLedgerCoin.id = "powr"
        allCoins.append(powerLedgerCoin)
        
        //84
        let saltCoin = Coin.init()
        saltCoin.fullName = "SALT" //!!!
        saltCoin.shortName = "SALT"
        saltCoin.id = "salt"
        allCoins.append(saltCoin)
        
        //85
        let cindicatorCoin = Coin.init()
        cindicatorCoin.fullName = "Cindicator" //!!!
        cindicatorCoin.shortName = "CND"
        cindicatorCoin.id = "cnd"
        allCoins.append(cindicatorCoin)
        
        //86
        let zCoinCoin = Coin.init()
        zCoinCoin.fullName = "ZCoin" //!!!
        zCoinCoin.shortName = "XZC"
        zCoinCoin.id = "xzc"
        allCoins.append(zCoinCoin)
        
        //87
        let nxtCoin = Coin.init()
        nxtCoin.fullName = "Nxt" //!!!
        nxtCoin.shortName = "NXT"
        nxtCoin.id = "nxt"
        allCoins.append(nxtCoin)
        
        //88
        let pillarCoin = Coin.init()
        pillarCoin.fullName = "Pillar" //!!!
        pillarCoin.shortName = "PLR"
        pillarCoin.id = "plr"
        allCoins.append(pillarCoin)
        
        //89
        let particlCoin = Coin.init()
        particlCoin.fullName = "Particl" //!!!
        particlCoin.shortName = "PART"
        particlCoin.id = "part"
        allCoins.append(particlCoin)
        
        //90
        let bancorCoin = Coin.init()
        bancorCoin.fullName = "Bancor" //okex
        bancorCoin.shortName = "BNT"
        bancorCoin.id = "bnt"
        allCoins.append(bancorCoin)
        
        //91
        let requestNetworkCoin = Coin.init()
        requestNetworkCoin.fullName = "Request Network" //okex
        requestNetworkCoin.shortName = "REQ"
        requestNetworkCoin.id = "req"
        allCoins.append(requestNetworkCoin)
        
        //92
        let enigmaCoin = Coin.init()
        enigmaCoin.fullName = "Enigma" //okex
        enigmaCoin.shortName = "ENG"
        enigmaCoin.id = "eng"
        allCoins.append(enigmaCoin)
        
        //93
        let maidSafeCoinCoin = Coin.init()
        maidSafeCoinCoin.fullName = "MaidSafeCoin" //!!!
        maidSafeCoinCoin.shortName = "MAID"
        maidSafeCoinCoin.id = "maid"
        allCoins.append(maidSafeCoinCoin)
        
        //94
        let smartCashCoin = Coin.init()
        smartCashCoin.fullName = "SmartCash" //!!!
        smartCashCoin.shortName = "SMART"
        smartCashCoin.id = "smart"
        allCoins.append(smartCashCoin)
        
        //95
        let neblioCoin = Coin.init()
        neblioCoin.fullName = "Neblio" //!!!
        neblioCoin.shortName = "NEBL"
        neblioCoin.id = "nebl"
        allCoins.append(neblioCoin)
        
        //96
        let tenXCoin = Coin.init()
        tenXCoin.fullName = "TenX" //okex
        tenXCoin.shortName = "PAY"
        tenXCoin.id = "pay"
        allCoins.append(tenXCoin)
        
        //97
        let emercoinCoin = Coin.init()
        emercoinCoin.fullName = "Emercoin" //!!!
        emercoinCoin.shortName = "EMC"
        emercoinCoin.id = "emc"
        allCoins.append(emercoinCoin)
        
        //98
        let blocknetCoin = Coin.init()
        blocknetCoin.fullName = "Blocknet" //!!!
        blocknetCoin.shortName = "BLOCK"
        blocknetCoin.id = "block"
        allCoins.append(blocknetCoin)
        
        //99
        let vertcoinCoin = Coin.init()
        vertcoinCoin.fullName = "Vertcoin" //!!!
        vertcoinCoin.shortName = "VTC"
        vertcoinCoin.id = "vtc"
        allCoins.append(vertcoinCoin)
        
        //100
        let ignisCoin = Coin.init()
        ignisCoin.fullName = "Ignis" //!!!
        ignisCoin.shortName = "IGNIS"
        ignisCoin.id = "ignis"
        allCoins.append(ignisCoin)
        
        //101
        let raidenNetworkTokenCoin = Coin.init()
        raidenNetworkTokenCoin.fullName = "Raiden Network Token" //okex
        raidenNetworkTokenCoin.shortName = "RDN"
        raidenNetworkTokenCoin.id = "rdn"
        allCoins.append(raidenNetworkTokenCoin)
        
        //102
        let gameCreditsCoin = Coin.init()
        gameCreditsCoin.fullName = "GameCredits" //!!!
        gameCreditsCoin.shortName = "GAME"
        gameCreditsCoin.id = "game"
        allCoins.append(gameCreditsCoin)
        
        //103
        let quantstampCoin = Coin.init()
        quantstampCoin.fullName = "Quantstamp" //!!!
        quantstampCoin.shortName = "QSP"
        quantstampCoin.id = "qsp"
        allCoins.append(quantstampCoin)
        
        //104
        let singularityNetCoin = Coin.init()
        singularityNetCoin.fullName = "SingularityNET" //!!!
        singularityNetCoin.shortName = "AGI"
        singularityNetCoin.id = "agi"
        allCoins.append(singularityNetCoin)
        
        //105
        let waxCoin = Coin.init()
        waxCoin.fullName = "WAX" //!!!
        waxCoin.shortName = "WAX"
        waxCoin.id = "wax"
        allCoins.append(waxCoin)
        
        //106
        let iconomiCoin = Coin.init()
        iconomiCoin.fullName = "Iconomi" //okex
        iconomiCoin.shortName = "ICN"
        iconomiCoin.id = "icn"
        allCoins.append(iconomiCoin)
        
        //107
        let gnosisCoin = Coin.init()
        gnosisCoin.fullName = "Gnosis" //!!!
        gnosisCoin.shortName = "GNO"
        gnosisCoin.id = "gno"
        allCoins.append(gnosisCoin)
        
        //108
        let poDotEtCoin = Coin.init()
        poDotEtCoin.fullName = "Po.et" //okex
        poDotEtCoin.shortName = "POE"
        poDotEtCoin.id = "poe"
        allCoins.append(poDotEtCoin)
        
        //109
        let digitalNoteCoin = Coin.init()
        digitalNoteCoin.fullName = "DigitalNote" //!!!
        digitalNoteCoin.shortName = "XDN"
        digitalNoteCoin.id = "xdn"
        allCoins.append(digitalNoteCoin)
        
        //110
        let enjinCoinCoin = Coin.init()
        enjinCoinCoin.fullName = "Enjin Coin" //!!!
        enjinCoinCoin.shortName = "ENJ"
        enjinCoinCoin.id = "enj"
        allCoins.append(enjinCoinCoin)
        
        //111
        let experiencePointsCoin = Coin.init()
        experiencePointsCoin.fullName = "Experience Points" //!!!
        experiencePointsCoin.shortName = "XP"
        experiencePointsCoin.id = "xp"
        allCoins.append(experiencePointsCoin)
        
        //112
        let skycoinCoin = Coin.init()
        skycoinCoin.fullName = "Skycoin" //!!!
        skycoinCoin.shortName = "SKY"
        skycoinCoin.id = "sky"
        allCoins.append(skycoinCoin)
        
        //113
        let superNetCoin = Coin.init()
        superNetCoin.fullName = "SuperNET" //!!!
        superNetCoin.shortName = "UNITY"
        superNetCoin.id = "unity"
        allCoins.append(superNetCoin)
        
        //114
        let santimentNetworkTokenCoin = Coin.init()
        santimentNetworkTokenCoin.fullName = "Santiment Network Token" //okex
        santimentNetworkTokenCoin.shortName = "SAN"
        santimentNetworkTokenCoin.id = "san"
        allCoins.append(santimentNetworkTokenCoin)
        
        //115
        let storjCoin = Coin.init()
        storjCoin.fullName = "Storj" //okex
        storjCoin.shortName = "STORJ"
        storjCoin.id = "storj"
        allCoins.append(storjCoin)
        
        //116
        let bitcoinDarkCoin = Coin.init()
        bitcoinDarkCoin.fullName = "BitcoinDark" //!!!
        bitcoinDarkCoin.shortName = "BTCD"
        bitcoinDarkCoin.id = "btcd"
        allCoins.append(bitcoinDarkCoin)
        
        //117
        let civicCoin = Coin.init()
        civicCoin.fullName = "Civic" //okex
        civicCoin.shortName = "CVC"
        civicCoin.id = "cvc"
        allCoins.append(civicCoin)
        
        //118
        let stormCoin = Coin.init()
        stormCoin.fullName = "Storm" //!!!
        stormCoin.shortName = "STORM"
        stormCoin.id = "storm"
        allCoins.append(stormCoin)
        
        //119
        let substratumCoin = Coin.init()
        substratumCoin.fullName = "Substratum" //okex
        substratumCoin.shortName = "SUB"
        substratumCoin.id = "sub"
        allCoins.append(substratumCoin)
        
        //120
        let nexusCoin = Coin.init()
        nexusCoin.fullName = "Nexus" //!!!
        nexusCoin.shortName = "NXS"
        nexusCoin.id = "nxs"
        allCoins.append(nexusCoin)
        
        //121
        let achainCoin = Coin.init()
        achainCoin.fullName = "Achain" //okex
        achainCoin.shortName = "ACT"
        achainCoin.id = "act"
        allCoins.append(achainCoin)
        
        //122
        let decentralandCoin = Coin.init()
        decentralandCoin.fullName = "Decentraland" //okex
        decentralandCoin.shortName = "MANA"
        decentralandCoin.id = "mana"
        allCoins.append(decentralandCoin)
        
        //123
        let bridgeCoinCoin = Coin.init()
        bridgeCoinCoin.fullName = "BridgeCoin" //!!!
        bridgeCoinCoin.shortName = "BCO"
        bridgeCoinCoin.id = "bco"
        allCoins.append(bridgeCoinCoin)
        
        //124
        let ethlendCoin = Coin.init()
        ethlendCoin.fullName = "ETHLend" //okex
        ethlendCoin.shortName = "LEND"
        ethlendCoin.id = "lend"
        allCoins.append(ethlendCoin)
        
        //125
        let navcoinCoin = Coin.init()
        navcoinCoin.fullName = "NAV Coin" //!!!
        navcoinCoin.shortName = "NAV"
        navcoinCoin.id = "nav"
        allCoins.append(navcoinCoin)
        
        //126
        let uDotCashCoin = Coin.init()
        uDotCashCoin.fullName = "U.CASH" //!!!
        uDotCashCoin.shortName = "UCASH"
        uDotCashCoin.id = "ucash"
        allCoins.append(uDotCashCoin)
        
        //127
        let adExCoin = Coin.init()
        adExCoin.fullName = "AdEx" //!!!
        adExCoin.shortName = "ADX"
        adExCoin.id = "adx"
        allCoins.append(adExCoin)
        
        //128
        let zenCashCoin = Coin.init()
        zenCashCoin.fullName = "ZenCash" //okex, но высокий курс
        zenCashCoin.shortName = "ZEN"
        zenCashCoin.id = "zen"
        allCoins.append(zenCashCoin)
        
        //129
        let dynamicTradingRightsCoin = Coin.init()
        dynamicTradingRightsCoin.fullName = "Dynamic Trading Rights" //!!!
        dynamicTradingRightsCoin.shortName = "DTR"
        dynamicTradingRightsCoin.id = "dtr"
        allCoins.append(dynamicTradingRightsCoin)
        
        //130
        let oysterCoin = Coin.init()
        oysterCoin.fullName = "Oyster" //!!!
        oysterCoin.shortName = "PRL"
        oysterCoin.id = "prl"
        allCoins.append(oysterCoin)
        
        //131
        let dewCoin = Coin.init()
        dewCoin.fullName = "DEW" //!!!
        dewCoin.shortName = "DEW"
        dewCoin.id = "dew"
        allCoins.append(dewCoin)
        
        //132
        let xpaCoin = Coin.init()
        xpaCoin.fullName = "XPA" //!!!
        xpaCoin.shortName = "XPA"
        xpaCoin.id = "xpa"
        allCoins.append(xpaCoin)
        
        //133
        let mediBlocCoin = Coin.init()
        mediBlocCoin.fullName = "MediBloc" //!!!
        mediBlocCoin.shortName = "MED"
        mediBlocCoin.id = "med"
        allCoins.append(mediBlocCoin)
        
        //134
        let telcoinCoin = Coin.init()
        telcoinCoin.fullName = "Telcoin" //!!!
        telcoinCoin.shortName = "TEL"
        telcoinCoin.id = "tel"
        allCoins.append(telcoinCoin)
        
        //135
        let highPerformanceBlockchainCoin = Coin.init()
        highPerformanceBlockchainCoin.fullName = "High Performance Blockchain" //!!!
        highPerformanceBlockchainCoin.shortName = "HPB"
        highPerformanceBlockchainCoin.id = "hpb"
        allCoins.append(highPerformanceBlockchainCoin)
        
        //136
        let aragonCoin = Coin.init()
        aragonCoin.fullName = "Aragon" //!!!
        aragonCoin.shortName = "ANT"
        aragonCoin.id = "ant"
        allCoins.append(aragonCoin)
        
        //137
        let blockVCoin = Coin.init()
        blockVCoin.fullName = "BLOCKv" //okex
        blockVCoin.shortName = "VEE"
        blockVCoin.id = "vee"
        allCoins.append(blockVCoin)
        
        //138
        let timeNewBankCoin = Coin.init()
        timeNewBankCoin.fullName = "Time New Bank" //okex
        timeNewBankCoin.shortName = "TNB"
        timeNewBankCoin.id = "tnb"
        allCoins.append(timeNewBankCoin)
        
        //139
        let ubiqCoin = Coin.init()
        ubiqCoin.fullName = "Ubiq" //!!!
        ubiqCoin.shortName = "UBQ"
        ubiqCoin.id = "ubq"
        allCoins.append(ubiqCoin)
        
        //140
        let monacoCoin = Coin.init()
        monacoCoin.fullName = "Monaco" //okex
        monacoCoin.shortName = "MCO"
        monacoCoin.id = "mco"
        allCoins.append(monacoCoin)
        
        //141
        let sophiaTXCoin = Coin.init()
        sophiaTXCoin.fullName = "SophiaTX" //!!!
        sophiaTXCoin.shortName = "SPHTX"
        sophiaTXCoin.id = "sphtx"
        allCoins.append(sophiaTXCoin)
        
        //142
        let mediSharesCoin = Coin.init()
        mediSharesCoin.fullName = "MediShares" //!!!
        mediSharesCoin.shortName = "MDS"
        mediSharesCoin.id = "mds"
        allCoins.append(mediSharesCoin)
        
        //143
        let iotChainCoin = Coin.init()
        iotChainCoin.fullName = "IoT Chain" //okex
        iotChainCoin.shortName = "ITC"
        iotChainCoin.id = "itc"
        allCoins.append(iotChainCoin)
        
        //144
        let iExecRLCCoin = Coin.init()
        iExecRLCCoin.fullName = "iExec RLC" //!!!
        iExecRLCCoin.shortName = "RLC"
        iExecRLCCoin.id = "rlc"
        allCoins.append(iExecRLCCoin)
        
        //145
        let bluzelleCoin = Coin.init()
        bluzelleCoin.fullName = "Bluzelle" //!!!
        bluzelleCoin.shortName = "BLZ"
        bluzelleCoin.id = "blz"
        allCoins.append(bluzelleCoin)
        
        //146
        let dataCoin = Coin.init()
        dataCoin.fullName = "DATA" //!!!
        dataCoin.shortName = "DTA"
        dataCoin.id = "dta"
        allCoins.append(dataCoin)
        
        //147
        let genesisVisionCoin = Coin.init()
        genesisVisionCoin.fullName = "Genesis Vision" //!!!
        genesisVisionCoin.shortName = "GVT"
        genesisVisionCoin.id = "gvt"
        allCoins.append(genesisVisionCoin)
        
        //148
        let payPieCoin = Coin.init()
        payPieCoin.fullName = "PayPie" //!!!
        payPieCoin.shortName = "PPP"
        payPieCoin.id = "ppp"
        allCoins.append(payPieCoin)
        
        //149
        let redPulseCoin = Coin.init()
        redPulseCoin.fullName = "Red Pulse" //!!!
        redPulseCoin.shortName = "RPX"
        redPulseCoin.id = "rpx"
        allCoins.append(redPulseCoin)
        
        //150
        let biboxTokenCoin = Coin.init()
        biboxTokenCoin.fullName = "Bibox Token" //!!!
        biboxTokenCoin.shortName = "BIX"
        biboxTokenCoin.id = "bix"
        allCoins.append(biboxTokenCoin)
        
        //151
        let inkCoin = Coin.init()
        inkCoin.fullName = "Ink" //!!!
        inkCoin.shortName = "INK"
        inkCoin.id = "ink"
        allCoins.append(inkCoin)
        
        //152
        let vibeCoin = Coin.init()
        vibeCoin.fullName = "VIBE" //!!!
        vibeCoin.shortName = "VIBE"
        vibeCoin.id = "vibe"
        allCoins.append(vibeCoin)
        
        //153
        let peercoinCoin = Coin.init()
        peercoinCoin.fullName = "Peercoin" //!!!
        peercoinCoin.shortName = "PPC"
        peercoinCoin.id = "ppc"
        allCoins.append(peercoinCoin)
        
        //154
        let aschCoin = Coin.init()
        aschCoin.fullName = "Asch" //!!!
        aschCoin.shortName = "XAS"
        aschCoin.id = "xas"
        allCoins.append(aschCoin)
        
        //155
        let ambrosusCoin = Coin.init()
        ambrosusCoin.fullName = "Ambrosus" //!!!
        ambrosusCoin.shortName = "AMB"
        ambrosusCoin.id = "amb"
        allCoins.append(ambrosusCoin)
        
        //156
        let crypto20Coin = Coin.init()
        crypto20Coin.fullName = "CRYPTO20" //!!!
        crypto20Coin.shortName = "C20"
        crypto20Coin.id = "c20"
        allCoins.append(crypto20Coin)
        
        //157
        let metalCoin = Coin.init()
        metalCoin.fullName = "Metal" //okex
        metalCoin.shortName = "MTL"
        metalCoin.id = "mtl"
        allCoins.append(metalCoin)
        
        //158
        let wagerrCoin = Coin.init()
        wagerrCoin.fullName = "Wagerr" //!!!
        wagerrCoin.shortName = "WGR"
        wagerrCoin.id = "wgr"
        allCoins.append(wagerrCoin)
        
        //159
        let sonmCoin = Coin.init()
        sonmCoin.fullName = "SONM" //okex
        sonmCoin.shortName = "SNM"
        sonmCoin.id = "snm"
        allCoins.append(sonmCoin)
        
        //160
        let agorasTokensCoin = Coin.init()
        agorasTokensCoin.fullName = "Agoras Tokens" //!!!
        agorasTokensCoin.shortName = "AGRS"
        agorasTokensCoin.id = "agrs"
        allCoins.append(agorasTokensCoin)
        
        //161
        let sirinLabsTokenCoin = Coin.init()
        sirinLabsTokenCoin.fullName = "SIRIN LABS Token" //!!!
        sirinLabsTokenCoin.shortName = "SRN"
        sirinLabsTokenCoin.id = "srn"
        allCoins.append(sirinLabsTokenCoin)
        
        //162
        let thetaTokenCoin = Coin.init()
        thetaTokenCoin.fullName = "Theta Token" //okex
        thetaTokenCoin.shortName = "THETA"
        thetaTokenCoin.id = "theta"
        allCoins.append(thetaTokenCoin)
        
        //163
        let puraCoin = Coin.init()
        puraCoin.fullName = "Pura" //!!!
        puraCoin.shortName = "PURA"
        puraCoin.id = "pura"
        allCoins.append(puraCoin)
        
        //164
        let deepBrainChainCoin = Coin.init()
        deepBrainChainCoin.fullName = "DeepBrain Chain" //!!!
        deepBrainChainCoin.shortName = "DBC"
        deepBrainChainCoin.id = "dbc"
        allCoins.append(deepBrainChainCoin)
        
        //165
        let ripioCreditNetworkCoin = Coin.init()
        ripioCreditNetworkCoin.fullName = "Ripio Credit Network" //okex
        ripioCreditNetworkCoin.shortName = "RCN"
        ripioCreditNetworkCoin.id = "rcn"
        allCoins.append(ripioCreditNetworkCoin)
        
        //166
        let eidooCoin = Coin.init()
        eidooCoin.fullName = "Eidoo" //okex
        eidooCoin.shortName = "EDO"
        eidooCoin.id = "edo"
        allCoins.append(eidooCoin)
        
        //167
        let appCoinsCoin = Coin.init()
        appCoinsCoin.fullName = "AppCoins" //!!!
        appCoinsCoin.shortName = "APPC"
        appCoinsCoin.id = "appc"
        allCoins.append(appCoinsCoin)
        
        //168
        let jibrelNetworkCoin = Coin.init()
        jibrelNetworkCoin.fullName = "Jibrel Network" //!!!
        jibrelNetworkCoin.shortName = "JNT"
        jibrelNetworkCoin.id = "jnt"
        allCoins.append(jibrelNetworkCoin)
        
        //169
        let einsteiniumCoin = Coin.init()
        einsteiniumCoin.fullName = "Einsteinium" //!!!
        einsteiniumCoin.shortName = "EMC2"
        einsteiniumCoin.id = "emc2"
        allCoins.append(einsteiniumCoin)
        
        //170
        let cyberMilesCoin = Coin.init()
        cyberMilesCoin.fullName = "CyberMiles" //okex
        cyberMilesCoin.shortName = "CMT"
        cyberMilesCoin.id = "cmt"
        allCoins.append(cyberMilesCoin)
        
        //171
        let etherpartyCoin = Coin.init()
        etherpartyCoin.fullName = "Etherparty" //!!!
        etherpartyCoin.shortName = "FUEL"
        etherpartyCoin.id = "fuel"
        allCoins.append(etherpartyCoin)
        
        //172
        let waBiCoin = Coin.init()
        waBiCoin.fullName = "WaBi" //!!!
        waBiCoin.shortName = "WABI"
        waBiCoin.id = "wabi"
        allCoins.append(waBiCoin)
        
        //173
        let airSwapCoin = Coin.init()
        airSwapCoin.fullName = "AirSwap" //okex
        airSwapCoin.shortName = "AST"
        airSwapCoin.id = "ast"
        allCoins.append(airSwapCoin)
        
        //174
        let xtrabytesCoin = Coin.init()
        xtrabytesCoin.fullName = "XTRABYTES" //!!!
        xtrabytesCoin.shortName = "XBY"
        xtrabytesCoin.id = "xby"
        allCoins.append(xtrabytesCoin)
        
        //175
        let simpleTokenCoin = Coin.init()
        simpleTokenCoin.fullName = "Simple Token" //okex
        simpleTokenCoin.shortName = "OST"
        simpleTokenCoin.id = "ost"
        allCoins.append(simpleTokenCoin)
        
        //176
        let minexCoinCoin = Coin.init()
        minexCoinCoin.fullName = "MinexCoin" //!!!
        minexCoinCoin.shortName = "MNX"
        minexCoinCoin.id = "mnx"
        allCoins.append(minexCoinCoin)
        
        //177
        let melonCoin = Coin.init()
        melonCoin.fullName = "Melon" //!!!
        melonCoin.shortName = "MLN"
        melonCoin.id = "mln"
        allCoins.append(melonCoin)
        
        //178
        let streamrDATAcoinCoin = Coin.init()
        streamrDATAcoinCoin.fullName = "Streamr DATAcoin" //!!!
        streamrDATAcoinCoin.shortName = "DATA"
        streamrDATAcoinCoin.id = "data"
        allCoins.append(streamrDATAcoinCoin)
        
        //179
        let edgelessCoin = Coin.init()
        edgelessCoin.fullName = "Edgeless" //!!!
        edgelessCoin.shortName = "EDG"
        edgelessCoin.id = "edg"
        allCoins.append(edgelessCoin)
        
        //180
        let counterpartyCoin = Coin.init()
        counterpartyCoin.fullName = "Counterparty" //!!!
        counterpartyCoin.shortName = "XCP"
        counterpartyCoin.id = "xcp"
        allCoins.append(counterpartyCoin)
        
        //181
        let quantumResistantLedgerCoin = Coin.init()
        quantumResistantLedgerCoin.fullName = "Quantum Resistant Ledger" //!!!
        quantumResistantLedgerCoin.shortName = "QRL"
        quantumResistantLedgerCoin.id = "qrl"
        allCoins.append(quantumResistantLedgerCoin)
        
        //182
        let bitBayCoin = Coin.init()
        bitBayCoin.fullName = "BitBay" //!!!
        bitBayCoin.shortName = "BAY"
        bitBayCoin.id = "bay"
        allCoins.append(bitBayCoin)
        
        //183
        let singularDTVCoin = Coin.init()
        singularDTVCoin.fullName = "SingularDTV" //okex
        singularDTVCoin.shortName = "SNGLS"
        singularDTVCoin.id = "sngls"
        allCoins.append(singularDTVCoin)
        
        //184
        let cobinhoodCoin = Coin.init()
        cobinhoodCoin.fullName = "Cobinhood" //!!!
        cobinhoodCoin.shortName = "COB"
        cobinhoodCoin.id = "cob"
        allCoins.append(cobinhoodCoin)
        
        //185
        let giftoCoin = Coin.init()
        giftoCoin.fullName = "Gifto" //okex
        giftoCoin.shortName = "GTO"
        giftoCoin.id = "gto"
        allCoins.append(giftoCoin)
        
        //186
        let insEcosystemCoin = Coin.init()
        insEcosystemCoin.fullName = "INS Ecosystem" //okex
        insEcosystemCoin.shortName = "INS"
        insEcosystemCoin.id = "ins"
        allCoins.append(insEcosystemCoin)
        
        //187
        let utrustCoin = Coin.init()
        utrustCoin.fullName = "UTRUST" //okex
        utrustCoin.shortName = "UTK"
        utrustCoin.id = "utk"
        allCoins.append(utrustCoin)
        
        //188
        let metaverseETPCoin = Coin.init()
        metaverseETPCoin.fullName = "Metaverse ETP" //!!!
        metaverseETPCoin.shortName = "ETP"
        metaverseETPCoin.id = "etp"
        allCoins.append(metaverseETPCoin)
        
        //189
        let wePowerCoin = Coin.init()
        wePowerCoin.fullName = "WePower" //!!!
        wePowerCoin.shortName = "WPR"
        wePowerCoin.id = "wpr"
        allCoins.append(wePowerCoin)
        
        //190
        let nulsCoin = Coin.init()
        nulsCoin.fullName = "Nuls" //okex
        nulsCoin.shortName = "NULS"
        nulsCoin.id = "nuls"
        allCoins.append(nulsCoin)
        
        //191
        let coinDashCoin = Coin.init()
        coinDashCoin.fullName = "CoinDash" //!!!
        coinDashCoin.shortName = "CDT"
        coinDashCoin.id = "cdt"
        allCoins.append(coinDashCoin)
        
        //192
        let breadCoin = Coin.init()
        breadCoin.fullName = "Bread" //okex
        breadCoin.shortName = "BRD"
        breadCoin.id = "brd"
        allCoins.append(breadCoin)
        
        //193
        let pacCoinCoin = Coin.init()
        pacCoinCoin.fullName = "PACcoin" //!!!
        pacCoinCoin.shortName = "PAC"
        pacCoinCoin.id = "pac"
        allCoins.append(pacCoinCoin)
        
        //194
        let viacoinCoin = Coin.init()
        viacoinCoin.fullName = "Viacoin" //!!!
        viacoinCoin.shortName = "VIA"
        viacoinCoin.id = "via"
        allCoins.append(viacoinCoin)
        
        //195
        let nagaCoin = Coin.init()
        nagaCoin.fullName = "NAGA" //okex
        nagaCoin.shortName = "NGC"
        nagaCoin.id = "ngc"
        allCoins.append(nagaCoin)
        
        //196
        let tierionCoin = Coin.init()
        tierionCoin.fullName = "Tierion" //!!!
        tierionCoin.shortName = "TNT"
        tierionCoin.id = "tnt"
        allCoins.append(tierionCoin)
        
        //197
        let guldenCoin = Coin.init()
        guldenCoin.fullName = "Gulden" //!!!
        guldenCoin.shortName = "NLG"
        guldenCoin.id = "nlg"
        allCoins.append(guldenCoin)
        
        //198
        let trinityNetworkCreditCoin = Coin.init()
        trinityNetworkCreditCoin.fullName = "Trinity Network Credit" //!!!
        trinityNetworkCreditCoin.shortName = "TNC"
        trinityNetworkCreditCoin.id = "tnc"
        allCoins.append(trinityNetworkCreditCoin)
        
        //199
        let burstCoin = Coin.init()
        burstCoin.fullName = "Burst" //!!!
        burstCoin.shortName = "BURST"
        burstCoin.id = "burst"
        allCoins.append(burstCoin)
        
        //200
        let triggersCoin = Coin.init()
        triggersCoin.fullName = "Triggers" //!!!
        triggersCoin.shortName = "TRIG"
        triggersCoin.id = "trig"
        allCoins.append(triggersCoin)
        
        
        return allCoins
    }
}
