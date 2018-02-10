//
//  AddCurrencyScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class AddCurrencyScreenDirector: NSObject {
    
    class func createAddCurrencyCells(for tableView: UITableView) -> Array<Any> {
        let firstSection = NSMutableArray()
        let secondSection = NSMutableArray()
        let thirdSection = NSMutableArray()
        
        //first section
//        firstSection.add(ActionWithCurrencyCellBuilder.buildActionWithCurrencyCell(for: tableView))
        
        //second section
//        secondSection.add(CurrencyPairCellBuilder.buildCurrencyPairCell(for: tableView))
//        secondSection.add(ActionWithCurrencyDateCellBuilder.buildActionWithCurrencyDateCell(for: tableView))
//        secondSection.add(CurrentExchangeRateCellBuilder.buildCurrentExchangeRateCell(for: tableView))
//        secondSection.add(PurchaseExchangeRateCellBuilder.buildPurchaseExchangeRateCell(for: tableView))
//        secondSection.add(CurrencyAmountCellBuilder.buildCurrencyAmountCell(for: tableView))
//        secondSection.add(PurchaseSumCellBuilder.buildPurchaseSumCell(for: tableView))
        
        //third section
        thirdSection.add(NotesCellBuilder.buildNotesCell(for: tableView))
        
        let allSections = [firstSection, secondSection, thirdSection]
        
        return allSections
    }
}
