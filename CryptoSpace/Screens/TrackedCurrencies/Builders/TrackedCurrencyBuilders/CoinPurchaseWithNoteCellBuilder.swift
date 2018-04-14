//
//  CoinPurchaseWithNoteCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCoinPurchaseWithNoteCellIdentifier = "CoinPurchaseWithNoteCell"

class CoinPurchaseWithNoteCellBuilder: NSObject {
    
    class func buildCell(_ tableView: UITableView, purchaseInfoModel: TrackedCoinPurchaseInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCoinPurchaseWithNoteCellIdentifier) as! CoinPurchaseWithNoteCell
        cell.selectionStyle = .none
        
        cell.initialPurchaseSum.text = purchaseInfoModel.initialSum
        cell.currentPurchaseSum.text = purchaseInfoModel.currentSum
        
        cell.purchaseExchangeRate.text = purchaseInfoModel.purchaseExchangeRate
        cell.amountLabel.text = purchaseInfoModel.amount

        cell.initialPurchaseSumMoneyChangeLabel.text = purchaseInfoModel.initialSumMoneyChange
        cell.initialPurchaseSumMoneyChangeLabel.textColor = TextColorDeterminant.colorForText(text: purchaseInfoModel.initialSumMoneyChange)
                
        return cell
    }
}
