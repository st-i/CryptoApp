//
//  CurrencyForSearchCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 20.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyForSearchCellIdentifier = "CurrencyForSearchCell"

class CurrencyForSearchCellBuilder: NSObject {
    
    class func buildCurrencyForSearchCell(coin: Coin, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCurrencyForSearchCellIdentifier) as! CurrencyForSearchCell
        cell.lowerSeparator.backgroundColor = UIColor.clear
        cell.currencyImageView.image = UIImage(named:"Bitcoin")
        cell.currencyNameLabel.text = String.init(format: "%@: %@", coin.shortName, coin.fullName)
        
        return cell
    }
}
