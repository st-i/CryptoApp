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
//    var currencySearchBar = UISearchBar()
    
    var recentCurrencySearchDataSource: RecentCurrencySearchDataSource!
    var recentCurrencySearchDelegate:RecentCurrencySearchDelegate!
    
    var searchDataSource:SearchDataSource!
    var searchDelegate:SearchDelegate!
    
    var topSixCoins = [Coin]()
    var allUntouchableCoins = [Coin]()
    var searchedCoins = [Coin]()
    
    var coinType: CoinType?
    
//    var isPresentedVC: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
//        self.specifyTableViewHeader()
//        if isPresentedVC {
//            navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "X", style: .plain, target: self, action: #selector(dismissVC))
//        }
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "X", style: .plain, target: self, action: #selector(dismissVC))
//        UIBarButtonItem.init(image: UIImage.init(named: "x1"), style: .plain, target: self, action: #selector(dismissVC))
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
        
//        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        let titleViewLabel = UILabel.init(frame: titleView.frame)
//        titleViewLabel.textAlignment = .center
//        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFontWeightMedium)
//        titleViewLabel.textColor = UIColor.white
//        titleViewLabel.text = "Поиск"
//        titleView.addSubview(titleViewLabel)
//        self.navigationItem.titleView = titleView
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
//        let searchBar = UISearchBar()
//        searchBar.placeholder = "Поиск"
        
//        currencySearchBar.showsCancelButton = false
        currencySearchBar.delegate = self
        currencySearchBar.returnKeyType = .done
//        searchBar.backgroundColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
//        currencySearchBar = searchBar
//        currencySearchBar.setValue("Отмена", forKey:"_cancelButtonText")
//        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)
//        navigationItem.titleView = currencySearchBar
        
        tableView.backgroundColor = UIColor.white //groupTableViewBackground
//        self.searchBar.searchBarStyle = .minimal
//        self.searchBar.backgroundColor = UIColor.groupTableViewBackground
        
        allUntouchableCoins = AllCoinsManager.createArrayWithAllCoins()
        searchedCoins = allUntouchableCoins
        showCoins()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        currencySearchBar.resignFirstResponder()
//        currencySearchBar.showsCancelButton = false
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        currencySearchBar.showsCancelButton = false
//        self.showRecentAndPopularResults()
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
        
//        tableView.tableHeaderView = nil
        
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
//        self.specifyTableViewHeader()
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
    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
////        currencySearchBar.text = ""
////        currencySearchBar.resignFirstResponder()
////        searchBar.showsCancelButton = false
////        showRecentAndPopularResults()
//        cancelSearchBar()
//    }
    
//    public func cancelSearchBar () {
//        currencySearchBar.text = ""
//        currencySearchBar.resignFirstResponder()
//        currencySearchBar.showsCancelButton = false
//        showRecentAndPopularResults()
//    }
    
//    func specifyTableViewHeader() {
//        let tableViewHeaderView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 40))
//        tableViewHeaderView.backgroundColor = UIColor.white
//
//        let currencyImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        currencyImageView.image = UIImage(named:"Bitcoin")
//
//        var currenciesImagesArray = Array<UIImageView>()
//
//        var pointX = 6
//        var pointY = 8
//        for i in 2..<13 {
//
//            pointX += 24
//
//            if i%2 == 0 {
//                pointY = 12
//            }else{
//                pointY = 8
//            }
//
//            let currencyImageView = UIImageView.init(frame: CGRect(x: pointX, y: pointY, width: 20, height: 20))
//            let currencyImageName: String
//
//            switch i {
//            case 2:
//                currencyImageName = "Bitcoin"
//            case 3:
//                currencyImageName = "ethereum"
//            case 4:
//                currencyImageName = "bitcoin-cash"
//            case 5:
//                currencyImageName = "ripple"
//            case 6:
//                currencyImageName = "litecoin"
//            case 7:
//                currencyImageName = "iota"
//            case 8:
//                currencyImageName = "cardano"
//            case 9:
//                currencyImageName = "dash"
//            case 10:
//                currencyImageName = "nem"
//            case 11:
//                currencyImageName = "monero"
//            case 12:
//                currencyImageName = "bitcoin-gold"
//            default:
//                currencyImageName = "Bitcoin"
//            }
//            currencyImageView.image = UIImage(named:currencyImageName)
//            currenciesImagesArray.append(currencyImageView)
//            tableViewHeaderView.addSubview(currencyImageView)
//        }
//
//        UIView.animate(withDuration:2.0, delay: 0.0,
//                       options: [.curveEaseInOut, .autoreverse, .repeat],
//                       animations: {
//                        for imageView: UIImageView in currenciesImagesArray {
//                            if currenciesImagesArray.index(of: imageView)! % 2 == 0 {
//                                imageView.frame.origin.y = 8
//                            }else{
//                                imageView.frame.origin.y = 12
//                            }
//                        }
//        },
//                       completion: nil)
//        self.tableView.tableHeaderView = tableViewHeaderView
//    }
}
