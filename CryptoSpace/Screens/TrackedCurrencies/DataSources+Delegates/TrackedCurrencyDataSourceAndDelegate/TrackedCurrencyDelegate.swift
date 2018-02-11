//
//  TrackedCurrencyDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kTrackedCurrencyCellHeight = 700

class TrackedCurrencyDelegate: NSObject, UITableViewDelegate {
    
    var arrayWithCells = [Any]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = (arrayWithCells[indexPath.section] as! NSMutableArray)[indexPath.row] as! UITableViewCell
        if cell.isKind(of: TrackedCurrencyCell.self) {
            return CGFloat(kTrackedCurrencyCellHeight)
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}