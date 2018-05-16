//
//  GlobalHelpers.swift
//  CryptoSpace
//
//  Created by st.i on 17.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import Foundation
import UIKit

class DetailedDateFormatter: NSObject {
    
    class func stringFromDate(date: Date) -> String {
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        var monthString: String!
        switch month {
        case 1:
            monthString = "Янв"
        case 2:
            monthString = "Фев"
        case 3:
            monthString = "Мар"
        case 4:
            monthString = "Апр"
        case 5:
            monthString = "Май"
        case 6:
            monthString = "Июн"
        case 7:
            monthString = "Июл"
        case 8:
            monthString = "Авг"
        case 9:
            monthString = "Сен"
        case 10:
            monthString = "Окт"
        case 11:
            monthString = "Ноя"
        case 12:
            monthString = "Дек"
        default:
            monthString = "Месяц"
        }
        let fullDateString = String(format:"%i %@ %i", day, monthString, year)
        
        return fullDateString
    }
}

class CoinsArrayFormatter: NSObject {
    
    class func createCoinsExchangesArray(coins:[Coin]) -> [Dictionary<String, Coin>] {
        
        //создаем словарь добавленных пользователем монет (из возможного большинства одинаковых монет оставляем лишь упоминание об одной)
        var uniqueCoins = Dictionary<String, Coin>()
        for coin in coins {
            if !uniqueCoins.keys.contains(coin.shortName) {
                uniqueCoins.updateValue(coin, forKey: coin.shortName)
            }
        }
        
        //распределяем добавленные монеты по массивам для конкретных бирж
        var coinsExchanges = [Dictionary<String, Coin>]()
        
        let quoineCoins = Dictionary<String, Coin>()
        coinsExchanges.append(quoineCoins)
        let bittrexCoins = Dictionary<String, Coin>()
        coinsExchanges.append(bittrexCoins)
        let hitBTCCoins = Dictionary<String, Coin>()
        coinsExchanges.append(hitBTCCoins)
        let binanceCoins = Dictionary<String, Coin>()
        coinsExchanges.append(binanceCoins)
        
//        let kucoinCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(kucoinCoins)
//        let idexCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(idexCoins)
//        let poloniexCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(poloniexCoins)
//        let cryptopiaCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(cryptopiaCoins)
//        let gate_ioCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(gate_ioCoins)
//        let livecoinCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(livecoinCoins)
//        let bigONECoins = Dictionary<String, Coin>()
//        coinsExchanges.append(bigONECoins)
//        let c2cxCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(c2cxCoins)
//        let cobinhoodCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(cobinhoodCoins)
//        let coinExchangeCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(coinExchangeCoins)
//        let yobitCoins = Dictionary<String, Coin>()
//        coinsExchanges.append(yobitCoins)
        
        for coin in uniqueCoins.values {
            coinsExchanges[coin.exchange.rawValue].updateValue(coin, forKey: coin.shortName)
//            insert(coin, at: coinsExchanges[coin.exchange.rawValue].count)
        }
        return coinsExchanges
    }
}

class CoinsArrayGroupingFormatter: NSObject {
    
    class func groupCoins(coins: [Coin]) -> [Coin] {
        
        var groupedCoinsArray = [Coin]()
        
        if coins.count > 0 {
            var groupedCoinsDict = Dictionary<String, Coin>()
            
            for coin in coins {
                if !groupedCoinsDict.keys.contains(coin.shortName) {
                    groupedCoinsDict.updateValue(coin, forKey: coin.shortName)
                }else{
                    let existingCoin = groupedCoinsDict[coin.shortName]
                    existingCoin?.sum = (existingCoin?.sum)! + coin.sum
                    existingCoin?.initialSum = (existingCoin?.initialSum)! + coin.initialSum
                    existingCoin?.amount = (existingCoin?.amount)! + coin.amount
                    groupedCoinsDict.updateValue(existingCoin!, forKey: coin.shortName)
                }
            }
            
            for groupedCoin in groupedCoinsDict.values {
                groupedCoinsArray.append(groupedCoin)
            }
        }
        
        return groupedCoinsArray
    }
}

class GlobalNumberFormatter: NSObject {
    
    class func createNumberFormatter(number: Double) -> NumberFormatter {
        
