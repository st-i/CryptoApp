//
//  TotalPortfolioCostCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 10.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kTotalPortfolioCostCellIdentifier = "TotalPortfolioCostCell"

class TotalPortfolioCostCellBuilder: NSObject {
        
    class func buildTotalPortfolioCostCell(for tableView: UITableView, userCoins: [Coin]) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTotalPortfolioCostCellIdentifier) as! TotalPortfolioCostCell
        cell.selectionStyle = .none
        
        var totalPortfolioCost = 0.0
        for coin in userCoins {
            totalPortfolioCost = totalPortfolioCost + coin.sum
        }
        let currentNumberFormatter = NumberFormatter.init()
        currentNumberFormatter.groupingSize = 3
        currentNumberFormatter.usesGroupingSeparator = true
        currentNumberFormatter.groupingSeparator = " "
        currentNumberFormatter.decimalSeparator = ","
        currentNumberFormatter.numberStyle = .decimal
        var fractionDigitsNumber = 0
        if totalPortfolioCost < 1 {
            fractionDigitsNumber = 6
        }else{
            fractionDigitsNumber = 2
        }
        currentNumberFormatter.maximumFractionDigits = fractionDigitsNumber
        let totalPortfolioCostString = currentNumberFormatter.string(from: NSNumber.init(value: totalPortfolioCost))
        cell.totalPortfolioValueLabel.text = String(format:"$%@", totalPortfolioCostString!) //сделать 0 после числа
        //₽
        cell.portfolioPercentagesChangesLabel.textColor = UIColor.redChangeColor()

        
//        cell.backgroundColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
//        cell.lastChangesLabel.textColor = UIColor.white
//        cell.portfolioPercentagesChangesLabel.textColor = UIColor.white
//        cell.totalPortfolioValueLabel.textColor = UIColor.white
//        cell.contentView.backgroundColor = UIColor.white
//        UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
//        UIColor.init(red: 240.0 / 255.0, green: 77.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
        return cell
    }
}
