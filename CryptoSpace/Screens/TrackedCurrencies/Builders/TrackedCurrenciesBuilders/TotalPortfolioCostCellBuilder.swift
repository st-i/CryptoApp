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
        
    class func buildTotalPortfolioCostCell(for tableView: UITableView, totalSum: String, changeFromPurchaseMoment: String, initialCost: String, profitOrLoss: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTotalPortfolioCostCellIdentifier) as! TotalPortfolioCostCell
        cell.selectionStyle = .none
        
        
        cell.totalPortfolioValueLabel.text = totalSum //String(format:"$%@", totalPortfolioCostString!) //сделать 0 после числа
        cell.changeFromPurchaseMoment.text = changeFromPurchaseMoment
        cell.initialPortfolioCostLabel.text = initialCost
        cell.portfolioProfitOrLossLabel.text = profitOrLoss
        
        if changeFromPurchaseMoment.contains("-") {
            cell.changeFromPurchaseMoment.textColor = UIColor.redChangeColor()
        }else{
            cell.changeFromPurchaseMoment.textColor = UIColor.greenChangeColor()
        }
        
        if profitOrLoss.contains("-") {
            cell.portfolioProfitOrLossLabel.textColor = UIColor.redChangeColor()
        }else{
            cell.portfolioProfitOrLossLabel.textColor = UIColor.greenChangeColor()
        }
        
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
