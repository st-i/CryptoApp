//
//  CryptoCurrenciesCapitalizationCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCapitalizationCellIdentifier = "CryptoCurrenciesCapitalizationCell"

class CryptoCurrenciesCapitalizationCellBuilder: NSObject {
    
    class func buildCryptoCurrenciesCapitalizationCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCapitalizationCellIdentifier) as! CryptoCurrenciesCapitalizationCell
        cell.selectionStyle = .none
        cell.capitalizationPercentagesChangesLabel.textColor = UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
        return cell
    }

}
