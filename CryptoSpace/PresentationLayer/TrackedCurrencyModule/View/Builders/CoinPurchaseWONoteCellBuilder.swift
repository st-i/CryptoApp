//
//  CoinPurchaseWONoteCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCoinPurchaseWONoteCellIdentifier = "CoinPurchaseWONoteCell"

class CoinPurchaseWONoteCellBuilder: NSObject {
    
    class func buildCell(_ tableView: UITableView, purchaseInfoModel: TrackedCoinPurchaseInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCoinPurchaseWONoteCellIdentifier) as! CoinPurchaseWONoteCell
        cell.selectionStyle = .none
    
        cell.initialPurchaseSum.text = purchaseInfoModel.initialSum
        cell.currentPurchaseSum.text = purchaseInfoModel.currentSum
        
        cell.purchaseExchangeRate.text = purchaseInfoModel.purchaseExchangeRate
        cell.amountLabel.text = purchaseInfoModel.amount

        cell.initialPurchaseSumMoneyChangeLabel.text = purchaseInfoModel.initialSumMoneyChange
        cell.initialPurchaseSumMoneyChangeLabel.textColor = TextColorDeterminant.colorForText(text: purchaseInfoModel.initialSumMoneyChange)
        
        cell.purchaseDateLabel.text = purchaseInfoModel.purchaseDate
        
        return cell
    }
}
