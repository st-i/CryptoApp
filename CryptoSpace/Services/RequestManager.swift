//
//  RequestManager.swift
//  CryptoSpace
//
//  Created by st.i on 11.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit
import Alamofire

class RequestManager: NSObject {
    
    var btcRateInUsd:Double = 0.0
    var btc24hPercentChange: Double = 0.0
    var updatedUserCoins = [Coin]()
    
    var currentVC = TrackedCurrenciesViewController()
    var coinsArray = [Coin]()
    var coinsRates = [Double]()
    var currentIndex = 0
    
    var coinsExchanges = [Dictionary<String, Coin>]()
    var exchangesCounter = 0
    
    //запрос курса рубля к доллару
    func getRubleExchangeRate(completion: @escaping (Double) -> ()) {
        
        request(RubleRateRequestBuilder.buildRubleRequest()).responseJSON { (response) in
            print("Запрос курса рубля")
            guard let arrayOfData = response.result.value as? Dictionary<String, AnyObject> else{
                print("Не могу перевести в JSON")
                return
            }
            
            let rubleExchangeRate = RubleRateResponseParser.parseResponse(response: arrayOfData)
            print("RUB \(rubleExchangeRate)")
            completion(rubleExchangeRate)
        }
    }
    
    //запрос для одной монеты
    func getExchangeRate(coin: Coin, completion: @escaping (Double) -> ()) {
        
        request(RequestToQuoineBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
            print("Запрос Quoine")
//            print(response)
            guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                print("Не могу перевести в JSON")
                return
            }
            let quoineCoinsRatesDict = QuoineResponseParser.parseResponse(response: arrayOfData)
            let btcRate = (quoineCoinsRatesDict["BTC"]! as Dictionary<String, Double>)[kCoinLastPrice]!
            self.btc24hPercentChange = quoineCoinsRatesDict["BTC"]![kCoin24hPercentChange]!
            
//            let ethRate = btcAndEthRatesDict["ETH"]!
            
            let allUserCoins = [coin]
            
            switch coin.exchange {
            case .Quoine:
                let quoineCoinRate = (quoineCoinsRatesDict[coin.shortName]! as Dictionary<String, Double>)[kCoinLastPrice]!
                completion(quoineCoinRate)
                break
                
            case .Bittrex:
                request(RequestToBittrexBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                    print("Запрос Bittrex")
//                    print(response)
                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                        print("Не могу перевести в JSON")
                        return
                    }
                    completion(BittrexResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate, btc24hPercentChange: self.btc24hPercentChange)[coin.shortName]![kCoinLastPrice]!)
                })
                break
                
            case .HitBTC:
                request(RequestToHitBTCBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                    print("Запрос HitBTC")
//                    print(response)
                    guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                        print("Не могу перевести в JSON")
                        return
                    }
                    completion(HitBTCResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate, btc24hPercentChange: self.btc24hPercentChange)[coin.shortName]![kCoinLastPrice]!)
                })
                break
                
            case .Binance:
                request(RequestToBinanceBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                    print("Запрос Binance")
//                    print(response)
                    guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                        print("Не могу перевести в JSON")
                        return
                    }
                    completion(BinanceResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate, btc24hPercentChange: self.btc24hPercentChange)[coin.shortName]![kCoinLastPrice]!)
                })
                break
                
