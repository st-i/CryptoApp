//
//  CurrencyForPairCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 08.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyForPairCellIdentifier = "CurrencyForPairCell"

class CurrencyForPairCellBuilder: NSObject {
    
    class func buildCurrencyForPairCell(tableView: UITableView, imageName: String, leftText: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCurrencyForPairCellIdentifier) as! CurrencyForPairCell
        cell.selectionStyle = .none
        cell.currencyImageView.image = UIImage.init(named: imageName)
        cell.leftTextLabel.text = leftText
        
        return cell
    }
}
