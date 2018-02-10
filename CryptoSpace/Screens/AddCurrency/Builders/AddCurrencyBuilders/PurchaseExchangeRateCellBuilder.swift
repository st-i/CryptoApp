//
//  PurchaseExchangeRateCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kPurchaseExchangeRateCellIdentifier = "PurchaseExchangeRateCell"

class PurchaseExchangeRateCellBuilder: NSObject {
    
    class func buildPurchaseExchangeRateCell(for tableView: UITableView, delegate: UIViewController) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPurchaseExchangeRateCellIdentifier) as! PurchaseExchangeRateCell
        cell.selectionStyle = .none
        cell.purchaseExchangeRateTextField.delegate = delegate as? UITextFieldDelegate
        
        return cell
    }
}
