//
//  PortfolioGraphScreenDirector.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class PortfolioGraphScreenDirector: NSObject {
    class func createCells(for tableView: UITableView) -> [[PortfolioCurrencyGraphCell]] {
        let firstSection = NSMutableArray()
        
        //first section
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Etherium Classic", rightText: "$133 350", columnWidth: 270, columnColor: UIColor.orange))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Bitcoin", rightText: "$123 350", columnWidth: 240, columnColor: UIColor.green))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Bitcoin Cash", rightText: "$99 350", columnWidth: 230, columnColor: UIColor.purple))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Bitcoin Gold", rightText: "$88 350", columnWidth: 190, columnColor: UIColor.cyan))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Dash", rightText: "$59 550", columnWidth: 180, columnColor: UIColor.yellow))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Dash", rightText: "$59 550", columnWidth: 140, columnColor: UIColor.blue))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Dash", rightText: "$59 550", columnWidth: 110, columnColor: UIColor.brown))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Dash", rightText: "$59 550", columnWidth: 95, columnColor: UIColor.magenta))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Dash", rightText: "$59 550", columnWidth: 80, columnColor: UIColor.red))
        firstSection.add(PortfolioCurrencyGraphCellBuilder.buildCell(tableView: tableView, leftText: "Dash", rightText: "$59 550", columnWidth: 50, columnColor: UIColor.gray))
        
        let allSections = [firstSection]
        
        return allSections as! [[PortfolioCurrencyGraphCell]]
    }
}
