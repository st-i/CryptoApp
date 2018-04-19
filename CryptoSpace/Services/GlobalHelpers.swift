//
//  GlobalHelpers.swift
//  CryptoSpace
//
//  Created by st.i on 17.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import Foundation
import UIKit

//НАПИСАТЬ ХЕЛПЕР NUMBERFORMATTER

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
        
        var groupedCoinsArray = [Coin]()
        for groupedCoin in groupedCoinsDict.values {
            groupedCoinsArray.append(groupedCoin)
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
        if number < 1 {
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
            totalPortfolioCost = totalPortfolioCost + coin.sum
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
        var minusOrPlusSign = coin.initialSum >= coin.sum ? "-" : "+"
        commonInfoModel.initialSumMoneyChange = String(format: "%@$%@", minusOrPlusSign, initialSumMoneyChangeString)
        
        let initialSumPercentChange = (initialSumMoneyChange / coin.initialSum) * 100.0
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
            purchaseInfoModel.purchaseDate = DetailedDateFormatter.stringFromDate(date: purchaseDate)
            
            purchaseInfoModel.note = someCoin.note
            
            coinInfoModelsArray.append(purchaseInfoModel)
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
        if initialCoinsCostInDollars >= userCoinsSumInDollars {
            profitOrLossInDollars = initialCoinsCostInDollars - userCoinsSumInDollars
            minusOrPlusSign = "-"
        }else{
            profitOrLossInDollars = userCoinsSumInDollars - initialCoinsCostInDollars
            minusOrPlusSign = "+"
        }
        
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: profitOrLossInDollars)
        let profitOrLossInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: profitOrLossInDollars))
        let profitOrLossInDollarsWithSignString = String(format:"%@$%@", minusOrPlusSign, profitOrLossInDollarsString!)
        portfolioModel.dollarProfitOrLoss = profitOrLossInDollarsWithSignString
        
        let profitOrLossInRubles = profitOrLossInDollars * rubleExchangeRate
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: profitOrLossInRubles)
        let profitOrLossInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: profitOrLossInRubles))
        let profitOrLossInRublesWithSignString = String(format:"%@₽%@", minusOrPlusSign, profitOrLossInRublesString!)
        portfolioModel.rubleProfitOrLoss = profitOrLossInRublesWithSignString
        
        //прибыль или убыток за 24ч
        let portfolio24hChangeInDollars = userPortfolio.last24hValueDollarChange
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: fabs(portfolio24hChangeInDollars))
        let portfolio24hChangeInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: portfolio24hChangeInDollars))
        minusOrPlusSign = portfolio24hChangeInDollars < 0 ? "" : "+"
        let portfolio24hChangeInDollarsWithSignString = String(format:"%@$%@", minusOrPlusSign, portfolio24hChangeInDollarsString!)
        portfolioModel.last24hValueDollarChange = portfolio24hChangeInDollarsWithSignString
        
        let portfolio24hChangeInRubles = portfolio24hChangeInDollars * rubleExchangeRate
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: fabs(portfolio24hChangeInRubles))
        let portfolio24hChangeInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: portfolio24hChangeInRubles))
        let portfolio24hChangeInRublesWithSignString = String(format:"%@₽%@", minusOrPlusSign, portfolio24hChangeInRublesString!)
        portfolioModel.last24hValueRubleChange = portfolio24hChangeInRublesWithSignString
        
        //изменение в процентах с начала
        let changeFromBeginningInPercentages = (profitOrLossInDollars / initialCoinsCostInDollars) * 100.0
        currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: changeFromBeginningInPercentages)
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
        if portfolio24hChangeInDollars < 0 {
            minusOrPlusSign = "-"
        }else{
            minusOrPlusSign = "+"
        }
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

