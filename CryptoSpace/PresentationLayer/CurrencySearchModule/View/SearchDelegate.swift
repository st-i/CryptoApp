//
//  SearchDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 20.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kCurrencyForSearchCellHeight = 50
private let kHeightForSectionHeader = 30

class SearchDelegate: NSObject, UITableViewDelegate {
    
    var allCoinsArray = [Coin]()
    var fromVC = CurrencySearchViewController()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(kCurrencyForSearchCellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if allCoinsArray.count > 0 {
            let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
            let addCurrencyVC = storyboard.instantiateViewController(withIdentifier: "AddCurrencyViewController") as! AddCurrencyViewController
            addCurrencyVC.coinType = fromVC.coinType
            addCurrencyVC.currentCoin = allCoinsArray[indexPath.row]
            self.fromVC.navigationController?.pushViewController(addCurrencyVC, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if fromVC.currencySearchBar.isFirstResponder {
            fromVC.currencySearchBar.resignFirstResponder()
        }
    }
}