//            case .Poloniex:
//                request(RequestToPoloniexBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос Poloniex")
////                    print(response)
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(PoloniexResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
//                })
//                break
//
//            case .Cryptopia:
//                request(RequestToCryptopiaBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос Cryptopia")
////                    print(response)
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(CryptopiaResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
//                })
//                break
                
//            case .Kucoin:
//                request(RequestToKucoinBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос Kucoin")
//                    print(response)
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(KucoinResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
//                })
//                break
                
//            case .IDEX:
//                request(RequestToIDEXBuilder.buildAllCoinsRequest(), method: .post, parameters: nil)
//                    .responseJSON(completionHandler: { (response) in
//                        print("Запрос IDEX")
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(IDEXResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, ethRate: ethRate)[coin.shortName]!)
//                })
//                break
                
            
//            case .Gate_io: //id
////                request(RequestToBitfinexBuilder.buildEthRateRequest()).responseJSON(completionHandler: { (ethResponse) in
////                    guard let ethDataArray = ethResponse.result.value as? [String: AnyObject] else{
////                        print("Не могу перевести в JSON")
////                        return
////                    }
////                    let ethRate = BitfinexResponseParser.getEthRate(response: ethDataArray)
////                    print(ethRate)
//
//                    request(RequestToGate_ioBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                        print("Запрос Gate_io")
////                        print(response) //перепроверить
//                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                            print("Не могу перевести в JSON")
//                            return
//                        }
//                        completion(Gate_ioResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate, ethRate: ethRate)[coin.id]!)
//                    })
////                })
//                break
          
                
//            case .Livecoin:
//                request(RequestToLivecoinBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос Livecoin")
//                    guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(LivecoinResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
//                })
//                break
                
                
//            case .BigONE:
//                request(RequestToBigONEBuilder.buildCoinRateRequest(coinShortName: coin.shortName/*"DEW"*/)).responseJSON(completionHandler: { (response) in
//                    print("Запрос BigONE")
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(BigONEResponseParser.parseResponseForSingleCoin(response: arrayOfData, btcRate: btcRate))
//                })
//                break
                
                
//            case .C2CX:
//                request(RequestToC2CXBuilder.buildUcashRateRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос C2CX")
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(C2CXResponseParser.parseResponseForSingleCoin(coinShortName: coin.shortName/*"UCASH"*/, response: arrayOfData, btcRate: btcRate))
//                })
//                break
                
                
//            case .Cobinhood:
//                request(RequestToCobinhoodBuilder.buildCobinhoodRateRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос Cobinhood")
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(CobinhoodResponseParser.parseResponseForSingleCoin(coinShortName: coin.shortName/*"COB"*/, response: arrayOfData, btcRate: btcRate))
//                })
//                break
                
                
//            case .CoinExchange:
//                request(RequestToCoinExchangeBuilder.buildExpPointsRateRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос CoinExchange")
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(CoinExchangeResponseParser.parseResponseForSingleCoin(coinShortName: coin.shortName/*"XP"*/, response: arrayOfData, btcRate: btcRate))
//                })
//                break
                
                
//            case .Yobit:
//                request(RequestToYobitBuilder.buildWagerrRateRequest()).responseJSON(completionHandler: { (response) in
//                    print("Запрос Yobit")
//                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                        print("Не могу перевести в JSON")
//                        return
//                    }
//                    completion(YobitResponseParser.parseResponseForSingleCoin(coinId: coin.id/*"wgr"*//*, coinShortName: coin.shortName/*"WGR"*/*/, response: arrayOfData, btcRate: btcRate))
//                })
//                break
                
            default:
                print("Неизвестная монета")
                break
            }
        })
    }
    
    
    //запрос для обновления массива монет
    func updateCoinsRates(completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
        
        request(RequestToQuoineBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
            print("запрос Quoine")
            guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                print("Не могу перевести в JSON")
                return
            }
            let quoineCoinsRatesDict = QuoineResponseParser.parseResponse(response: arrayOfData)
            let btcRate = (quoineCoinsRatesDict["BTC"]! as Dictionary<String, Double>)[kCoinLastPrice]!
            self.btc24hPercentChange = (quoineCoinsRatesDict["BTC"]!)[kCoin24hPercentChange]!
            
            let ethRate = (quoineCoinsRatesDict["ETH"]! as Dictionary<String, Double>)[kCoinLastPrice]!
            let qashRate = (quoineCoinsRatesDict["QASH"]! as Dictionary<String, Double>)[kCoinLastPrice]!
            
            let exchangeCoinsDict = self.coinsExchanges[self.exchangesCounter]
            if exchangeCoinsDict.keys.count > 0 {
                if exchangeCoinsDict.keys.contains("BTC") {
                    let btcCoin = exchangeCoinsDict["BTC"]
                    btcCoin?.exchangeRate = btcRate
                    self.coinsExchanges[ExchangeBehavior.Quoine.rawValue].updateValue(btcCoin!, forKey: "BTC")
                }
                
                if exchangeCoinsDict.keys.contains("ETH") {
                    let ethCoin = exchangeCoinsDict["ETH"]
                    ethCoin?.exchangeRate = ethRate
                    self.coinsExchanges[ExchangeBehavior.Quoine.rawValue].updateValue(ethCoin!, forKey: "ETH")
                }
                
                if exchangeCoinsDict.keys.contains("QASH") {
                    let qashCoin = exchangeCoinsDict["QASH"]
                    qashCoin?.exchangeRate = qashRate
                    self.coinsExchanges[ExchangeBehavior.Quoine.rawValue].updateValue(qashCoin!, forKey: "QASH")
                }
            }
            self.exchangesCounter = self.exchangesCounter + 1
            self.updateBittrexCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
                completion(newArray)
            })
