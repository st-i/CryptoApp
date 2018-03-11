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
        
        let topSixCoins = AllCoinsManager.createArrayWithTopSixCoins()
        
        //first section
        for i in 0..<3 {
            firstSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(coin: topSixCoins[i], tableView: tableView))
        }
        
        //second section
        for i in 0..<6 {
            secondSection.add(CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(coin: topSixCoins[i], tableView: tableView))
        }
        
        let allSections = [firstSection, secondSection]
        
        return allSections
    }

}
