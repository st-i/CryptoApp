//
//  TrackedCurrencyDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

//private let kTrackedCurrencyCellHeight = 700
private let kCommonCoinInfoCellHeight = 224
private let kCoinPurchaseWONoteCellIdentifier = 152
private let kCoinPurchaseWithNoteCellIdentifier = 235
private let kHeightForSectionHeader = 30
private let kHeightForSectionFooter = 0.5

class TrackedCurrencyDelegate: NSObject, UITableViewDelegate {
    
    var modelsArray = [Any]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(kCommonCoinInfoCellHeight)
        }else{
            let purchaseInfoModel = modelsArray[indexPath.section] as! TrackedCoinPurchaseInfoModel
            if purchaseInfoModel.note.count > 0 {
                return CGFloat(kCoinPurchaseWithNoteCellIdentifier)
            }else{
                return CGFloat(kCoinPurchaseWONoteCellIdentifier)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return CGFloat(kHeightForSectionHeader)
        }else{
            return CGFloat.leastNormalMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width), height: kHeightForSectionHeader))
            headerView.backgroundColor = UIColor.white
            
            let upperSeparator = UIView.init(frame: CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: 0.5))
            upperSeparator.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
            headerView.addSubview(upperSeparator)
            
            let headerViewPurchasesLabel = UILabel.init(frame: CGRect(x: 15, y: 5, width: 90, height: 20))
            headerViewPurchasesLabel.textAlignment = .left
            headerViewPurchasesLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            headerViewPurchasesLabel.textColor = UIColor.gray
            headerViewPurchasesLabel.text = "Покупки"
            headerView.addSubview(headerViewPurchasesLabel)
            
            return headerView
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section > 0 {
            return CGFloat(kHeightForSectionFooter)
        }else{
            return CGFloat.leastNormalMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section > 0 {
            let footerView = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: Double(tableView.frame.width), height: kHeightForSectionFooter))
            footerView.backgroundColor = UIColor.white
            
            var separatorX = 15.0
            var separatorWidth = Double(tableView.frame.width) - 30.0
            if section == modelsArray.count - 1 {
                separatorX = 0.0
                separatorWidth = Double(tableView.frame.width)
            }
            
            let footerSeparator = UIView.init(frame: CGRect.init(x: separatorX, y: 0.0, width: separatorWidth, height: 0.5))
            footerSeparator.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
            footerView.addSubview(footerSeparator)
            
            return footerView
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
}
