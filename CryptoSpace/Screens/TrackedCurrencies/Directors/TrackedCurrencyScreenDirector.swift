//
//  TrackedCurrencyScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrencyScreenDirector: NSObject {

    class func createTrackedCurrencyCells(for tableView: UITableView, currentCoin: Coin) -> Array<Any> {
//        let firstSection = NSMutableArray()
//        let secondSection = NSMutableArray()
//
//        //first section
//        firstSection.add(CommonCoinInfoCellBuilder.buildCell(for: tableView))
//
//        //second section
//        secondSection.add(CoinPurchaseWONoteCellBuilder.buildCell(for: tableView))
//        secondSection.add(CoinPurchaseWONoteCellBuilder.buildCell(for: tableView))
//        secondSection.add(CoinPurchaseWithNoteCellBuilder.buildCell(for: tableView))
//        secondSection.add(CoinPurchaseWithNoteCellBuilder.buildCell(for: tableView))
//
//        let allSections = [firstSection, secondSection]
        
        let firstCell: CommonCoinInfoCell = CommonCoinInfoCellBuilder.buildCell(for: tableView, coin: currentCoin) as! CommonCoinInfoCell
        let secondCell: CoinPurchaseWONoteCell = CoinPurchaseWONoteCellBuilder.buildCell(for: tableView) as! CoinPurchaseWONoteCell
        let thirdCell: CoinPurchaseWONoteCell = CoinPurchaseWONoteCellBuilder.buildCell(for: tableView) as! CoinPurchaseWONoteCell
        let fourthCell: CoinPurchaseWithNoteCell = CoinPurchaseWithNoteCellBuilder.buildCell(for: tableView) as! CoinPurchaseWithNoteCell
        let fifthCell: CoinPurchaseWithNoteCell = CoinPurchaseWithNoteCellBuilder.buildCell(for: tableView) as! CoinPurchaseWithNoteCell
        
        let allSections = [[firstCell], [secondCell], [thirdCell], [fourthCell], [fifthCell]]
        
        return allSections
    }
}
