//
//  TrackedCurrenciesScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 10.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit
import Alamofire

//struct Coin {
////    var id: String
////    var fullName: String
//    var shortName: String
//    var exchangeRate: String
//}

class TrackedCurrenciesScreenDirector: NSObject {
    
    class func createTrackedCurrenciesCells(for tableView: UITableView, btcRate: String) -> Array<Any> {
        let totalPortfolioCostCellArray = NSMutableArray()
        let trackedPositionCellsArray = NSMutableArray()

        //first section
        totalPortfolioCostCellArray.add(TotalPortfolioCostCellBuilder.buildTotalPortfolioCostCell(for: tableView))
//        totalPortfolioCostCellArray.add(HeaderViewCellBulder.buildCell(for: tableView))
        
//        //second section
//        let btcCoin = "BTC"
//        let ethCoin = "ETH"
//        let xprCoin = "XPR"
//        let bchCoin = "BCH"
//        let ltcCoin = "LTC"
//        let adaCoin = "ADA"
//        let xlmCoin = "XLM"
//        let neoCoin = "NEO"
//        let eosCoin = "EOS"
//        let iotaCoin = "MIOTA"
//        let shortNames = [btcCoin, ethCoin, xprCoin, bchCoin, ltcCoin, adaCoin, xlmCoin, neoCoin, eosCoin, iotaCoin]
//
//        var coinsArray = [Coin]()
//        for i in 0..<10 {
//            let someCoin = Coin(shortName: shortNames[i])
////            if i == 0 {
////                someCoin.id = "btc"
////                someCoin.shortName = shortNames[0]
////            }else{
////                someCoin.shortName = shortNames[i]
////            }
//            coinsArray.append(someCoin)
//        }
        
//        for someCoin in coinsArray {
//            var coinExchangeRate = ""
//            if someCoin.shortName == "BTC" {
//
        
//                let queue = DispatchQueue(label: "stefanov.CryptoSpace.response-queue", qos: .background, attributes: [.concurrent])
//                Alamofire.request(coinRequestUrl)
//                    .response(queue: queue,
//                              responseSerializer: DataRequest.jsonResponseSerializer(),
//                              completionHandler: { response in
//
//                                var coinExchangeRate1 = ""
//
//                                switch response.result {
//                                case .success(let value):
//                                    print(value)
//
//                                    guard let jsonDict = response.result.value as? [String: String] else { return }
//                                    coinExchangeRate1 = String(format:"$%@", jsonDict["mid"]!)
//                                case .failure(let error):
//                                    print(error)
//                                }
//
//                                DispatchQueue.main.async {
//                                    coinExchangeRate = coinExchangeRate1
//                                }
//
//                })
                
//
                
//                coinExchangeRate = btcRate
//            }else{
//                coinExchangeRate = "$10 000"
//            }
//            trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView, coinName: someCoin.shortName, coinExchangeRate: coinExchangeRate))
//        }
//        trackedPositionCellsArray.add(FinalCellBuilder.buildFinalCell(for: tableView))
        
        let allSections = [totalPortfolioCostCellArray, trackedPositionCellsArray]
        
        return allSections
    }

}
