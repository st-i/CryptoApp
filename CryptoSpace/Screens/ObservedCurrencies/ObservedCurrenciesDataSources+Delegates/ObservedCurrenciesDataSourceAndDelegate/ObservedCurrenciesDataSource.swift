//
//  ObservedCurrenciesDataSource.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedCurrenciesDataSource: NSObject, UITableViewDataSource {
    
//    var arrayWithCells = NSMutableArray() as! [[UITableViewCell]]
    var cmcInfoModel: CMCInfoModel!

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return CryptoCurrenciesCapitalizationCellBuilder.buildCryptoCurrenciesCapitalizationCell(tableView, cmcInfoModel: cmcInfoModel)
        }else{
            return ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView)
        }
    }

    //MARK: editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }else{
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }else{
            return true
        }
    }
    
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
