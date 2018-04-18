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
        
    class func buildTotalPortfolioCostCell(_ tableView: UITableView, portfolioModel: PortfolioModel, showInDollars: Bool) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTotalPortfolioCostCellIdentifier) as! TotalPortfolioCostCell
        cell.selectionStyle = .none
        
        var currentValue: String = ""
        var initialValue: String = ""
        var profitOrLoss: String = ""
        var last24hValueChange: String = ""
        
        if showInDollars {
            currentValue = portfolioModel.currentDollarValue
            initialValue = portfolioModel.initialDollarValue
            profitOrLoss = portfolioModel.dollarProfitOrLoss
            last24hValueChange = portfolioModel.last24hValueDollarChange
        }else{
            currentValue = portfolioModel.currentRubleValue
            initialValue = portfolioModel.initialRubleValue
            profitOrLoss = portfolioModel.rubleProfitOrLoss
            last24hValueChange = portfolioModel.last24hValueRubleChange
        }
        
        cell.totalPortfolioValueLabel.text = currentValue //сделать 0 после числа
        cell.initialPortfolioCostLabel.text = initialValue
        cell.portfolioProfitOrLossLabel.text = profitOrLoss
        cell.portfolioProfitOrLoss24hLabel.text = last24hValueChange
        cell.changeFromPurchaseMoment.text = portfolioModel.percentProfitOrLoss
        cell.portfolio24hChangeLabel.text = portfolioModel.last24hValuePercentChange

        cell.portfolioProfitOrLossLabel.textColor = TextColorDeterminant.colorForText(text: profitOrLoss)
        cell.portfolioProfitOrLoss24hLabel.textColor = TextColorDeterminant.colorForText(text: last24hValueChange)
        cell.changeFromPurchaseMoment.textColor = TextColorDeterminant.colorForText(text: portfolioModel.percentProfitOrLoss)
        cell.portfolio24hChangeLabel.textColor = TextColorDeterminant.colorForText(text: portfolioModel.last24hValuePercentChange)
        
        return cell
    }
}
