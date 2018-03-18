//
//  CurrentExchangeRateCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCurrentExchangeRateCellIdentifier = "CurrentExchangeRateCell"

class CurrentExchangeRateCellBuilder: NSObject {
    
    class func buildCurrentExchangeRateCell(for tableView: UITableView, leftText: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCurrentExchangeRateCellIdentifier) as! CurrentExchangeRateCell
        cell.selectionStyle = .none
        
        cell.leftTextLabel.text = leftText
//        cell.rightTextLabel.text = rightText
        return cell
    }
}
