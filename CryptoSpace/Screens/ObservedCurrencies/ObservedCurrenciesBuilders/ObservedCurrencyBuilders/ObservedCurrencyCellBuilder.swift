//
//  ObservedCurrencyCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 18.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kObservedCurrencyCellIdentifier = "ObservedCurrencyCell"

class ObservedCurrencyCellBuilder: NSObject {

    class func buildObservedCurrencyCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kObservedCurrencyCellIdentifier) as! ObservedCurrencyCell
        cell.selectionStyle = .none
        //        cell.backgroundColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        //        cell.lastChangesLabel.textColor = UIColor.white
        //        cell.portfolioPercentagesChangesLabel.textColor = UIColor.white
        //        cell.totalPortfolioValueLabel.textColor = UIColor.white
        
        //        cell.portfolioPercentagesChangesLabel.textColor = UIColor.green
        cell.exchangeRatePercentagesChangeLabel.textColor = UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
        cell.observedCurrencyImageView.image = UIImage(named:"Bitcoin")
        return cell
    }
}