//            self.updateAnotherCoinsRates(exchangesCounter: self.exchangesCounter, btcRate: btcRate, ethRate: ethRate)
//            completion(self.coinsExchanges)
        })
    }
    
    private func updateBittrexCoinsRates(btcRate: Double, ethRate: Double,
                                         completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
        
        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
        if exchangeCoinsDict.keys.count > 0 {
            request(RequestToBittrexBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                print("запрос Bittrex")
                if exchangeCoinsDict.keys.count > 0 {
                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                        print("Не могу перевести в JSON")
                        return
                    }
                    var currentExchangeCoins = [Coin]()
                    for currentExchangeCoin in exchangeCoinsDict.values {
                        currentExchangeCoins.append(currentExchangeCoin)
                    }
                    let bittrexCoins = BittrexResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate, btc24hPercentChange: self.btc24hPercentChange)
                    
                    for key in bittrexCoins.keys {
                        if exchangeCoinsDict.keys.contains(key) {
                            let someCurrentCoin = exchangeCoinsDict[key]
                            someCurrentCoin?.exchangeRate = bittrexCoins[key]![kCoinLastPrice]!
//                            someCurrentCoin?.24hPercentChange = bittrexCoins[key]![kBittrexCoin24hPercentChange]!
                            self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
                        }
                    }
                }
                self.exchangesCounter = self.exchangesCounter + 1
                self.updateHitBTCCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
                    completion(newArray)
                })
            })
        }else{
            print("монет не добавлено Bittrex")
            exchangesCounter = exchangesCounter + 1
            updateHitBTCCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
                completion(newArray)
            })
        }
    }

    private func updateHitBTCCoinsRates(btcRate: Double, ethRate: Double,
                                        completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
        
        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
        if exchangeCoinsDict.keys.count > 0 {
            request(RequestToHitBTCBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                print("запрос HitBTC")
                guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                    print("Не могу перевести в JSON")
                    return
                }
                var currentExchangeCoins = [Coin]()
                for currentExchangeCoin in exchangeCoinsDict.values {
                    currentExchangeCoins.append(currentExchangeCoin)
                }
                let hitBtcCoins = HitBTCResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate, btc24hPercentChange: self.btc24hPercentChange)
                
                for key in hitBtcCoins.keys {
                    if exchangeCoinsDict.keys.contains(key) {
                        let someCurrentCoin = exchangeCoinsDict[key]
                        someCurrentCoin?.exchangeRate = hitBtcCoins[key]![kCoinLastPrice]!
                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
                    }
                }
                self.exchangesCounter = self.exchangesCounter + 1
                self.updateBinanceCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
                    completion(newArray)
                })
            })
        }else{
            print("монет не добавлено HitBTC")
            exchangesCounter = exchangesCounter + 1
            updateBinanceCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
                completion(newArray)
            })
        }
    }
    
    private func updateBinanceCoinsRates(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
        
        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
        if exchangeCoinsDict.keys.count > 0 {
            request(RequestToBinanceBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                print("запрос Binance")
                guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                    print("Не могу перевести в JSON")
                    return
                }
                var currentExchangeCoins = [Coin]()
                for currentExchangeCoin in exchangeCoinsDict.values {
                    currentExchangeCoins.append(currentExchangeCoin)
                }
                let binanceCoins = BinanceResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate, btc24hPercentChange: self.btc24hPercentChange)
                
                for key in binanceCoins.keys {
                    if exchangeCoinsDict.keys.contains(key) {
                        let someCurrentCoin = exchangeCoinsDict[key]
                        someCurrentCoin?.exchangeRate = binanceCoins[key]![kCoinLastPrice]!
                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
                    }
                }
                
                completion(self.coinsExchanges)
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updatePoloniexCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
            })
        }else{
            print("монет не добавлено Binance")
            completion(coinsExchanges)
//            exchangesCounter = exchangesCounter + 1
//            updatePoloniexCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
        }
    }
    
