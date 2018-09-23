//
//  ObservedCurrenciesDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by st.i on 30.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kCryptoCurrenciesCapitalizationCellHeight = 64
private let kObservedPositionCellHeight = 62
private let kFinalCellHeight = 26
private let kHeightForSectionHeader = 30

class ObservedCurrenciesDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var cmcInfoModel: CMCInfoModel!
    var observedCoinsArray = [Coin]()
    var noCoins = false
    var viewController = ObservedCurrenciesViewController()
    
    //MARK: DataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else{
            if noCoins {
                return 1
            }else{
                return observedCoinsArray.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            return CryptoCurrenciesCapitalizationCellBuilder.buildCryptoCurrenciesCapitalizationCell(tableView, cmcInfoModel: cmcInfoModel)
        }else{
            if noCoins {
                return NoDataCellBuilder.buildCell(tableView, textType: .observedCoins)
            }else{
                return ObservedPositionCellBuilder.buildCell(tableView, coin: observedCoinsArray[indexPath.row])
            }
        }
    }
    
    //MARK: Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return CGFloat(kCryptoCurrenciesCapitalizationCellHeight)
        }else{
            return CGFloat(kObservedPositionCellHeight)
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
            
            var exchangeRateText = "Курс"
            if noCoins {
                exchangeRateText = ""
            }
            
            let headerViewRateLabel = UILabel.init(frame: CGRect(x: headerView.frame.width - 30 - 15, y: 5, width: 30, height: 20))
            headerViewRateLabel.textAlignment = .right
            headerViewRateLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            headerViewRateLabel.textColor = UIColor.gray
            headerViewRateLabel.text = exchangeRateText
            headerView.addSubview(headerViewRateLabel)
            
            return headerView
        }else{
            return nil
        }
    }
    
    //MARK: Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if indexPath.section == 0 {
            return false
        }else{
            if noCoins {
                return false
            }else{
                return true
            }
        }
    }
    
    //MARK: Deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let coinToDelete = observedCoinsArray[indexPath.row]
            observedCoinsArray.remove(at: indexPath.row)
            CoreDataManager.shared.deleteObservedUserCoinFromCoreData(coin: coinToDelete)
            
            if observedCoinsArray.count == 0 {
                noCoins = true
                viewController.navigationItem.leftBarButtonItem = nil
            }else{
                noCoins = false
            }
            CoinsOrderManager.updateCoinsOrder(coinsType: .Observed, disorderedCoins: observedCoinsArray)
            observedCoinsArray = CoinsOrderManager.orderCoins(coinsType: .Observed, disorderedCoins: observedCoinsArray)
            viewController.allObservedCoins = observedCoinsArray
            
            if self.noCoins {
                tableView.reloadData()
            }else{
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .bottom)
                tableView.endUpdates()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
    
    //MARK: Rows Moving
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        if indexPath.section == 0 {
            return false
        }else{
            if noCoins {
                return false
            }else{
                return true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let coinToMove = observedCoinsArray[sourceIndexPath.row]
        observedCoinsArray.remove(at: sourceIndexPath.row)
        observedCoinsArray.insert(coinToMove, at: destinationIndexPath.row)
        
        CoinsOrderManager.updateCoinsOrder(coinsType: .Observed, disorderedCoins: observedCoinsArray)
    }

    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return IndexPath.init(row: 0, section: sourceIndexPath.section)
        }else{
            return proposedDestinationIndexPath
        }
    }
}
