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

    class func buildCell(_ tableView: UITableView, commonInfoModel: TrackedCoinCommonInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCommonCoinInfoCellIdentifier) as! CommonCoinInfoCell
        cell.selectionStyle = .none
        cell.currencyImageView.image = UIImage(named:commonInfoModel.id)
        
        cell.coinNameLabel.font = commonInfoModel.name.count < 23 ? UIFont.systemFont(ofSize: 19.0, weight: .medium) : UIFont.systemFont(ofSize: 17.0, weight: .medium)
        cell.coinNameLabel.text = commonInfoModel.name
        
        cell.coinAmountLabel.text = commonInfoModel.amount
        cell.coinCurrentExchangeRate.text = commonInfoModel.currentExchangeRate
        cell.initialCoinSum.text = commonInfoModel.initialSum
        cell.currentCoinSum.text = commonInfoModel.currentSum
        
        cell.initialCoinSumMoneyChangeLabel.text = commonInfoModel.initialSumMoneyChange
        cell.initialCoinSumMoneyChangeLabel.textColor = TextColorDeterminant.colorForText(text: commonInfoModel.initialSumMoneyChange)
        
        cell.initialCoinPercentChangeLabel.text = commonInfoModel.initialSumPercentChange
        cell.initialCoinPercentChangeLabel.textColor = TextColorDeterminant.colorForText(text: commonInfoModel.initialSumPercentChange)
        
        cell.last24hCoinSumMoneyChangeLabel.text = commonInfoModel.last24hSumMoneyChange
        cell.last24hCoinSumMoneyChangeLabel.textColor = TextColorDeterminant.colorForText(text: commonInfoModel.last24hSumMoneyChange)
        
        cell.last24hCoinSumPercentChangeLabel.text = commonInfoModel.last24hSumPercentChange
        cell.last24hCoinSumPercentChangeLabel.textColor = TextColorDeterminant.colorForText(text: commonInfoModel.last24hSumPercentChange)

        return cell
    }
}
