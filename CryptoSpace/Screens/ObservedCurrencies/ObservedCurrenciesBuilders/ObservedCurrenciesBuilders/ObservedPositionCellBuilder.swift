//
//  ObservedPositionCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 10.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kObservedPositionCellIdentifier = "ObservedPositionCell"

class ObservedPositionCellBuilder: NSObject {
        
    class func buildObservedPositionCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kObservedPositionCellIdentifier) as! ObservedPositionCell
//        cell.selectionStyle = .none
        cell.currencyImageView.image = UIImage(named:"Bitcoin")
        cell.currencyExchangeRatePercentagesChangeLabel.textColor = UIColor.red
        return cell
    }
}