        let currentNumberFormatter = NumberFormatter.init()
        currentNumberFormatter.groupingSize = 3
        currentNumberFormatter.usesGroupingSeparator = true
        currentNumberFormatter.groupingSeparator = " "
        currentNumberFormatter.decimalSeparator = ","
        currentNumberFormatter.numberStyle = .decimal
        var fractionDigitsNumber = 0
        let positiveNumber = fabs(number)
        if positiveNumber < 1 {
            fractionDigitsNumber = 6
        }else{
            fractionDigitsNumber = 2
        }
        currentNumberFormatter.maximumFractionDigits = fractionDigitsNumber
        
        return currentNumberFormatter
    }
}

class SumCalculator: NSObject {
    
    class func getCoinsTotalSum(coins: [Coin]) -> Double {
        var totalPortfolioCost = 0.0
        for coin in coins {
            totalPortfolioCost = totalPortfolioCost + (coin.exchangeRate * coin.amount)
        }
        return totalPortfolioCost
    }
}

class PercentChangeCalculator: NSObject {
    
    class func determine24hPriceChangeInPercentsForQuoine(coinPrice: Double, coinPrice24h: Double) -> Dictionary<String, Double> {
        var priceDifference = 0.0
        if coinPrice >= coinPrice24h {
            priceDifference = coinPrice - coinPrice24h
        }else{
            priceDifference = coinPrice24h - coinPrice
        }
        var priceDifferencePercent = (priceDifference / coinPrice24h) * 100.0
        if coinPrice < coinPrice24h {
            priceDifferencePercent = 0 - priceDifferencePercent
        }
        
        var coinDetailsDict = Dictionary<String, Double>()
        coinDetailsDict.updateValue(coinPrice, forKey: kCoinLastPrice)
        coinDetailsDict.updateValue(priceDifferencePercent, forKey: kCoin24hPercentChange)
        
        return coinDetailsDict
    }

    
    class func determine24hPriceChangeInPercents(coinPrice: Double, coinPrice24h: Double, btc24hPercentChange: Double) -> Dictionary<String, Double> {
        var priceDifference = 0.0
        if coinPrice >= coinPrice24h {
            priceDifference = coinPrice - coinPrice24h
        }else{
            priceDifference = coinPrice24h - coinPrice
        }
        var priceDifferencePercent = (priceDifference / coinPrice24h) * 100.0
        if coinPrice < coinPrice24h {
            priceDifferencePercent = btc24hPercentChange - priceDifferencePercent
        }else{
            priceDifferencePercent = btc24hPercentChange + priceDifferencePercent
        }
        
        var coinDetailsDict = Dictionary<String, Double>()
        coinDetailsDict.updateValue(coinPrice, forKey: kCoinLastPrice)
        coinDetailsDict.updateValue(priceDifferencePercent, forKey: kCoin24hPercentChange)
        
        return coinDetailsDict
    }
}

class CertainCoinInfoMapper: NSObject {
    
    class func mapTrackedCoinToCommonInfoModel(coin: Coin) -> TrackedCoinCommonInfoModel {
        
        let trackedCoinArray = CoreDataManager.shared.getCertainTrackedUserCoinArray(coinShortName: coin.shortName)
        var coinsAmount = 0.0
        var coinsInitialCost = 0.0
        var coinsCurrentCost = 0.0
        
        for someCoin in trackedCoinArray {
            coinsAmount = coinsAmount + someCoin.amount
        }
        coinsInitialCost = coinsAmount * coin.purchaseExchangeRate
        coinsCurrentCost = coinsAmount * coin.exchangeRate
        
        coin.amount = coinsAmount
        coin.initialSum = coinsInitialCost
        coin.sum = coinsCurrentCost
        
        let commonInfoModel = TrackedCoinCommonInfoModel()
        
        commonInfoModel.name = coin.fullName
        commonInfoModel.id = coin.id
        
        let currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: coin.amount)
        currentNumberFormatter.maximumFractionDigits = 8
        commonInfoModel.amount = currentNumberFormatter.string(from: NSNumber.init(value: coin.amount))!
        
        currentNumberFormatter.maximumFractionDigits = coin.exchangeRate < 1 ? 6 : 2
        let currentExchangeRate = currentNumberFormatter.string(from: NSNumber.init(value: coin.exchangeRate))!
        commonInfoModel.currentExchangeRate = String(format: "$%@", currentExchangeRate)
        
