//
//  RecentCurrencySearchDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 23.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyForSearchCellHeight = 50
private let kHeightForSectionHeader = 30

class RecentCurrencySearchDelegate: NSObject, UITableViewDelegate {
        
    var fromVC = CurrencySearchViewController()
    
    var arrayWithCells = [Any]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = (arrayWithCells[indexPath.section] as! NSMutableArray)[indexPath.row] as! UITableViewCell
        if cell.isKind(of: CurrencyForSearchCell.self) {
            return CGFloat(kCurrencyForSearchCellHeight)
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(kHeightForSectionHeader)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width), height: kHeightForSectionHeader))
        headerView.backgroundColor = UIColor.white
        
        let headerViewLabel = UILabel.init(frame: CGRect(x: 15, y: 5, width: 90, height: 20))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath) as! CurrencyForSearchCell
        
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let addCurrencyVC = storyboard.instantiateViewController(withIdentifier: "AddCurrencyViewController") as! AddCurrencyViewController
        addCurrencyVC.currentCoin = cell.currentCoin
        addCurrencyVC.coinType = fromVC.coinType
        self.fromVC.navigationController?.pushViewController(addCurrencyVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        fromVC.view.endEditing(true)
    }
}
