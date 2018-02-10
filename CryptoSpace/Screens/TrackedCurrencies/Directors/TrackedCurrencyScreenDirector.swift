//
//  TrackedCurrencyScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrencyScreenDirector: NSObject {

    class func createTrackedCurrencyCells(for tableView: UITableView) -> Array<Any> {
        let firstSection = NSMutableArray()
        
        //first section
        firstSection.add(TrackedCurrencyCellBuilder.buildTrackedCurrencyCell(for: tableView))
        
        let allSections = [firstSection]
        
        return allSections
    }
}
