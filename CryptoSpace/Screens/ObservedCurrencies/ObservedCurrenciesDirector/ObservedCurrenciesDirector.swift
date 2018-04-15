//
//  ObservedCurrenciesDirector.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedCurrenciesDirector: NSObject {

    class func createObservedCurrenciesCells(for tableView: UITableView) -> Array<Any> {
        let cryptoCurrenciesСapitalizationCellArray = NSMutableArray()
        let observedPositionCellsArray = NSMutableArray()
        
        //first section
//        cryptoCurrenciesСapitalizationCellArray.add(CryptoCurrenciesCapitalizationCellBuilder.buildCryptoCurrenciesCapitalizationCell(for: tableView))
        
        //second section
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
        observedPositionCellsArray.add(ObservedPositionCellBuilder.buildObservedPositionCell(for: tableView))
//        observedPositionCellsArray.add(FinalCellBuilder.buildFinalCell(for: tableView))
        
        let allSections = [cryptoCurrenciesСapitalizationCellArray, observedPositionCellsArray]
        
        return allSections
    }
}