//    private func updatePoloniexCoinsRates(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//        
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToPoloniexBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос Poloniex")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                var currentExchangeCoins = [Coin]()
//                for currentExchangeCoin in exchangeCoinsDict.values {
//                    currentExchangeCoins.append(currentExchangeCoin)
//                }
//                let poloniexCoins = PoloniexResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate)
//                
//                for key in poloniexCoins.keys {
//                    if exchangeCoinsDict.keys.contains(key) {
//                        let someCurrentCoin = exchangeCoinsDict[key]
//                        someCurrentCoin?.exchangeRate = poloniexCoins[key]!
//                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
//                    }
//                }
//                
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateCryptopiaCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено Poloniex")
//            exchangesCounter = exchangesCounter + 1
//            updateCryptopiaCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//    
//    private func updateCryptopiaCoinsRates(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//        
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToCryptopiaBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос Cryptopia")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                var currentExchangeCoins = [Coin]()
//                for currentExchangeCoin in exchangeCoinsDict.values {
//                    currentExchangeCoins.append(currentExchangeCoin)
//                }
//                let cryptopiaCoins = CryptopiaResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate)
//                
//                for key in cryptopiaCoins.keys {
//                    if exchangeCoinsDict.keys.contains(key) {
//                        let someCurrentCoin = exchangeCoinsDict[key]
//                        someCurrentCoin?.exchangeRate = cryptopiaCoins[key]!
//                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
//                    }
//                }
//                
//                completion(self.coinsExchanges)
//            })
//        }else{
//            print("монет не добавлено Cryptopia")
//            completion(coinsExchanges)
//        }
//    }
    
//    private func updateKucoinCoinsRates(btcRate: Double, ethRate: Double,
//                                        completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToKucoinBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос Kucoin")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                var currentExchangeCoins = [Coin]()
//                for currentExchangeCoin in exchangeCoinsDict.values {
//                    currentExchangeCoins.append(currentExchangeCoin)
//                }
//                let kucoinCoins = KucoinResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate)
//
//                for key in kucoinCoins.keys {
//                    if exchangeCoinsDict.keys.contains(key) {
//                        let someCurrentCoin = exchangeCoinsDict[key]
//                        someCurrentCoin?.exchangeRate = kucoinCoins[key]!
//                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
//                    }
//                }
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateIDEXCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено Kucoin")
//            exchangesCounter = exchangesCounter + 1
//            updateIDEXCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//    private func updateIDEXCoinsRates(btcRate: Double, ethRate: Double,
//                                      completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToIDEXBuilder.buildAllCoinsRequest(), method: .post, parameters: nil).responseJSON(completionHandler: { (response) in
//                print("запрос IDEX")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                var currentExchangeCoins = [Coin]()
//                for currentExchangeCoin in exchangeCoinsDict.values {
//                    currentExchangeCoins.append(currentExchangeCoin)
//                }
//                let idexCoins = IDEXResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, ethRate: ethRate)
//
//                for key in idexCoins.keys {
//                    if exchangeCoinsDict.keys.contains(key) {
//                        let someCurrentCoin = exchangeCoinsDict[key]
//                        someCurrentCoin?.exchangeRate = idexCoins[key]!
//                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
//                    }
//                }
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updatePoloniexCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено IDEX")
//            exchangesCounter = exchangesCounter + 1
//            updatePoloniexCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
    
    
    
