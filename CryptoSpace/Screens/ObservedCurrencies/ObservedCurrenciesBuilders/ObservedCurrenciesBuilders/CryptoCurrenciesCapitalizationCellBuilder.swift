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
    
    class func buildCryptoCurrenciesCapitalizationCell(_ tableView: UITableView, cmcInfoModel: CMCInfoModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCapitalizationCellIdentifier) as! CryptoCurrenciesCapitalizationCell
        cell.selectionStyle = .none
        cell.cmcLabel.text = cmcInfoModel.marketCap
        return cell
    }

}
