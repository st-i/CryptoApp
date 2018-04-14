//
//  TrackedCurrencyDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrencyDataSource: NSObject, UITableViewDataSource {
    
//    var arrayWithCells = [Any]()
    var modelsArray = [Any]()
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return modelsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
//        return (arrayWithCells[section] as! NSMutableArray).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return (arrayWithCells[indexPath.section] as! [UITableViewCell])[indexPath.row]
        if indexPath.section == 0 {
            return CommonCoinInfoCellBuilder.buildCell(tableView, commonInfoModel: modelsArray[0] as! TrackedCoinCommonInfoModel) as! CommonCoinInfoCell
        }else{
            let purchaseInfoModel = modelsArray[indexPath.section] as! TrackedCoinPurchaseInfoModel
            if purchaseInfoModel.note.count > 0 {
                return CoinPurchaseWithNoteCellBuilder.buildCell(tableView, purchaseInfoModel: purchaseInfoModel) as! CoinPurchaseWithNoteCell
            }else{
                return CoinPurchaseWONoteCellBuilder.buildCell(tableView, purchaseInfoModel: purchaseInfoModel) as! CoinPurchaseWONoteCell
            }
        }
    }
}