        currentNumberFormatter.maximumFractionDigits = coin.initialSum < 1 ? 6 : 2
        let initialSum = currentNumberFormatter.string(from: NSNumber.init(value: coin.initialSum))!
        commonInfoModel.initialSum = String(format: "$%@", initialSum)
        
        currentNumberFormatter.maximumFractionDigits = coin.sum < 1 ? 6 : 2
        let currentSum = currentNumberFormatter.string(from: NSNumber.init(value: coin.sum))!
        commonInfoModel.currentSum = String(format: "$%@", currentSum)
        
        var initialSumMoneyChange = 0.0
        if coin.initialSum > coin.sum {
            initialSumMoneyChange = coin.initialSum - coin.sum
        }else{
            initialSumMoneyChange = coin.sum - coin.initialSum
        }
        currentNumberFormatter.maximumFractionDigits = initialSumMoneyChange < 1 ? 6 : 2
        let initialSumMoneyChangeString = currentNumberFormatter.string(from: NSNumber.init(value: initialSumMoneyChange))!
        var minusOrPlusSign = coin.initialSum <= coin.sum ? "+" : "-"
        commonInfoModel.initialSumMoneyChange = String(format: "%@$%@", minusOrPlusSign, initialSumMoneyChangeString)
        
        let initialSumPercentChange = (initialSumMoneyChange / coin.initialSum) * 100.0
        currentNumberFormatter.maximumFractionDigits = 2
        let initialSumPercentChangeString = currentNumberFormatter.string(from: NSNumber.init(value: initialSumPercentChange))!
        commonInfoModel.initialSumPercentChange = String(format: "%@%@%%", minusOrPlusSign, initialSumPercentChangeString)
        
        let last24hSumMoneyChange = coin.sum * (coin.rate24hPercentChange / 100.0)
        minusOrPlusSign = last24hSumMoneyChange < 0 ? "-" : "+"
        currentNumberFormatter.maximumFractionDigits = fabs(last24hSumMoneyChange) < 1 ? 6 : 2
        let last24hSumMoneyChangeString = currentNumberFormatter.string(from: NSNumber.init(value: fabs(last24hSumMoneyChange)))!
        commonInfoModel.last24hSumMoneyChange = String(format: "%@$%@", minusOrPlusSign, last24hSumMoneyChangeString)
        
        currentNumberFormatter.maximumFractionDigits = 2
        let last24hSumPercentChange = currentNumberFormatter.string(from: NSNumber.init(value: coin.rate24hPercentChange))!
        minusOrPlusSign = coin.rate24hPercentChange < 0 ? "" : "+"
        commonInfoModel.last24hSumPercentChange = String(format: "%@%@%%", minusOrPlusSign, last24hSumPercentChange)
        