//    private func updateGate_ioCoinsRates(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//        //id
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToGate_ioBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос GateIo")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                var currentExchangeCoins = [Coin]()
//                for currentExchangeCoin in exchangeCoinsDict.values {
//                    currentExchangeCoins.append(currentExchangeCoin)
//                }
//                let gateIoCoins = Gate_ioResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate, ethRate: ethRate)
//
//                for key in gateIoCoins.keys {
//                    if exchangeCoinsDict.keys.contains(key.uppercased()) {
//                        let someCurrentCoin = exchangeCoinsDict[key.uppercased()]
//                        someCurrentCoin?.exchangeRate = gateIoCoins[key]!
//                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key.uppercased())
//                    }
//                }
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateBinanceCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено GateIo")
//            exchangesCounter = exchangesCounter + 1
//            updateBinanceCoinsRates(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//
//
//    private func updateLivecoinCoinsRates(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToLivecoinBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос Livecoin")
//                guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                var currentExchangeCoins = [Coin]()
//                for currentExchangeCoin in exchangeCoinsDict.values {
//                    currentExchangeCoins.append(currentExchangeCoin)
//                }
//                let livecoinCoins = LivecoinResponseParser.parseResponse(response: arrayOfData, coinsArray: currentExchangeCoins, btcRate: btcRate)
//
//                for key in livecoinCoins.keys {
//                    if exchangeCoinsDict.keys.contains(key) {
//                        let someCurrentCoin = exchangeCoinsDict[key]
//                        someCurrentCoin?.exchangeRate = livecoinCoins[key]!
//                        self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: key)
//                    }
//                }
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateBigONEFirstRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено Livecoin")
//            exchangesCounter = exchangesCounter + 1
//            updateBigONEFirstRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//    private func updateBigONEFirstRate(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            let firstKey = exchangeCoinsDict.keys.first
//            request(RequestToBigONEBuilder.buildCoinRateRequest(coinShortName: firstKey!)).responseJSON(completionHandler: { (response) in
//                print("запрос BigONE1")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//
//                let currentCoinRate = BigONEResponseParser.parseResponseForSingleCoin(response: arrayOfData, btcRate: btcRate)
//                let someCurrentCoin = exchangeCoinsDict[firstKey!]
//                someCurrentCoin?.exchangeRate = currentCoinRate
//                self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: firstKey!)
//                if exchangeCoinsDict.keys.count > 1 {
//                    self.updateBigONESecondRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                        completion(newArray)
//                    })
//                }else{
//                    self.exchangesCounter = self.exchangesCounter + 1
//                    self.updateC2CXCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                        completion(newArray)
//                    })
//                }
//            })
//        }else{
//            print("монет не добавлено BigONE1")
//            exchangesCounter = exchangesCounter + 1
//            updateC2CXCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//    private func updateBigONESecondRate(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        var secondKey = ""
//        var localCounter = 0
//        for key in exchangeCoinsDict.keys {
//            if localCounter == 1 {
//                secondKey = key
//            }
//            localCounter = localCounter + 1
//        }
//        request(RequestToBigONEBuilder.buildCoinRateRequest(coinShortName: secondKey)).responseJSON(completionHandler: { (response) in
//            print("запрос BigONE2")
//            guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                print("Не могу перевести в JSON")
//                return
//            }
//
//            let currentCoinRate = BigONEResponseParser.parseResponseForSingleCoin(response: arrayOfData, btcRate: btcRate)
//            let someCurrentCoin = exchangeCoinsDict[secondKey]
//            someCurrentCoin?.exchangeRate = currentCoinRate
//            self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: secondKey)
//
//            self.exchangesCounter = self.exchangesCounter + 1
//            self.updateC2CXCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        })
//    }
//
//    private func updateC2CXCoinRate(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToC2CXBuilder.buildUcashRateRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос C2CX")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                let firstKey = exchangeCoinsDict.keys.first!
//                let currentCoinRate = C2CXResponseParser.parseResponseForSingleCoin(coinShortName: firstKey, response: arrayOfData, btcRate: btcRate)
//                let someCurrentCoin = exchangeCoinsDict[firstKey]
//                someCurrentCoin?.exchangeRate = currentCoinRate
//                self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: firstKey)
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateCobinhoodCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено C2CX")
//            exchangesCounter = exchangesCounter + 1
//            updateCobinhoodCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//    private func updateCobinhoodCoinRate(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToCobinhoodBuilder.buildCobinhoodRateRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос Cobinhood")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                let firstKey = exchangeCoinsDict.keys.first!
//                let currentCoinRate = CobinhoodResponseParser.parseResponseForSingleCoin(coinShortName: firstKey, response: arrayOfData, btcRate: btcRate)
//                let someCurrentCoin = exchangeCoinsDict[firstKey]
//                someCurrentCoin?.exchangeRate = currentCoinRate
//                self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: firstKey)
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateCoinExchangeCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено Cobinhood")
//            exchangesCounter = exchangesCounter + 1
//            updateCoinExchangeCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//    private func updateCoinExchangeCoinRate(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToCoinExchangeBuilder.buildExpPointsRateRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос CoinExchange")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                let firstKey = exchangeCoinsDict.keys.first!
//                let currentCoinRate = CoinExchangeResponseParser.parseResponseForSingleCoin(coinShortName: firstKey, response: arrayOfData, btcRate: btcRate)
//                let someCurrentCoin = exchangeCoinsDict[firstKey]
//                someCurrentCoin?.exchangeRate = currentCoinRate
//                self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: firstKey)
//
//                self.exchangesCounter = self.exchangesCounter + 1
//                self.updateYobitCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                    completion(newArray)
//                })
//            })
//        }else{
//            print("монет не добавлено CoinExchange")
//            exchangesCounter = exchangesCounter + 1
//            updateYobitCoinRate(btcRate: btcRate, ethRate: ethRate, completion: { (newArray) in
//                completion(newArray)
//            })
//        }
//    }
//
//    private func updateYobitCoinRate(btcRate: Double, ethRate: Double, completion: @escaping ([Dictionary<String, Coin>]) -> ()) {
//
//        let exchangeCoinsDict = coinsExchanges[exchangesCounter]
//        if exchangeCoinsDict.keys.count > 0 {
//            request(RequestToYobitBuilder.buildWagerrRateRequest()).responseJSON(completionHandler: { (response) in
//                print("запрос Yobit")
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                let firstKey = exchangeCoinsDict.keys.first!
//                let currentCoinRate = YobitResponseParser.parseResponseForSingleCoin(coinId: firstKey.lowercased(), response: arrayOfData, btcRate: btcRate)
//                let someCurrentCoin = exchangeCoinsDict[firstKey]
//                someCurrentCoin?.exchangeRate = currentCoinRate
//                self.coinsExchanges[self.exchangesCounter].updateValue(someCurrentCoin!, forKey: firstKey)
//
//                completion(self.coinsExchanges)
//            })
//        }else{
//            print("монет не добавлено Yobit")
//            completion(self.coinsExchanges)
//        }
//    }
    
    
    //обычный тестовый запрос
    func sendSomeRequestForTest() {
//        request(RequestToQuoineBuilder.buildAllCoinsRequest()).responseJSON { (response) in
//            guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
//                print("Не могу перевести в JSON")
//                return
//            }
//            print(QuoineResponseParser.parseResponse(response: arrayOfData))
//        }
        request("http://free.currencyconverterapi.com/api/v3/convert?q=USD_RUB&compact=ultra").responseJSON { (response) in
            print(response)
        }
    }
}
