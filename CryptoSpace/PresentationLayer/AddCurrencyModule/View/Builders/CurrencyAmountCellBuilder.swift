//
//  CurrencyAmountCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyAmountCellIdentifier = "CurrencyAmountCell"

class CurrencyAmountCellBuilder: NSObject {
    
    class func buildCurrencyAmountCell(for tableView: UITableView, delegate: UIViewController) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCurrencyAmountCellIdentifier) as! CurrencyAmountCell
        cell.selectionStyle = .none
        cell.currencyAmountTextField.delegate = delegate as? UITextFieldDelegate
        
        return cell
    }
}
