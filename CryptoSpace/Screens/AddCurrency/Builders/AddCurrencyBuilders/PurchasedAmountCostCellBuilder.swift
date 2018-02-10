//
//  PurchasedAmountCostCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kPurchasedAmountCostCellIdentifier = "PurchasedAmountCostCell"

class PurchasedAmountCostCellBuilder: NSObject {
    
    class func buildPurchasedAmountCostCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPurchasedAmountCostCellIdentifier) as! PurchasedAmountCostCell
        cell.selectionStyle = .none
        
        return cell
    }
}
