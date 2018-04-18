//
//  TrackedCurrenciesDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by st.i on 18.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kTotalPortfolioCostCellHeight = 173 //143
private let kTrackedPositionCellHeight = 58
private let kFinalCellHeight = 26
private let kHeightForSectionHeader = 30

class TrackedCurrenciesDataSourceAndDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var arrayWithCells = NSMutableArray() as! [[UITableViewCell]]
    var coins = [Coin]()
    var viewController = UIViewController()
    var portfolioModel = PortfolioModel()
    
    var showInDollars = true
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(kTotalPortfolioCostCellHeight)
        }else{
            return CGFloat(kTrackedPositionCellHeight)
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
            
            let headerViewRateLabel = UILabel.init(frame: CGRect(x: headerView.frame.width - 90 - 15, y: 5, width: 90, height: 20))
            //            headerViewRateLabel.backgroundColor = UIColor.black
            headerViewRateLabel.textAlignment = .right
            headerViewRateLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            headerViewRateLabel.textColor = UIColor.gray
            headerViewRateLabel.text = "Курс"
            headerView.addSubview(headerViewRateLabel)
            
            let headerViewValueLabel = UILabel.init(frame: CGRect(x: headerView.frame.width - 90 - 15 - 22 - 118, y: 5, width: 118, height: 20))
            headerViewValueLabel.textAlignment = .right
            headerViewValueLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            headerViewValueLabel.textColor = UIColor.gray
            headerViewValueLabel.text = "Стоимость"
            headerView.addSubview(headerViewValueLabel)
            
            return headerView
        }else{
            return nil
        }
    }
    
    
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        if section == 1 {
    //            return 0.5
    //        }else{
    //            return CGFloat.leastNormalMagnitude
    //        }
    //    }
    
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        if section == 1 {
    //            let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.5))
    //            footerView.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
    //            return footerView
    //        }else{
    //            return nil
    //        }
    //    }
    
    //    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
    //        if sourceIndexPath.section != proposedDestinationIndexPath.section {
    //            return IndexPath.init(row: 0, section: sourceIndexPath.section)
    //        }else{
    //            return proposedDestinationIndexPath
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let firstCell = tableView.cellForRow(at: indexPath) as! TotalPortfolioCostCell
            
            var currentValue: String = ""
            var initialValue: String = ""
            var profitOrLoss: String = ""
            var last24hValueChange: String = ""
            
            if showInDollars == false {
                currentValue = portfolioModel.currentRubleValue
                initialValue = portfolioModel.initialRubleValue
                profitOrLoss = portfolioModel.rubleProfitOrLoss
                last24hValueChange = portfolioModel.last24hValueRubleChange
                showInDollars = true
            }else{
                currentValue = portfolioModel.currentDollarValue
                initialValue = portfolioModel.initialDollarValue
                profitOrLoss = portfolioModel.dollarProfitOrLoss
                last24hValueChange = portfolioModel.last24hValueDollarChange
                showInDollars = false
            }
            
            firstCell.totalPortfolioValueLabel.text = currentValue
            firstCell.initialPortfolioCostLabel.text = initialValue
            firstCell.portfolioProfitOrLossLabel.text = profitOrLoss
            firstCell.portfolioProfitOrLoss24hLabel.text = last24hValueChange
        }else if indexPath.section == 1 {
            let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
            let trackedCurrencyVC = storyboard.instantiateViewController(withIdentifier: "TrackedCurrencyViewController") as! TrackedCurrencyViewController
            trackedCurrencyVC.currentCoin = coins[indexPath.row]
            viewController.navigationController?.pushViewController(trackedCurrencyVC, animated: true)
        }
    }
    
    //DataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return coins.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return TotalPortfolioCostCellBuilder.buildTotalPortfolioCostCell(tableView, portfolioModel: portfolioModel, showInDollars: showInDollars)
        case 1:
            return TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView, coin: coins[indexPath.row])
        default:
            return TotalPortfolioCostCellBuilder.buildTotalPortfolioCostCell(tableView, portfolioModel: portfolioModel, showInDollars: showInDollars)
        }
    }
    
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        if indexPath.section == 0 {
    //            return false
    //        }else{
    //            return true
    //        }
    //    }
    //
    //    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    //        if indexPath.section == 0 {
    //            return false
    //        }else{
    //            return true
    //        }
    //    }
    
    //    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //        let movedCell = arrayWithCells[1][sourceIndexPath.row]
    //        arrayWithCells[1].remove(at: sourceIndexPath.row)
    //        arrayWithCells[1].insert(movedCell, at: destinationIndexPath.row)
    //    }
    //
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            arrayWithCells[1].remove(at: indexPath.row)
    //
    //            tableView.beginUpdates()
    //            tableView.deleteRows(at: [indexPath], with: .bottom)
    //            tableView.endUpdates()
    //        }
    //    }
}
