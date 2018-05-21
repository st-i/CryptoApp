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
private let imageViewHeight: CGFloat = 36

class PortfolioCurrencyGraphCellBuilder: NSObject {
    
    class func buildCell(_ tableView: UITableView, graphViewModel: GraphViewModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPortfolioCurrencyGraphCellIdentifier) as! PortfolioCurrencyGraphCell
        cell.selectionStyle = .none
        
        let currencyColumn = UIView.init(frame: CGRect.init(x: 15, y: (cell.contentView.frame.maxY - columnHeight) / 2, width: 0, height: columnHeight))
        currencyColumn.backgroundColor = UIColor.graphColumnsColor()
        currencyColumn.layer.cornerRadius = 4
        cell.currencyColumnView = currencyColumn
        let maxGraphWidth = UIScreen.main.bounds.width - 30 //tableView.frame.width - 30
        let graphColumnWidth = /*(cell.contentView.frame.width - 30)*/ maxGraphWidth * graphViewModel.columnWidthPart
        cell.currencyColumnWidth = graphColumnWidth < 1 ? 1 : graphColumnWidth
//        cell.currencyColumnWidth = (cell.contentView.frame.width - 30) * graphViewModel.columnWidthPart
        cell.contentView.addSubview(currencyColumn) // cell.currencyColumnView
        
        let labelsContainerView = UIView.init(frame: CGRect.init(x: 15, y: (cell.contentView.frame.maxY - columnHeight) / 2, width: maxGraphWidth, height: columnHeight))
        labelsContainerView.backgroundColor = UIColor.clear
        cell.contentView.addSubview(labelsContainerView)
        
        let coinImageView = UIImageView.init(frame: CGRect.init(x: 3, y: (labelsContainerView.frame.height - imageViewHeight) / 2, width: imageViewHeight, height: imageViewHeight))
        coinImageView.image = UIImage.init(named: graphViewModel.coinId)
        labelsContainerView.addSubview(coinImageView)
        
        let leftTextLabel = UILabel.init(frame: CGRect.init(x: 3 + imageViewHeight + 5, y: (labelsContainerView.frame.height - labelHeight) / 2, width: labelsContainerView.frame.width - 153.0, height: labelHeight))
        leftTextLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        leftTextLabel.text = graphViewModel.coinFullName
//        leftTextLabel.backgroundColor = UIColor.red
        labelsContainerView.addSubview(leftTextLabel)
        
        let rightTextLabel = UILabel.init(frame: CGRect.init(x: labelsContainerView.frame.width - 106, y: (labelsContainerView.frame.height - labelHeight) / 2, width: 103.0, height: labelHeight))
        rightTextLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        let nf = GlobalNumberFormatter.createNumberFormatter(number: graphViewModel.currentCoinValue)
        let coinValueString = nf.string(from: NSNumber.init(value: graphViewModel.currentCoinValue))!
        rightTextLabel.text = String(format: "$%@", coinValueString)
        rightTextLabel.textAlignment = .right
//        rightTextLabel.backgroundColor = UIColor.purple
        labelsContainerView.addSubview(rightTextLabel)

        return cell
    }
}
