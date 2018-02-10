//
//  TrackedCurrenciesScreenDirector.swift
//  CryptoSpace
//
//  Created by iStef on 10.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrenciesScreenDirector: NSObject {
    
    class func createTrackedCurrenciesCells(for tableView: UITableView) -> Array<Any> {
        let totalPortfolioCostCellArray = NSMutableArray()
        let trackedPositionCellsArray = NSMutableArray()

        //first section
        totalPortfolioCostCellArray.add(TotalPortfolioCostCellBuilder.buildTotalPortfolioCostCell(for: tableView))
//        totalPortfolioCostCellArray.add(HeaderViewCellBulder.buildCell(for: tableView))
        
        //second section
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
        trackedPositionCellsArray.add(TrackedPositionCellBuilder.buildTrackedPositionCell(for: tableView))
//        trackedPositionCellsArray.add(FinalCellBuilder.buildFinalCell(for: tableView))
        
        let allSections = [totalPortfolioCostCellArray, trackedPositionCellsArray]
        
        return allSections
    }

}