        return commonInfoModel
    }
    
    class func mapTrackedCoinToInfoModelsArray(coin: Coin) -> [Any] {
        
        let certainUserCoinArray = CoreDataManager.shared.getCertainTrackedUserCoinArray(coinShortName: coin.shortName)
        
        let currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: coin.purchaseExchangeRate)
        
        var coinInfoModelsArray = [Any]()
        let coinCommonInfoModel = CertainCoinInfoMapper.mapTrackedCoinToCommonInfoModel(coin: coin)
        coinInfoModelsArray.append(coinCommonInfoModel)
        var unsortedPurchases = [TrackedCoinPurchaseInfoModel]()
        
        for someCoin in certainUserCoinArray {
            let purchaseInfoModel = TrackedCoinPurchaseInfoModel()
            
            let initialSum = someCoin.amount * someCoin.purchaseExchangeRate
            currentNumberFormatter.maximumFractionDigits = initialSum < 1 ? 6 : 2
            let initialSumString = currentNumberFormatter.string(from: NSNumber.init(value: initialSum))!
            purchaseInfoModel.initialSum = String(format: "$%@", initialSumString)
            
            let currentSum = someCoin.amount * coin.exchangeRate
            currentNumberFormatter.maximumFractionDigits = currentSum < 1 ? 6 : 2
            let currentSumString = currentNumberFormatter.string(from: NSNumber.init(value: currentSum))!
            purchaseInfoModel.currentSum = String(format: "$%@", currentSumString)
            
            currentNumberFormatter.maximumFractionDigits = someCoin.purchaseExchangeRate < 1 ? 6 : 2
            let purchaseExchangeRate = currentNumberFormatter.string(from: NSNumber.init(value: someCoin.purchaseExchangeRate))!
            purchaseInfoModel.purchaseExchangeRate = String(format: "$%@", purchaseExchangeRate)
            
            currentNumberFormatter.maximumFractionDigits = 8
            purchaseInfoModel.amount = currentNumberFormatter.string(from: NSNumber.init(value: someCoin.amount))!
            
            var initialSumMoneyChange = 0.0
            if initialSum > currentSum {
                initialSumMoneyChange = initialSum - currentSum
            }else{
                initialSumMoneyChange = currentSum - initialSum
            }
            currentNumberFormatter.maximumFractionDigits = initialSumMoneyChange < 1 ? 6 : 2
            let initialSumMoneyChangeString = currentNumberFormatter.string(from: NSNumber.init(value: initialSumMoneyChange))!
            var minusOrPlusSign = initialSum > currentSum ? "-" : "+"
            purchaseInfoModel.initialSumMoneyChange = String(format: "%@$%@", minusOrPlusSign, initialSumMoneyChangeString)
            
            let last24hSumMoneyChange = initialSum * (coin.rate24hPercentChange / 100.0)
            minusOrPlusSign = last24hSumMoneyChange < 0 ? "-" : "+"
            let last24hSumMoneyChangeString = currentNumberFormatter.string(from: NSNumber.init(value: fabs(last24hSumMoneyChange)))!
            purchaseInfoModel.last24hSumMoneyChange = String(format: "%@$%@", minusOrPlusSign, last24hSumMoneyChangeString)
            
            let purchaseDate = someCoin.purchaseDate!
            purchaseInfoModel.purchaseDateValue = purchaseDate
            purchaseInfoModel.purchaseDate = DetailedDateFormatter.stringFromDate(date: purchaseDate)
            
            purchaseInfoModel.note = someCoin.note
            
            purchaseInfoModel.shortName = coin.shortName
            purchaseInfoModel.uniqueId = someCoin.uniqueId
            
            unsortedPurchases.append(purchaseInfoModel)
        }
        
        let sortedPurchases = unsortedPurchases.sorted { ($0.purchaseDateValue! > $1.purchaseDateValue!) }
        for someModel in sortedPurchases {
            coinInfoModelsArray.append(someModel)
        }
        
        return coinInfoModelsArray
    }
}

class PortfolioMapper: NSObject {
    
    class func mapPortfolioModel(userPortfolio: Portfolio, userCoinsCount: Int) -> PortfolioModel {
        
        let portfolioModel = PortfolioModel()
        let rubleExchangeRate = userPortfolio.rubleExchangeRate
        
