//
//  CurrencyForSearchScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 20.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class CurrencyForSearchScreenDirector: NSObject {
    
    class func createCurrencyForSearchCells(for tableView: UITableView) -> Array<Any> {
        let firstSection = NSMutableArray()
        let secondSection = NSMutableArray()
        
        //first section
        firstSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        firstSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        firstSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        
        //second section
        secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView))
        
        let allSections = [firstSection, secondSection]
        
        return allSections
    }

}
