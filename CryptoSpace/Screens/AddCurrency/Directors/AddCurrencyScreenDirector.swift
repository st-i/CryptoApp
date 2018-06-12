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
        
        //third section
        thirdSection.add(NotesCellBuilder.buildNotesCell(for: tableView))
        
        let allSections = [firstSection, secondSection, thirdSection]
        
        return allSections
    }
}
