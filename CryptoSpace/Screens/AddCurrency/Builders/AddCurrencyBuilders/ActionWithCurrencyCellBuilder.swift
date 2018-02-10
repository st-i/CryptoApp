//
//  ActionWithCurrencyCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kActionWithCurrencyCellIdentifier = "ActionWithCurrencyCell"

class ActionWithCurrencyCellBuilder: NSObject {
    
    class func buildActionWithCurrencyCell(for tableView: UITableView, leftText: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kActionWithCurrencyCellIdentifier) as! ActionWithCurrencyCell
        cell.selectionStyle = .none
        cell.leftTextLabel.text = leftText
//        cell.backgroundColor = UIColor.blue
        
        return cell
    }
}
