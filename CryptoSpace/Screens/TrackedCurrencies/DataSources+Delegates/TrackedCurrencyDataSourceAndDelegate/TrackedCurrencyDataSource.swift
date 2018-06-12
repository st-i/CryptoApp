//
//  TrackedCurrencyDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrencyDataSource: NSObject, UITableViewDataSource {
    
    var modelsArray = [Any]()
    var viewController: TrackedCurrencyViewController?
    var trackedGroupedCoins = [Coin]()

    public func numberOfSections(in tableView: UITableView) -> Int {
        return modelsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }else{
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let modelToDelete = modelsArray[indexPath.section] as! TrackedCoinPurchaseInfoModel
            modelsArray.remove(at: indexPath.section)
            CoreDataManager.shared.deleteCertainTrackedUserCoinFromCoreData(coinModel: modelToDelete)
            viewController?.fillTableViewWithData()
            
            tableView.beginUpdates()
            tableView.deleteSections([indexPath.section], with: .bottom)
            tableView.endUpdates()
            
            if modelsArray.count == 1 {
                for trackedCoin in trackedGroupedCoins {
                    if trackedCoin.shortName == modelToDelete.shortName {
                        trackedGroupedCoins.remove(at: trackedGroupedCoins.index(of: trackedCoin)!)
                    }
                }
                CoinsOrderManager.updateCoinsOrder(coinsType: .Tracked, disorderedCoins: trackedGroupedCoins)
                viewController?.navigationController?.popViewController(animated: true)
            }
        }
    }
}