        let userCoinsSumInDollars = userPortfolio.currentDollarValue
        var currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: userCoinsSumInDollars)
        let userCoinsSumInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: userCoinsSumInDollars))
        let userCoinsSumInDollarsWithSignString = String(format:"$%@", userCoinsSumInDollarsString!)
        portfolioModel.currentDollarValue = userCoinsSumInDollarsWithSignString
        
        let userCoinsSumInRubles = userCoinsSumInDollars * rubleExchangeRate
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: userCoinsSumInRubles)
        let userCoinsSumInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: userCoinsSumInRubles))
        let userCoinsSumInRublesWithSignString = String(format:"₽%@", userCoinsSumInRublesString!)
        portfolioModel.currentRubleValue = userCoinsSumInRublesWithSignString

        let initialCoinsCostInDollars = userPortfolio.initialDollarValue
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: initialCoinsCostInDollars)
        let initialCoinsCostInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: initialCoinsCostInDollars))
        let initialCoinsCostInDollarsWithSignString = String(format:"$%@", initialCoinsCostInDollarsString!)
        portfolioModel.initialDollarValue = initialCoinsCostInDollarsWithSignString
        
        let initialCoinsCostInRubles = initialCoinsCostInDollars * rubleExchangeRate
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: initialCoinsCostInRubles)
        let initialCoinsCostInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: initialCoinsCostInRubles))
        let initialCoinsCostInRublesWithSignString = String(format:"₽%@", initialCoinsCostInRublesString!)
        portfolioModel.initialRubleValue = initialCoinsCostInRublesWithSignString
        
        var profitOrLossInDollars = 0.0
        var minusOrPlusSign = ""
        if initialCoinsCostInDollars > userCoinsSumInDollars {
            profitOrLossInDollars = initialCoinsCostInDollars - userCoinsSumInDollars
            minusOrPlusSign = "-"
        }else{
            profitOrLossInDollars = userCoinsSumInDollars - initialCoinsCostInDollars
            minusOrPlusSign = "+"
        }
        
        //прибыль или убыток с момента покупки
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: profitOrLossInDollars)
        let profitOrLossInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: profitOrLossInDollars)) //переводить будем всегда положительное число
        let profitOrLossInDollarsWithSignString = String(format:"%@$%@", minusOrPlusSign, profitOrLossInDollarsString!)
        portfolioModel.dollarProfitOrLoss = profitOrLossInDollarsWithSignString
        
        let profitOrLossInRubles = profitOrLossInDollars * rubleExchangeRate
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: profitOrLossInRubles)
        let profitOrLossInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: profitOrLossInRubles))
        let profitOrLossInRublesWithSignString = String(format:"%@₽%@", minusOrPlusSign, profitOrLossInRublesString!)
        portfolioModel.rubleProfitOrLoss = profitOrLossInRublesWithSignString
        
        //прибыль или убыток за 24ч
        let portfolio24hChangeInDollars = userPortfolio.last24hValueDollarChange
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: portfolio24hChangeInDollars)
        let portfolio24hChangeInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: fabs(portfolio24hChangeInDollars)))
        minusOrPlusSign = portfolio24hChangeInDollars < 0 ? "-" : "+"
        let portfolio24hChangeInDollarsWithSignString = String(format:"%@$%@", minusOrPlusSign, portfolio24hChangeInDollarsString!)
        portfolioModel.last24hValueDollarChange = portfolio24hChangeInDollarsWithSignString
        
        let portfolio24hChangeInRubles = portfolio24hChangeInDollars * rubleExchangeRate
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: portfolio24hChangeInRubles)
        let portfolio24hChangeInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: fabs(portfolio24hChangeInRubles)))
        let portfolio24hChangeInRublesWithSignString = String(format:"%@₽%@", minusOrPlusSign, portfolio24hChangeInRublesString!)
        portfolioModel.last24hValueRubleChange = portfolio24hChangeInRublesWithSignString
        
        //изменение в процентах с момента покупки
        let changeFromBeginningInPercentages = (profitOrLossInDollars / initialCoinsCostInDollars) * 100.0
//        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: changeFromBeginningInPercentages)
        currentNumberFormatter.maximumFractionDigits = 2
        let changeFromBeginningInPercentagesString = currentNumberFormatter.string(from: NSNumber.init(value: changeFromBeginningInPercentages))
        minusOrPlusSign = initialCoinsCostInDollars > userCoinsSumInDollars ? "-" : "+"
        let changeFromBeginningInPercentagesWithSignString = String(format:"%@%@%%", minusOrPlusSign, changeFromBeginningInPercentagesString!)
        portfolioModel.percentProfitOrLoss = changeFromBeginningInPercentagesWithSignString
        
        //изменение в процентах за 24ч
        var portfolio24PercentagesChange = 0.0
        if userCoinsCount == 1 {
            portfolio24PercentagesChange = userPortfolio.last24hValuePercentChange
        }else{
            portfolio24PercentagesChange = (portfolio24hChangeInDollars / userCoinsSumInDollars) * 100.0
        }
        minusOrPlusSign = portfolio24hChangeInDollars > 0 ? "+" : ""
    
        let portfolio24PercentagesChangeString = currentNumberFormatter.string(from: NSNumber.init(value: portfolio24PercentagesChange))
        let portfolio24PercentagesChangeStringWithSign = String(format:"%@%@%%", minusOrPlusSign, portfolio24PercentagesChangeString!)
        portfolioModel.last24hValuePercentChange = portfolio24PercentagesChangeStringWithSign
        
        return portfolioModel
    }
}

class TextColorDeterminant: NSObject {
    
    class func colorForText(text: String) -> UIColor {
        
        if text.contains("-") {
            return UIColor.redChangeColor()
        }else{
            return UIColor.greenChangeColor()
        }
    }
}

class CoinsOrderManager: NSObject {
    
    private class func keyForDict(coinType: CoinType) -> String {
        let dictKey: String!
        if coinType == CoinType.Tracked {
            dictKey = kTrackedCoinsQueueIndexesDict
        }else{
            dictKey = kObservedCoinsQueueIndexesDict
        }
        return dictKey
    }
    
