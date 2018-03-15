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
//                    print(response)
                    guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                        print("Не могу перевести в JSON")
                        return
                    }
                    let coinRate = (IDEXResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, ethRate: ethRate))[coin.shortName]
                    completion(coinRate!)
                }
            }
        }else{
            //        Bitfinex
            //        case Bittrex
            //        case HitBTC
            //        case Kucoin
            //        case IDEX
            //        case Poloniex
            //        case Cryptopia
            //        case Gate_io
            //        case Binance
            //        case Livecoin
            //        case BigONE
            //        case C2CX
            //        case Cobinhood
            //        case CoinExchange
            //        case Yobit
            
            request(RequestToBitfinexBuilder.buildBtcRateRequest()).responseJSON { (firstResponse) in
                guard let dataArray = firstResponse.result.value as? [String: AnyObject] else{
                    print("Не могу перевести в JSON")
                    return
                }
                let btcRate = BitfinexResponseParser.getBtcRate(response: dataArray)
                print(btcRate)

                let allUserCoins = [coin]

    //            print(firstResponse)
            
                switch coin.exchange {
                case .Bittrex:
                    //отправляем запрос
                    print("Bittrex")
                    break
                    
                case .HitBTC:
                    //отправляем запрос
                    print("HitBTC")
                    break
                    
                case .Kucoin:
                    //отправляем запрос
                    print("Kucoin")
                    break
                    
                case .Poloniex:
                    //отправляем запрос
                    print("Poloniex")
                    break
                    
                case .Cryptopia:
                    //отправляем запрос
                    print("Cryptopia")
                    break
                    
                case .Gate_io:
                    //отправляем запрос
                    print("Gate_io")
                    break
                    
                case .Binance:
                    //отправляем запрос
                    print("Binance")
                    break
                    
                case .Livecoin:
                    //отправляем запрос
                    print("Livecoin")
                    break
                    
                case .BigONE:
                    //отправляем запрос
                    print("BigONE")
                    break
                    
                case .C2CX:
                    //отправляем запрос
                    print("C2CX")
                    break
                    
                case .Cobinhood:
                    //отправляем запрос
                    print("Cobinhood")
                    break
                    
                case .CoinExchange:
                    //отправляем запрос
                    print("CoinExchange")
                    break
                    
                case .Yobit:
                    //отправляем запрос
                    print("Yobit")
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
