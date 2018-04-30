//
//  IndicatorViewCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 22.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kIndicatorViewCellIdentifier = "IndicatorViewCell"

class IndicatorViewCellBuilder: NSObject {

    class func buildCell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIndicatorViewCellIdentifier) as! IndicatorViewCell
        cell.selectionStyle = .none
        cell.indicatorView.startAnimating()
        
        return cell
    }
}
