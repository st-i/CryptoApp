//
//  ObservedCurrencyDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 18.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedCurrencyDataSource: NSObject, UITableViewDataSource {
    
    var arrayWithCells = [Any]()
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return arrayWithCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayWithCells[section] as! NSMutableArray).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (arrayWithCells[indexPath.section] as! NSMutableArray)[indexPath.row] as! UITableViewCell
    }
}
