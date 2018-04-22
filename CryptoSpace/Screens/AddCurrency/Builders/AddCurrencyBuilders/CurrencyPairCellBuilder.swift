//
//  CurrencyPairCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyPairCellIdentifier = "CurrencyPairCell"

class CurrencyPairCellBuilder: NSObject {
    
    class func buildCurrencyPairCell(for tableView: UITableView, coinId: String, coinName: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCurrencyPairCellIdentifier) as! CurrencyPairCell
        cell.coinShortNameLabel.text = coinName
        cell.selectionStyle = .none
        
        return cell
    }
}
