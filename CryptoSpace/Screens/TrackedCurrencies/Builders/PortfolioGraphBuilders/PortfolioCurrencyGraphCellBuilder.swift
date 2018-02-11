//
//  PortfolioCurrencyGraphCellBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kPortfolioCurrencyGraphCellIdentifier = "PortfolioCurrencyGraphCell"
private let columnHeight: CGFloat = 40
private let labelHeight: CGFloat = 30

class PortfolioCurrencyGraphCellBuilder: NSObject {
    
    class func buildCell(tableView: UITableView, leftText: String, rightText: String, columnWidth: CGFloat, columnColor: UIColor) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPortfolioCurrencyGraphCellIdentifier) as! PortfolioCurrencyGraphCell
        cell.selectionStyle = .none
        
        let currencyColumn = UIView.init(frame: CGRect.init(x: 15, y: (cell.contentView.frame.maxY - columnHeight) / 2, width: 0, height: columnHeight))
        currencyColumn.backgroundColor = columnColor
        currencyColumn.layer.cornerRadius = 4
        cell.currencyColumnView = currencyColumn
        cell.currencyColumnWidth = columnWidth
        cell.contentView.addSubview(cell.currencyColumnView)
        
        let labelsContainerView = UIView.init(frame: CGRect.init(x: 15, y: (cell.contentView.frame.maxY - columnHeight) / 2, width: cell.contentView.frame.width - 30, height: columnHeight))
        labelsContainerView.backgroundColor = UIColor.clear
        cell.contentView.addSubview(labelsContainerView)
        
        let leftTextLabel = UILabel.init(frame: CGRect.init(x: 3, y: (labelsContainerView.frame.height - labelHeight) / 2, width: labelsContainerView.frame.width - 153.0, height: labelHeight))
        leftTextLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        leftTextLabel.text = leftText
//        leftTextLabel.backgroundColor = UIColor.red
        labelsContainerView.addSubview(leftTextLabel)
        
        let rightTextLabel = UILabel.init(frame: CGRect.init(x: labelsContainerView.frame.width - 148, y: (labelsContainerView.frame.height - labelHeight) / 2, width: 145.0, height: labelHeight))
        rightTextLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        rightTextLabel.text = rightText
        rightTextLabel.textAlignment = .right
//        rightTextLabel.backgroundColor = UIColor.white
        labelsContainerView.addSubview(rightTextLabel)

        return cell
    }
}
