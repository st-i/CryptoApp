//
//  PurchaseSumCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 29.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kPurchaseSumCellIdentifier = "PurchaseSumCell"

class PurchaseSumCellBuilder: NSObject {
    
    class func buildPurchaseSumCell(for tableView: UITableView, delegate: UIViewController) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPurchaseSumCellIdentifier) as! PurchaseSumCell
        cell.selectionStyle = .none
        cell.purchaseSumTextField.delegate = delegate as? UITextFieldDelegate
        
        return cell
    }
}
