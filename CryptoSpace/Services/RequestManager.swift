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
    
    //массив с данными в будущем будет
    var btcRateInUsd:Double = 0.0
    var updatedUserCoins = [Coin]()
    
    var currentVC = TrackedCurrenciesViewController()
    var coinsArray = [Coin]()
    var coinsRates = [Double]()
    var currentIndex = 0
    
    func exchangeRateForCurrency(currencyId: String) -> String {
        return currencyId
    }
    
    func getExchangeRate(coin: Coin, completion: @escaping (Double) -> ()) {
        
        if coin.exchange == ExchangeBehavior.IDEX {
            
            request(RequestToBitfinexBuilder.buildEthRateRequest()).responseJSON { (firstResponse) in

                guard let dataArray = firstResponse.result.value as? [String: AnyObject] else{
                    print("Не могу перевести в JSON")
                    return
                }
                let ethRate = BitfinexResponseParser.getEthRate(response: dataArray)
                print(ethRate)

                let allUserCoins = [coin]

    //            print(firstResponse)

                request(RequestToIDEXBuilder.buildAllCoinsRequest(), method: .post, parameters: nil).responseJSON { (response) in
                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                        print("Не могу перевести в JSON")
                        return
                    }
                    let coinRate = (IDEXResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, ethRate: ethRate))[coin.shortName]
                    completion(coinRate!)
                }
            }
        }else{
    
            request(RequestToBitfinexBuilder.buildBtcRateRequest()).responseJSON { (firstResponse) in
                guard let dataArray = firstResponse.result.value as? [String: AnyObject] else{
                    print("Не могу перевести в JSON")
                    return
                }
                let btcRate = BitfinexResponseParser.getBtcRate(response: dataArray)
                print("BTC \(btcRate)")

                let allUserCoins = [coin]

    //            print(firstResponse)
            
                switch coin.exchange {
                case .Bitfinex:
                    completion(btcRate)
                    break
                    
                case .Bittrex:
                    request(RequestToBittrexBuilder.buildAllCoinsRequest()).responseJSON { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(BittrexResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    }
                    break
                    
                case .HitBTC:
                    request(RequestToHitBTCBuilder.buildAllCoinsRequest()).responseJSON { (response) in
                        guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                            print("Не могу перевести в JSON")
                            return
                        }
//                        print(response)
                        completion(HitBTCResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    }
                    break
                    
                case .Kucoin:
                    request(RequestToKucoinBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(KucoinResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    })
                    break
                    
                case .Poloniex:
                    request(RequestToPoloniexBuilder.buildAllCoinsRequest()).responseJSON { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(PoloniexResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    }
                    break
                    
                case .Cryptopia:
                    request(RequestToCryptopiaBuilder.buildAllCoinsRequest()).responseJSON { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(CryptopiaResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    }
                    break
                    
                case .Gate_io: //id
                    request(RequestToBitfinexBuilder.buildEthRateRequest()).responseJSON { (ethResponse) in
        
                        guard let ethDataArray = ethResponse.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        let ethRate = BitfinexResponseParser.getEthRate(response: ethDataArray)
                        print(ethRate)
        
                        request(RequestToGate_ioBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                            guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                                print("Не могу перевести в JSON")
                                return
                            }
                            completion(Gate_ioResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate, ethRate: ethRate)[coin.id]!)
                        })
                    }
                    break
                    
                case .Binance:
                    request(RequestToBinanceBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(BinanceResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    })
                    break
                    
                case .Livecoin:
                    request(RequestToLivecoinBuilder.buildAllCoinsRequest()).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [Dictionary<String, AnyObject>] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(LivecoinResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, btcRate: btcRate)[coin.shortName]!)
                    })
                    break
                    
                case .BigONE:
                    request(RequestToBigONEBuilder.buildCoinRateRequest(coinShortName: coin.shortName/*"DEW"*/)).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(BigONEResponseParser.parseResponseForSingleCoin(response: arrayOfData, btcRate: btcRate))
                    })
                    break
                    
                case .C2CX:
                    request(RequestToC2CXBuilder.buildUcashRateRequest()).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(C2CXResponseParser.parseResponseForSingleCoin(coinShortName: coin.shortName/*"UCASH"*/, response: arrayOfData, btcRate: btcRate))
                    })
                    break
                    
                case .Cobinhood:
                    request(RequestToCobinhoodBuilder.buildCobinhoodRateRequest()).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(CobinhoodResponseParser.parseResponseForSingleCoin(coinShortName: coin.shortName/*"COB"*/, response: arrayOfData, btcRate: btcRate))
                    })
                    break
                    
                case .CoinExchange:
                    request(RequestToCoinExchangeBuilder.buildExpPointsRateRequest()).responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(CoinExchangeResponseParser.parseResponseForSingleCoin(coinShortName: coin.shortName/*"XP"*/, response: arrayOfData, btcRate: btcRate))
                    })
                    break
                    
                case .Yobit:
                    request("https://yobit.net/api/3/ticker/wgr_btc").responseJSON(completionHandler: { (response) in
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
                        completion(YobitResponseParser.parseResponseForSingleCoin(coinId: coin.id/*"wgr"*//*, coinShortName: coin.shortName/*"WGR"*/*/, response: arrayOfData, btcRate: btcRate))
        //                print(response)
                    })
                    break
                    
                default:
                    print("Неизвестная монета")
                    break
                }
            }
        }
    }
    
