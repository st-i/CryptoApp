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
        
    class func buildTotalPortfolioCostCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTotalPortfolioCostCellIdentifier) as! TotalPortfolioCostCell
        cell.selectionStyle = .none
//        cell.backgroundColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
//        cell.lastChangesLabel.textColor = UIColor.white
//        cell.portfolioPercentagesChangesLabel.textColor = UIColor.white
//        cell.totalPortfolioValueLabel.textColor = UIColor.white
//        cell.contentView.backgroundColor = UIColor.white
        cell.portfolioPercentagesChangesLabel.textColor = UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
        return cell
    }
}
