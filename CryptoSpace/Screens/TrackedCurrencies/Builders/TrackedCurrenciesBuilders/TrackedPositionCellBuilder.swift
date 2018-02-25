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

    class func buildTrackedPositionCell(for tableView: UITableView, coinName: String, coinExchangeRate: Double) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kTrackedPositionCellIdentifier) as! TrackedPositionCell
        
        cell.currencyImageView.image = UIImage(named:"Icon placeholder")
        cell.currencyNameLabel.text = coinName
        
        let currentNumberFormatter = NumberFormatter.init()
        currentNumberFormatter.groupingSize = 3
        var fractionDigitsNumber = 0
        if coinExchangeRate < 1 {
            fractionDigitsNumber = 6
        }else{
            fractionDigitsNumber = 2
        }
        currentNumberFormatter.maximumFractionDigits = fractionDigitsNumber
        currentNumberFormatter.usesGroupingSeparator = true
        currentNumberFormatter.groupingSeparator = " "
        currentNumberFormatter.decimalSeparator = ","
        currentNumberFormatter.numberStyle = .decimal

        let coinRateString = currentNumberFormatter.string(from: NSNumber.init(value: coinExchangeRate))

        cell.currencyExchangeRateCostLabel.text = String(format:"$%@", coinRateString!) //сделать 0 после числа
//        cell.currencyExchangeRateCostLabel.text = String(format:"%f", coinExchangeRate)
        
        cell.lowerSeparator.backgroundColor = UIColor.clear
        cell.currencyExchangeRatePercentagesChangeLabel.textColor = UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
        return cell
    }
}
