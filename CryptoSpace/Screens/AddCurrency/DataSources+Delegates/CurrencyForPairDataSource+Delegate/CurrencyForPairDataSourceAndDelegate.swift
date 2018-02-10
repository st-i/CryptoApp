//
//  CurrencyForPairDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by Иван Стефанов on 08.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyForPairCellHeight = 50

class CurrencyForPairDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewController = CurrencyForPairViewController()
    
    var arrayWithCells = [Any]()
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return CurrencyForPairCellBuilder.buildCurrencyForPairCell(tableView: tableView, imageName: "", leftText: "")
            
        case 1:
            return CurrencyForPairCellBuilder.buildCurrencyForPairCell(tableView: tableView, imageName: "", leftText: "")
            
        case 2:
            return CurrencyForPairCellBuilder.buildCurrencyForPairCell(tableView: tableView, imageName: "", leftText: "")
            
        case 3:
            return CurrencyForPairCellBuilder.buildCurrencyForPairCell(tableView: tableView, imageName: "", leftText: "")
            
        case 4:
            return CurrencyForPairCellBuilder.buildCurrencyForPairCell(tableView: tableView, imageName: "", leftText: "")
        default:
            return CurrencyForPairCellBuilder.buildCurrencyForPairCell(tableView: tableView, imageName: "", leftText: "")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = (arrayWithCells[indexPath.section] as! NSMutableArray)[indexPath.row] as! UITableViewCell
        if cell.isKind(of: CurrencyForSearchCell.self) {
            return CGFloat(kCurrencyForPairCellHeight)
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(kCurrencyForPairCellHeight)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width), height: kCurrencyForPairCellHeight))
        headerView.backgroundColor = UIColor.groupTableViewBackground
        
        let headerViewLabel = UILabel.init(frame: CGRect(x: 15, y: 0, width: 90, height: kCurrencyForPairCellHeight))
        //            headerViewRateLabel.backgroundColor = UIColor.black
        headerViewLabel.textAlignment = .left
        headerViewLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        headerViewLabel.textColor = UIColor.gray
        
        let titleText: String
        if section == 0 {
            titleText = "Недавние"
        }else{
            titleText = "Популярные"
        }
        
        headerViewLabel.text = titleText
        headerView.addSubview(headerViewLabel)
        
        return headerView
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
//        let addCurrencyVC = storyboard.instantiateViewController(withIdentifier: "AddCurrencyViewController")
//        self.fromVC.navigationController?.pushViewController(addCurrencyVC, animated: true)
//    }
}
