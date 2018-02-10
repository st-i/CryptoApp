//
//  PortfolioGraphDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by Иван Стефанов on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kStandardCellHeight = 50

class PortfolioGraphDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var arrayWithCells = [Any]()

    //MARK: dataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return arrayWithCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayWithCells[section] as! [PortfolioCurrencyGraphCell]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (arrayWithCells[indexPath.section] as! [PortfolioCurrencyGraphCell])[indexPath.row]
    }
    
    //MARK: delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(kStandardCellHeight)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        headerView.backgroundColor = UIColor.white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        footerView.backgroundColor = UIColor.white
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
