//
//  TrackedPositionCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 10.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit
import Alamofire

private let kTrackedPositionCellIdentifier = "TrackedPositionCell"

class TrackedPositionCellBuilder: NSObject {

    class func buildTrackedPositionCell(for tableView: UITableView) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kTrackedPositionCellIdentifier) as! TrackedPositionCell
        cell.currencyImageView.image = UIImage(named:"Icon placeholder")
        cell.lowerSeparator.backgroundColor = UIColor.clear
        cell.currencyExchangeRatePercentagesChangeLabel.textColor = UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
        return cell
    }
}