    class func orderCoins(coinsType: CoinType, disorderedCoins: [Coin]) -> [Coin] {
        let dictKey = keyForDict(coinType: coinsType)
//        if coinsType == CoinType.Tracked {
//            dictKey = kTrackedCoinsQueueIndexesDict
//        }else{
//            dictKey = kObservedCoinsQueueIndexesDict
//        }
        
        if UserDefaults.standard.object(forKey: dictKey) != nil {
            let coinsIndexes = UserDefaults.standard.object(forKey: dictKey) as! Dictionary<String, Int>
            
            if coinsIndexes.keys.count != 0 && coinsIndexes.keys.count == disorderedCoins.count {
                var orderedCoins = [Coin]()
                for _ in 0..<disorderedCoins.count {
                    orderedCoins.append(Coin())
                }
                for someTrackedCoin in disorderedCoins {
                    let coinIndex = coinsIndexes[someTrackedCoin.shortName]!
                    orderedCoins.remove(at: coinIndex)
                    orderedCoins.insert(someTrackedCoin, at: coinIndex)
                }
                return orderedCoins
            }else{
                return disorderedCoins
            }
        }else{
            return disorderedCoins
        }
    }
    
    class func updateCoinsOrder(coinsType: CoinType, disorderedCoins: [Coin]) {
        let dictKey = keyForDict(coinType: coinsType)
//        let dictKey: String!
//        if coinsType == CoinType.Tracked {
//            dictKey = kTrackedCoinsQueueIndexesDict
//        }else{
//            dictKey = kObservedCoinsQueueIndexesDict
//        }
        
        if disorderedCoins.count > 0 {
            var newCoinsIndexes = Dictionary<String, Int>()
            for someCoin in disorderedCoins {
                newCoinsIndexes.updateValue(disorderedCoins.index(of: someCoin)!, forKey: someCoin.shortName)
            }
            UserDefaults.standard.set(newCoinsIndexes, forKey: dictKey)
        }else{
            UserDefaults.standard.set(Dictionary<String, Int>(), forKey: dictKey)
        }
    }
    
    class func addNewCoinToQueue(coinType: CoinType, newCoin: Coin) {
        let dictKey = keyForDict(coinType: coinType)
        
        if UserDefaults.standard.object(forKey: dictKey) != nil {
            var coinsIndexes = UserDefaults.standard.object(forKey: dictKey) as! Dictionary<String, Int>
            if coinsIndexes.keys.count != 0 {
                if !coinsIndexes.keys.contains(newCoin.shortName) {
                    coinsIndexes.updateValue(coinsIndexes.count, forKey: newCoin.shortName)
                    UserDefaults.standard.set(coinsIndexes, forKey: dictKey)
                }
            }else{
                var newCoinsQueue = Dictionary<String, Int>()
                newCoinsQueue.updateValue(0, forKey: newCoin.shortName)
                UserDefaults.standard.set(newCoinsQueue, forKey: dictKey)
            }
        }else{
            var newCoinsQueue = Dictionary<String, Int>()
            newCoinsQueue.updateValue(0, forKey: newCoin.shortName)
            UserDefaults.standard.set(newCoinsQueue, forKey: dictKey)
        }
    }
    
//    class func removeCoinFromQueue(coinType: CoinType, coinToRemove: Coin) { //только для экрана покупок монеты
//
//        let dictKey = keyForDict(coinType: coinType)
//
//        let coinsIndexes = UserDefaults.standard.object(forKey: dictKey) as! Dictionary<String, Int>
//        if coinsIndexes.keys.count == 1 {
//            UserDefaults.standard.set(Dictionary<String, Int>(), forKey: dictKey)
//        }else{
//
//        }
//    }
}

class AlertsManager: NSObject {
    
    class func showTryToUpdateLater(inViewController: UIViewController) {
        let alert = UIAlertController.init(title: "Что-то пошло не так", message: "Произошла ошибка при выполнении запроса. Пожалуйста, попробуйте обновить информацию позже", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(okAction)
        inViewController.present(alert, animated: true, completion: nil)
    }
    
    class func showTryToUpdateLaterAndDismiss(inViewController: UIViewController) {
        let alert = UIAlertController.init(title: "Что-то пошло не так", message: "Произошла ошибка при выполнении запроса. Пожалуйста, попробуйте обновить информацию позже", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ОК", style: .cancel) { (action) in
            inViewController.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        inViewController.present(alert, animated: true, completion: nil)
    }
}

