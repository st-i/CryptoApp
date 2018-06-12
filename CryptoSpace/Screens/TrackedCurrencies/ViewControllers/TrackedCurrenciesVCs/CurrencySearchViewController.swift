//
//  CurrencySearchViewController.swift
//  CryptoSpace
//
//  Created by iStef on 20.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class CurrencySearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var currencySearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var recentCurrencySearchDataSource: RecentCurrencySearchDataSource!
    var recentCurrencySearchDelegate:RecentCurrencySearchDelegate!
    
    var searchDataSource:SearchDataSource!
    var searchDelegate:SearchDelegate!
    
    var topSixCoins = [Coin]()
    var allUntouchableCoins = [Coin]()
    var searchedCoins = [Coin]()
    
    var coinType: CoinType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "CloseCross"), style: .plain, target: self, action: #selector(dismissVC))
        navigationController?.navigationBar.isTranslucent = false;
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Поиск"
        titleView.addSubview(titleViewLabel)
        navigationItem.titleView = titleView
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)

        currencySearchBar.delegate = self
        currencySearchBar.returnKeyType = .done
        
        tableView.backgroundColor = UIColor.white
        
        allUntouchableCoins = AllCoinsManager.createArrayWithAllCoins()
        searchedCoins = allUntouchableCoins
        showCoins()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        currencySearchBar.resignFirstResponder()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func showRecentAndPopularResults() {
        recentCurrencySearchDataSource = RecentCurrencySearchDataSource()
        recentCurrencySearchDelegate = RecentCurrencySearchDelegate()
        
        tableView.dataSource = recentCurrencySearchDataSource
        tableView.delegate = recentCurrencySearchDelegate
        
        let arrayWithCells = CurrencyForSearchScreenDirector.createCurrencyForSearchCells(for: tableView)

        recentCurrencySearchDataSource.arrayWithCells = arrayWithCells
        recentCurrencySearchDelegate.arrayWithCells = arrayWithCells
        recentCurrencySearchDelegate.fromVC = self
        
        tableView.reloadData()
    }
    
    func showCoins() {
        searchDataSource = SearchDataSource()
        searchDelegate = SearchDelegate()
        
        searchDelegate.allCoinsArray = searchedCoins
        searchDataSource.allCoinsArray = searchedCoins
        
        tableView.dataSource = searchDataSource
        tableView.delegate = searchDelegate
        
        searchDelegate.fromVC = self
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        currencySearchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: false)
        currencySearchBar.becomeFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            var coinsForSearchTextArray = [Coin]()
            for someCoin in allUntouchableCoins {
                if someCoin.fullName.lowercased().contains(searchText.lowercased()) ||
                    someCoin.shortName.lowercased().contains(searchText.lowercased()) {
                    coinsForSearchTextArray.append(someCoin)
                }
            }
            searchedCoins = coinsForSearchTextArray
        }else{
            searchedCoins = allUntouchableCoins
        }
        showCoins()
    }
}