//    func updateCoins( completion: @escaping ([Double]) -> Void) { /*sendedCoinsArray: [Coin], */
////        self.coinsArray = sendedCoinsArray
//        sendRequest()
////        completion(coinsRates)
//    }
    
    func updateCoins() {//(completion: @escaping ([Double]) -> Void) { //(coinsArray: [Coin]) -> [Coin] {
    
        var coinRequestUrl = ""
        var keyForDict1 = ""
        var keyForDict2 = ""
        var coinsRates = [Double]()
//        for someCoin in coinsArray {
        let someCoin = coinsArray[currentIndex]
//            switch: такая-то биржа, такой-то запрос
            switch someCoin.shortName { //буду спрашивать биржу
            case "BTC": //буду сравнивать с behaviour биржи
//                coinRequestUrl = RequestToBitfinexBuilder.buildRequest(currencyId: someCoin.id)
                coinRequestUrl = RequestToBitfinexBuilder.buildBtcRateRequest()
//                keyForDict1 = "last_price" //вместо этого хардкода будет передаваться behaviour...
//                sendRequest(url: coinRequestUrl, dictKey1: keyForDict1, dictKey2: keyForDict2, completion: { (exchangeRate) in
//                    coinsRates.append(exchangeRate)
//                    })
            case "ETH":
                coinRequestUrl = RequestToOKEXBuilder.buildRequest(currencyId:"eth") //someCoin.id)
                keyForDict1 = "ticker"
                keyForDict2 = "last"
//                sendRequest(url: coinRequestUrl, dictKey1: keyForDict1, dictKey2: keyForDict2, completion: { (exchangeRate) in
//                    coinsRates.append(exchangeRate)
//                    })
            default:
                coinRequestUrl = ""
                coinsRates.append(0.0)
            }
//            if someCoin.shortName == "BTC" || someCoin.shortName == "ETH" {
                request(coinRequestUrl)
                    .responseJSON(completionHandler: { response in
                        
                        print(response)
                        
                        guard response.result.isSuccess else{
                            print("Ошибка при запросе данных \(String(describing: response.result.error))")
                            self.currentVC.userCoins = UserCoinsManager.refreshValuesForCoins(coinsArray: self.coinsArray, coinsRates: self.coinsRates)
                            self.currentVC.refreshCoinsArray()
                            return
                        }
                        
                        guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                            print("Не могу перевести в JSON")
                            return
                        }
//                        print(arrayOfData)
                        
                        var currentRate = 0.0
                        if keyForDict2 == "" { //...а тут будет обработчик массива в зависимости от behavior
                            currentRate = BitfinexResponseParser.getBtcRate(response: arrayOfData)
//                            currentRate = Double((arrayOfData[keyForDict1] as? String)!)! //bitfinex
                        }else{
                            currentRate = Double((arrayOfData[keyForDict1]![keyForDict2] as? String)!)! //okex
                        }
                        
                        print(currentRate)
                        if self.currentIndex < 2 {
                            if someCoin.shortName == "BTC" {
                                self.btcRateInUsd = currentRate
                                self.coinsRates.append(currentRate)
                            }else{
                                self.coinsRates.append(currentRate * self.btcRateInUsd)
                                print(currentRate * self.btcRateInUsd)
                            }
                            self.currentIndex = self.currentIndex + 1
                            self.updateCoins()
//                            self.sendRequest()
//                            self.sendRequest(completion: { (array) in
////                                self.coinsRates = array
//                            })
                        }
//                        completion(currentRate) //* 10600.09)
                        
                    })
//            }
//        }
//        completion(coinsRates)
    }
//        let coinId = "btc"
//        let coinEthId = "eth"
    
//        let coinRequestUrl = RequestToBitfinexBuilder.buildRequest(currencyId: coinId)
//        let coinRequestUrl = RequestToOKEXBuilder.buildRequest(currencyId: coinEthId)
//    }
    
//    private func sendRequest(url: String, dictKey1: String, dictKey2: String, completion: @escaping (Double) -> Void) {
//        request(url)
//            .responseJSON(completionHandler: { response in
//
//                guard response.result.isSuccess else{
//                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
//                    return
//                }
//
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                print(arrayOfData)
//
//                var currentRate = 0.0
//                if dictKey2 == "" { //...а тут будет обработчик массива в зависимости от behaviour
//                    currentRate = Double((arrayOfData[dictKey1] as? String)!)! //bitfinex
//                }else{
//                    currentRate = Double((arrayOfData[dictKey1]![dictKey2] as? String)!)! //okex
//                }
//
//                print(currentRate)
//
//                completion(currentRate) //* 10600.09)
//
//            })
//    }
}
