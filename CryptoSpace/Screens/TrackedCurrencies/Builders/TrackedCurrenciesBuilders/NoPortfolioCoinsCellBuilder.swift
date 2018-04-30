//
//  NoPortfolioCoinsCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 25.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kNoPortfolioCoinsCellIdentifier = "NoPortfolioCoinsCell"

class NoPortfolioCoinsCellBuilder: NSObject {
    
    class func buildCell(_ tableView: UITableView, trackedCurrencies: Bool) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kNoPortfolioCoinsCellIdentifier) as! NoPortfolioCoinsCell
        cell.selectionStyle = .none
        if trackedCurrencies == false {
            cell.mainLabel.text = "Добавьте криптовалюты";
        }
        cell.mainLabel.textColor = UIColor.lightGray
        
        return cell
    }
}
