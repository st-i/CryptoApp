//
//  TrackedCurrenciesDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 10.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrenciesDataSource: NSObject, UITableViewDataSource {
    
    var arrayWithCells = NSMutableArray() as! [[UITableViewCell]]
    var coins = [Coin]()
    var totalSumString: String = ""
    var portfolio24hPercentagesChange: String = ""
    var changeFromBeginningInPercentages: String = ""
    var initialSumString: String = ""
    var profitOrLossString: String = ""
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
//        return arrayWithCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return coins.count
        default:
            return 0
        }
//        return arrayWithCells[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 1 && indexPath.row == ((self.arrayWithCells[indexPath.section]) as! NSMutableArray).count - 1 {
//            let secondSection = self.arrayWithCells[indexPath.section] as! NSMutableArray
//            let cell = secondSection[indexPath.row] as! TrackedPositionCell
//            cell.lowerSeparator.backgroundColor = UIColor.clear
//            return cell
//        }else{
//            return (arrayWithCells[indexPath.section] as! NSMutableArray)[indexPath.row] as! UITableViewCell
//        }
//        return arrayWithCells[indexPath.section][indexPath.row]
        switch indexPath.section {
        case 0:
            return TotalPortfolioCostCellBuilder.buildTotalPortfolioCostCell(for: tableView, totalSum: totalSumString, portfolio24hChange: portfolio24hPercentagesChange, changeFromPurchaseMoment: changeFromBeginningInPercentages, initialCost: initialSumString, profitOrLoss: profitOrLossString)
        case 1:
//            let currentCoin = coins[indexPath.row]
            return TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView, coin: coins[indexPath.row])
        default:
            return TotalPortfolioCostCellBuilder.buildTotalPortfolioCostCell(for: tableView, totalSum: totalSumString, portfolio24hChange: portfolio24hPercentagesChange, changeFromPurchaseMoment: changeFromBeginningInPercentages, initialCost: initialSumString, profitOrLoss: profitOrLossString)
        }
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.section == 0 {
//            return false
//        }else{
//            return true
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.section == 0 {
//            return false
//        }else{
//            return true
//        }
//    }
    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let movedCell = arrayWithCells[1][sourceIndexPath.row]
//        arrayWithCells[1].remove(at: sourceIndexPath.row)
//        arrayWithCells[1].insert(movedCell, at: destinationIndexPath.row)
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            arrayWithCells[1].remove(at: indexPath.row)
//
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .bottom)
//            tableView.endUpdates()
//        }
//    }
}
