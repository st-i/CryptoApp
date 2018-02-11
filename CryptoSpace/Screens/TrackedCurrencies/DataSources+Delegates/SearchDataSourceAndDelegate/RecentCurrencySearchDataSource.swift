//
//  RecentCurrencySearchDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 23.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class RecentCurrencySearchDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(for: tableView)
    }
}