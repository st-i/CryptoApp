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
        return allCoinsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let triggersCoin = Coin.init()
//        triggersCoin.fullName = "Triggers"
//        triggersCoin.shortName = "TRIG"
        
        return CurrencyForSearchCellBuilder.buildCurrencyForSearchCell(coin: allCoinsArray[indexPath.row], tableView: tableView)
    }
}
