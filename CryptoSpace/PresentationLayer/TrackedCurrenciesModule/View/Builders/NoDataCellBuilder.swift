//
//  NoDataCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 30.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kNoDataCellIdentifier = "NoDataCell"

class NoDataCellBuilder: NSObject {
    
    class func buildCell(_ tableView: UITableView, textType: NoDataTextType) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kNoDataCellIdentifier) as! NoDataCell
        cell.selectionStyle = .none
        var mainLabelText: String?
        switch textType {
            case .trackedCoins:
                mainLabelText = "Добавьте криптовалюты в портфель"
                break
            case .observedCoins:
                mainLabelText = "Добавьте криптовалюты"
                break
            case .searchingResults:
                mainLabelText = "Поиск не дал результатов"
                break
        }
    
        cell.mainLabel.text = mainLabelText
        cell.mainLabel.textColor = UIColor.lightGray
        
        return cell
    }
}
