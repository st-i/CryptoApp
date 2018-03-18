//
//  CoinPurchaseWONoteCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCoinPurchaseWONoteCellIdentifier = "CoinPurchaseWONoteCell"

class CoinPurchaseWONoteCellBuilder: NSObject {
    
    class func buildCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCoinPurchaseWONoteCellIdentifier) as! CoinPurchaseWONoteCell
        cell.selectionStyle = .none
//        cell.lowerSeparator.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
        return cell
    }
}
