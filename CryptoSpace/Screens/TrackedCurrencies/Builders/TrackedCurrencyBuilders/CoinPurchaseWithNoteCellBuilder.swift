//
//  CoinPurchaseWithNoteCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCoinPurchaseWithNoteCellIdentifier = "CoinPurchaseWithNoteCell"

class CoinPurchaseWithNoteCellBuilder: NSObject {
    
    class func buildCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCoinPurchaseWithNoteCellIdentifier) as! CoinPurchaseWithNoteCell
        cell.selectionStyle = .none
        return cell
    }
}
