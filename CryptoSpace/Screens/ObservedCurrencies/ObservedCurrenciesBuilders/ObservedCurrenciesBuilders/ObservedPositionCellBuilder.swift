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
        
    class func buildCell(_ tableView: UITableView, coin: Coin) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kObservedPositionCellIdentifier) as! ObservedPositionCell
        cell.selectionStyle = .none
        cell.currencyImageView.image = UIImage(named:coin.id)
        cell.currencyPairLabel.text = coin.shortName
        
        let numberFormatter = GlobalNumberFormatter.createNumberFormatter(number: coin.exchangeRate)
        let coinExchangeRate = numberFormatter.string(from: NSNumber.init(value: coin.exchangeRate))!
        cell.currencyExchangeRateCostLabel.text = String(format: "$%@", coinExchangeRate)
    
        numberFormatter.maximumFractionDigits = 2
        let minusOrPlusSign = coin.rate24hPercentChange < 0 ? "" : "+"
        let coin24hRateChange = numberFormatter.string(from: NSNumber.init(value: coin.rate24hPercentChange))!
        cell.currencyExchangeRatePercentagesChangeLabel.text = String(format: "%@%@%%", minusOrPlusSign, coin24hRateChange)
        cell.currencyExchangeRatePercentagesChangeLabel.textColor = TextColorDeterminant.colorForText(text: coin24hRateChange)
        
        return cell
    }
}
