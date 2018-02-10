//
//  ObservedCurrencyScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 18.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedCurrencyScreenDirector: NSObject {

    class func createObservedCurrencyCells(for tableView: UITableView) -> Array<Any> {
        let firstSection = NSMutableArray()
        
        //first section
        firstSection.add(ObservedCurrencyCellBuilder.buildObservedCurrencyCell(for: tableView))
        
        let allSections = [firstSection]
        
        return allSections
    }
}
