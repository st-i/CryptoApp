//
//  ActionWithCurrencyDateCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kActionWithCurrencyDateCellIdentifier = "ActionWithCurrencyDateCell"

class ActionWithCurrencyDateCellBuilder: NSObject {
    
    class func buildActionWithCurrencyDateCell(for tableView: UITableView, date: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kActionWithCurrencyDateCellIdentifier) as! ActionWithCurrencyDateCell
        cell.purchaseDateLabel.text = date
        
        return cell
    }
}
