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
        let rChainCoin = Coin.init()
        rChainCoin.fullName = "RChain"
        rChainCoin.shortName = "RHOC"
        rChainCoin.id = "rhoc"
        allCoins.append(rChainCoin)
        
        //31
        let siacoinCoin = Coin.init()
        siacoinCoin.fullName = "Siacoin"
        siacoinCoin.shortName = "SC"
        siacoinCoin.id = "sc"
        allCoins.append(siacoinCoin)
        
        //32
        let stratisCoin = Coin.init()
        stratisCoin.fullName = "Stratis"
        stratisCoin.shortName = "STRAT"
        stratisCoin.id = "strat"
        allCoins.append(stratisCoin)
        
        //33
        let dogecoinCoin = Coin.init()
        dogecoinCoin.fullName = "Dogecoin"
        dogecoinCoin.shortName = "DOGE"
        dogecoinCoin.id = "doge"
        allCoins.append(dogecoinCoin)
        
        //34
        let wavesCoin = Coin.init()
        wavesCoin.fullName = "Waves"
        wavesCoin.shortName = "WAVES"
        wavesCoin.id = "waves"
        allCoins.append(wavesCoin)
        
        //35
        let digixDaoCoin = Coin.init()
        digixDaoCoin.fullName = "DigixDAO"
        digixDaoCoin.shortName = "DGD"
        digixDaoCoin.id = "dgd"
        allCoins.append(digixDaoCoin)
        
        //36
        let statusCoin = Coin.init()
        statusCoin.fullName = "Status"
        statusCoin.shortName = "SNT"
        statusCoin.id = "snt"
        allCoins.append(statusCoin)
        
        
        //37
        let makerCoin = Coin.init()
        makerCoin.fullName = "Maker"
        makerCoin.shortName = "MKR"
        makerCoin.id = "mkr"
        allCoins.append(makerCoin)
        
        //38
        let bitSharesCoin = Coin.init()
        bitSharesCoin.fullName = "BitShares"
        bitSharesCoin.shortName = "BTS"
        bitSharesCoin.id = "bts"
        allCoins.append(bitSharesCoin)
        
        //39
        let aeternityCoin = Coin.init()
        aeternityCoin.fullName = "Aeternity"
        aeternityCoin.shortName = "AE"
        aeternityCoin.id = "ae"
        allCoins.append(aeternityCoin)
        
        //40
        let waltonchainCoin = Coin.init()
        waltonchainCoin.fullName = "Waltonchain"
        waltonchainCoin.shortName = "WTC"
        waltonchainCoin.id = "wtc"
        allCoins.append(waltonchainCoin)
        
        //41
        let decredCoin = Coin.init()
        decredCoin.fullName = "Decred"
        decredCoin.shortName = "DCR"
        decredCoin.id = "dcr"
        allCoins.append(decredCoin)
        
        //42
        let veritaseumCoin = Coin.init()
        veritaseumCoin.fullName = "Veritaseum"
        veritaseumCoin.shortName = "VERI"
        veritaseumCoin.id = "veri"
        allCoins.append(veritaseumCoin)
        
        //43
        let augurCoin = Coin.init()
        augurCoin.fullName = "Augur"
        augurCoin.shortName = "REP"
        augurCoin.id = "rep"
        allCoins.append(augurCoin)
        
        //44
        let zClassicCoin = Coin.init()
        zClassicCoin.fullName = "ZClassic"
        zClassicCoin.shortName = "ZCL"
        zClassicCoin.id = "zcl"
        allCoins.append(zClassicCoin)
        
        //45
        let zero0xCoin = Coin.init()
        zero0xCoin.fullName = "0x"
        zero0xCoin.shortName = "ZRX"
        zero0xCoin.id = "zrx"
        allCoins.append(zero0xCoin)
        
        //46
        let electroneumCoin = Coin.init()
        electroneumCoin.fullName = "Electroneum"
        electroneumCoin.shortName = "ETN"
        electroneumCoin.id = "etn"
        allCoins.append(electroneumCoin)
        
        //47
        let hshareCoin = Coin.init()
        hshareCoin.fullName = "Hshare"
        hshareCoin.shortName = "HSR"
        hshareCoin.id = "hsr"
        allCoins.append(hshareCoin)
        
        //48
        let revainCoin = Coin.init()
        revainCoin.fullName = "Revain"
        revainCoin.shortName = "R"
        revainCoin.id = "r"
        allCoins.append(revainCoin)
        
        //49
        let komodoCoin = Coin.init()
        komodoCoin.fullName = "Komodo"
        komodoCoin.shortName = "KMD"
        komodoCoin.id = "kmd"
        allCoins.append(komodoCoin)
        
        //50
        let ardorCoin = Coin.init()
        ardorCoin.fullName = "Ardor"
        ardorCoin.shortName = "ARDR"
        ardorCoin.id = "ardr"
        allCoins.append(ardorCoin)
        
        //51
        let kuCoinSharesCoin = Coin.init()
        kuCoinSharesCoin.fullName = "KuCoin Shares"
        kuCoinSharesCoin.shortName = "KCS"
        kuCoinSharesCoin.id = "kcs"
        allCoins.append(kuCoinSharesCoin)
        
        //52
        let arkCoin = Coin.init()
        arkCoin.fullName = "Ark"
        arkCoin.shortName = "ARK"
        arkCoin.id = "ark"
        allCoins.append(arkCoin)
        
        //53
        let gasCoin = Coin.init()
        gasCoin.fullName = "Gas"
        gasCoin.shortName = "GAS"
        gasCoin.id = "gas"
        allCoins.append(gasCoin)
        
        //54
        let zilliqaCoin = Coin.init()
        zilliqaCoin.fullName = "Zilliqa"
        zilliqaCoin.shortName = "ZIL"
        zilliqaCoin.id = "zil"
        allCoins.append(zilliqaCoin)
        
        //55
        let basicAttentionTokenCoin = Coin.init()
        basicAttentionTokenCoin.fullName = "Basic Attention Token"
        basicAttentionTokenCoin.shortName = "BAT"
        basicAttentionTokenCoin.id = "bat"
        allCoins.append(basicAttentionTokenCoin)
        
        //56
        let loopringCoin = Coin.init()
        loopringCoin.fullName = "Loopring"
        loopringCoin.shortName = "LRC"
        loopringCoin.id = "lrc"
        allCoins.append(loopringCoin)
        
        //57
        let digiByteCoin = Coin.init()
        digiByteCoin.fullName = "DigiByte"
        digiByteCoin.shortName = "DGB"
        digiByteCoin.id = "dgb"
        allCoins.append(digiByteCoin)
        
        //58
        let bytomCoin = Coin.init()
        bytomCoin.fullName = "Bytom"
        bytomCoin.shortName = "BTM"
        bytomCoin.id = "btm"
        allCoins.append(bytomCoin)
        
        //59
        let aelfCoin = Coin.init()
        aelfCoin.fullName = "aelf"
        aelfCoin.shortName = "ELF"
        aelfCoin.id = "elf"
        allCoins.append(aelfCoin)
        
        //60
        let cryptonexCoin = Coin.init()
        cryptonexCoin.fullName = "Cryptonex"
        cryptonexCoin.shortName = "CNX"
        cryptonexCoin.id = "cnx"
        allCoins.append(cryptonexCoin)
        
        //61
        let dragonchainCoin = Coin.init()
        dragonchainCoin.fullName = "Dragonchain"
        dragonchainCoin.shortName = "DRGN"
        dragonchainCoin.id = "drgn"
        allCoins.append(dragonchainCoin)
        
        //62
        let monacoinCoin = Coin.init()
        monacoinCoin.fullName = "MonaCoin"
        monacoinCoin.shortName = "MONA"
        monacoinCoin.id = "mona"
        allCoins.append(monacoinCoin)
        
        //63
        let syscoinCoin = Coin.init()
        syscoinCoin.fullName = "Syscoin"
        syscoinCoin.shortName = "SYS"
        syscoinCoin.id = "sys"
        allCoins.append(syscoinCoin)
        
        //64
        let dentCoin = Coin.init()
        dentCoin.fullName = "Dent"
        dentCoin.shortName = "DENT"
        dentCoin.id = "dent"
        allCoins.append(dentCoin)
        
        //65
        let qashCoin = Coin.init()
        qashCoin.fullName = "QASH"
        qashCoin.shortName = "QASH"
        qashCoin.id = "qash"
        allCoins.append(qashCoin)
        
        //66
        let nebulasCoin = Coin.init()
        nebulasCoin.fullName = "Nebulas"
        nebulasCoin.shortName = "NAS"
        nebulasCoin.id = "nas"
        allCoins.append(nebulasCoin)
        
        //67
        let kyberNetwork = Coin.init()
        kyberNetwork.fullName = "Kyber Network"
        kyberNetwork.shortName = "KNC"
        kyberNetwork.id = "knc"
        allCoins.append(kyberNetwork)
        
        //68
        let pivxCoin = Coin.init()
        pivxCoin.fullName = "PIVX"
        pivxCoin.shortName = "PIVX"
        pivxCoin.id = "pivx"
        allCoins.append(pivxCoin)
        
        //69
        let polymathCoin = Coin.init()
        polymathCoin.fullName = "Polymath"
        polymathCoin.shortName = "POLY"
        polymathCoin.id = "poly"
        allCoins.append(polymathCoin)
        
        //70
        let aionCoin = Coin.init()
        aionCoin.fullName = "Aion"
        aionCoin.shortName = "AION"
        aionCoin.id = "aion"
        allCoins.append(aionCoin)
        
        //71
        let dentacoinCoin = Coin.init()
        dentacoinCoin.fullName = "Dentacoin"
        dentacoinCoin.shortName = "DCN"
        dentacoinCoin.id = "dcn"
        allCoins.append(dentacoinCoin)
        
        //72
        let golemCoin = Coin.init()
        golemCoin.fullName = "Golem"
        golemCoin.shortName = "GNT"
        golemCoin.id = "gnt"
        allCoins.append(golemCoin)
        
        //73
        let reddCoinCoin = Coin.init()
        reddCoinCoin.fullName = "ReddCoin"
        reddCoinCoin.shortName = "RDD"
        reddCoinCoin.id = "rdd"
        allCoins.append(reddCoinCoin)
        
        //74
        let bitcoreCoin = Coin.init()
        bitcoreCoin.fullName = "Bitcore"
        bitcoreCoin.shortName = "BTX"
        bitcoreCoin.id = "btx"
        allCoins.append(bitcoreCoin)
        
        //75
        let byteballBytesCoin = Coin.init()
        byteballBytesCoin.fullName = "Byteball Bytes"
        byteballBytesCoin.shortName = "GBYTE"
        byteballBytesCoin.id = "gbyte"
        allCoins.append(byteballBytesCoin)
        
        //76
        let iostokenCoin = Coin.init()
        iostokenCoin.fullName = "IOStoken"
        iostokenCoin.shortName = "IOST"
        iostokenCoin.id = "iost"
        allCoins.append(iostokenCoin)
        
        //77
        let factomCoin = Coin.init()
        factomCoin.fullName = "Factom"
        factomCoin.shortName = "FCT"
        factomCoin.id = "fct"
        allCoins.append(factomCoin)
        
        //78
        let ethosCoin = Coin.init()
        ethosCoin.fullName = "Ethos"
        ethosCoin.shortName = "ETHOS"
        ethosCoin.id = "ethos"
        allCoins.append(ethosCoin)
        
        //79
        let gxsharesCoin = Coin.init()
        gxsharesCoin.fullName = "GXShares"
        gxsharesCoin.shortName = "GXS"
        gxsharesCoin.id = "gxs"
        allCoins.append(gxsharesCoin)
        
        //80
        let kinCoin = Coin.init()
        kinCoin.fullName = "Kin"
        kinCoin.shortName = "KIN"
        kinCoin.id = "kin"
        allCoins.append(kinCoin)
        
        //81
        let funFairCoin = Coin.init()
        funFairCoin.fullName = "FunFair"
        funFairCoin.shortName = "FUN"
        funFairCoin.id = "fun"
        allCoins.append(funFairCoin)
        
        //82
        let chainLinkCoin = Coin.init()
        chainLinkCoin.fullName = "ChainLink"
        chainLinkCoin.shortName = "LINK"
        chainLinkCoin.id = "link"
        allCoins.append(chainLinkCoin)
        
        //83
        let powerLedgerCoin = Coin.init()
        powerLedgerCoin.fullName = "Power Ledger"
        powerLedgerCoin.shortName = "POWR"
        powerLedgerCoin.id = "powr"
        allCoins.append(powerLedgerCoin)
        
        //84
        let saltCoin = Coin.init()
        saltCoin.fullName = "SALT"
        saltCoin.shortName = "SALT"
        saltCoin.id = "salt"
        allCoins.append(saltCoin)
        
        //85
        let cindicatorCoin = Coin.init()
        cindicatorCoin.fullName = "Cindicator"
        cindicatorCoin.shortName = "CND"
        cindicatorCoin.id = "cnd"
        allCoins.append(cindicatorCoin)
        
        //86
        let zCoinCoin = Coin.init()
        zCoinCoin.fullName = "ZCoin"
        zCoinCoin.shortName = "XZC"
        zCoinCoin.id = "xzc"
        allCoins.append(zCoinCoin)
        
        //87
        let nxtCoin = Coin.init()
        nxtCoin.fullName = "Nxt"
        nxtCoin.shortName = "NXT"
        nxtCoin.id = "nxt"
        allCoins.append(nxtCoin)
        
        //88
        let pillarCoin = Coin.init()
        pillarCoin.fullName = "Pillar"
        pillarCoin.shortName = "PLR"
        pillarCoin.id = "plr"
        allCoins.append(pillarCoin)
        
        //89
        let particlCoin = Coin.init()
        particlCoin.fullName = "Particl"
        particlCoin.shortName = "PART"
        particlCoin.id = "part"
        allCoins.append(particlCoin)
        
        //90
        let bancorCoin = Coin.init()
        bancorCoin.fullName = "Bancor"
        bancorCoin.shortName = "BNT"
        bancorCoin.id = "bnt"
        allCoins.append(bancorCoin)
        
        //91 Request Network
        
        
        
        
        
        
        
        
        
        
        
        
        return allCoins
    }
}
