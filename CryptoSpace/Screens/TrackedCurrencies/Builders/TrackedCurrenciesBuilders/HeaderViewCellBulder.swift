//
//  HeaderViewCellBulder.swift
//  CryptoSpace
//
//  Created by st.i on 04.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kHeaderViewCellIdentifier = "HeaderViewCell"

class HeaderViewCellBulder: NSObject {
    
    class func buildCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kHeaderViewCellIdentifier) as! HeaderViewCell
        cell.selectionStyle = .none
        return cell
    }
}
