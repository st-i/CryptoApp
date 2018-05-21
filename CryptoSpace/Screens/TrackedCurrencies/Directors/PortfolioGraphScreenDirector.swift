//
//  PortfolioGraphScreenDirector.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class PortfolioGraphScreenDirector: NSObject {
    class func createCells(_ tableView: UITableView, displayModels: [GraphViewModel]) -> [PortfolioCurrencyGraphCell] {
        var arrayWithCells = [PortfolioCurrencyGraphCell]()
        
        for displayModel in displayModels {
            arrayWithCells.append(PortfolioCurrencyGraphCellBuilder.buildCell(tableView, graphViewModel: displayModel) as! PortfolioCurrencyGraphCell)
        }
        return arrayWithCells
    }
}
