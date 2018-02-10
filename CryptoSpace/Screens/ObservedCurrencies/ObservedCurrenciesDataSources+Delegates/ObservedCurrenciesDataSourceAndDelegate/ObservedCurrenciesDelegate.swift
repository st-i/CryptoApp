//
//  ObservedCurrenciesDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCryptoCurrenciesCapitalizationCellHeight = 115
private let kObservedPositionCellHeight = 62
private let kFinalCellHeight = 26
private let kHeightForSectionHeader = 30

class ObservedCurrenciesDelegate: NSObject, UITableViewDelegate {
    
    var arrayWithCells = NSMutableArray() as! [[UITableViewCell]]
    var viewController = UIViewController()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = arrayWithCells[indexPath.section][indexPath.row]
        if cell.isKind(of: CryptoCurrenciesCapitalizationCell.self) {
            return CGFloat(kCryptoCurrenciesCapitalizationCellHeight)
        }else if cell.isKind(of: ObservedPositionCell.self) {
            return CGFloat(kObservedPositionCellHeight)
        }else{
            return CGFloat(kFinalCellHeight)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return CGFloat(kHeightForSectionHeader)
        }else{
            return CGFloat.leastNormalMagnitude
        }
    }
    
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        if section == 2 {
    //            return 60
    //        }else{
    //            return CGFloat.leastNormalMagnitude
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
            let trackedCurrencyVC = storyboard.instantiateViewController(withIdentifier: "TrackedCurrencyViewController")
            viewController.navigationController?.pushViewController(trackedCurrencyVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width), height: kHeightForSectionHeader))
            headerView.backgroundColor = UIColor.white
            
            let upperSeparator = UIView.init(frame: CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: 0.5))
            upperSeparator.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
            headerView.addSubview(upperSeparator)
            
            let headerViewRateLabel = UILabel.init(frame: CGRect(x: headerView.frame.width - 86 - 15, y: 5, width: 86, height: 20))
            //            headerViewRateLabel.backgroundColor = UIColor.black
            headerViewRateLabel.textAlignment = .right
            headerViewRateLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            headerViewRateLabel.textColor = UIColor.gray
            headerViewRateLabel.text = "24 часа"
            headerView.addSubview(headerViewRateLabel)
            
            let headerViewValueLabel = UILabel.init(frame: CGRect(x: headerView.frame.width - 86 - 15 - 28 - 132, y: 5, width: 132, height: 20))
            headerViewValueLabel.textAlignment = .right
            headerViewValueLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            headerViewValueLabel.textColor = UIColor.gray
            headerViewValueLabel.text = "Курс"
            headerView.addSubview(headerViewValueLabel)
            
            return headerView
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return IndexPath.init(row: 0, section: sourceIndexPath.section)
        }else{
            return proposedDestinationIndexPath
        }
    }
    
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        if section == 2 {
    //            let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
    //            footerView.backgroundColor = UIColor.groupTableViewBackground
    //
    //            return footerView
    //        }else{
    //            return nil
    //        }
    //    }


}
