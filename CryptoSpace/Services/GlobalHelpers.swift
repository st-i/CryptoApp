//
//  GlobalHelpers.swift
//  CryptoSpace
//
//  Created by st.i on 17.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import Foundation

//НАПИСАТЬ ХЕЛПЕР NUMBERFORMATTER

class DetailedDateFormatter: NSObject {
    
    func stringFromDate(date: Date) -> String {
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
    
    func createCoinsExchangesArray(coins:[Coin]) -> [Dictionary<String, Coin>] {
        
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

