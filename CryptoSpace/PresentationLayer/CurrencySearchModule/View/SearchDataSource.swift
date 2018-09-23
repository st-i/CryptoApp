//
//  SearchDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 20.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UITableViewDataSource {
    
    var allCoinsArray = [Coin]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if allCoinsArray.count > 0 {
            return allCoinsArray.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if allCoinsArray.count > 0 {
            return CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(coin: allCoinsArray[indexPath.row], tableView: tableView)
        }else{
            return NoDataCellBuilder.buildCell(tableView, textType: .searchingResults)
        }
    }
}
