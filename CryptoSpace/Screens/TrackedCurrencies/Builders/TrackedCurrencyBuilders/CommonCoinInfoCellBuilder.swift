//
//  CommonCoinInfoCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCommonCoinInfoCellIdentifier = "CommonCoinInfoCell"

class CommonCoinInfoCellBuilder: NSObject {

    class func buildCell(for tableView: UITableView, coin: Coin) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCommonCoinInfoCellIdentifier) as! CommonCoinInfoCell
        cell.selectionStyle = .none
        cell.coinNameLabel.text = coin.fullName
//        cell.backgroundColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
//        cell.lastChangesLabel.textColor = UIColor.white
//        cell.portfolioPercentagesChangesLabel.textColor = UIColor.white
//        cell.totalPortfolioValueLabel.textColor = UIColor.white
//        cell.portfolioPercentagesChangesLabel.textColor = UIColor.green
        cell.exchangeRatePercentagesChangeLabel.textColor = UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
//        cell.purchasedCoinsPercentagesChangeLabel.textColor = UIColor.red
        cell.currencyImageView.image = UIImage(named:"Bitcoin")
//        cell.lowerSeparator.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
        return cell
    }
}
