//
//  ObservedCurrenciesViewController.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedCurrenciesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var observedCurrenciesDataSourceAndDelegate:ObservedCurrenciesDataSourceAndDelegate!
    var indicatorViewDataSourceAndDelegate: IndicatorViewDataSourceAndDelegate!
    
    var originalEditButton: UIBarButtonItem!
    var originalDoneButton: UIBarButtonItem!
    var leftBarButtonItem: UIBarButtonItem?
    
    var requestManager: RequestManager!
    
    var cmcInfoModel: CMCInfoModel!
    var allObservedCoins = [Coin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false;
        navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Криптовалюты"
        titleView.addSubview(titleViewLabel)
        navigationItem.titleView = titleView
        
        originalEditButton = UIBarButtonItem.init(title: "Изм.", style: .plain, target: self, action: #selector(editObservedCurrenciesAction))
        originalDoneButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(editObservedCurrenciesAction))
        leftBarButtonItem = originalEditButton
        
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshMarketCapAndCurrenciesRates))
        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addObservedCurrency))

        navigationItem.rightBarButtonItems = [addButton, refreshButton]
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        requestManager = RequestManager()
        cmcInfoModel = CMCInfoModel()
        
        showIndicatorViewScreen()
        let marketCapValue = CoreDataManager.shared.getCoinMarketCap()
        
        let allSavedObservedCoins = CoreDataManager.shared.getObservedUserCoinsArray()
        allObservedCoins = allSavedObservedCoins

        if marketCapValue == 0 {
//            if есть интернет
            getMarketCapValue(completion: { (value) in
                CoreDataManager.shared.saveCoinMarketCap(value: value)
                self.cmcInfoModel.marketCap = self.createCoinMaketCapString(value: value)
                if allSavedObservedCoins.count == 0 {
                    self.fillTableViewWithData() //показываем ячейку "нет монет"
                    self.tableView.reloadData()
                }else{
                    self.refreshMarketCapAndCurrenciesRates() //такого не должно произойти
                }
            })
        }else{
            if allSavedObservedCoins.count > 0 {
                refreshMarketCapAndCurrenciesRates()
            }else{
                getMarketCapValue(completion: { (value) in
                    CoreDataManager.shared.updateCoinMarketCap(value: value)
                    self.cmcInfoModel.marketCap = self.createCoinMaketCapString(value: value)
                    self.fillTableViewWithData() //показываем ячейку "нет монет"
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let allSavedObservedCoins = CoreDataManager.shared.getObservedUserCoinsArray()
        if allSavedObservedCoins.count != allObservedCoins.count {
            allObservedCoins = allSavedObservedCoins
            fillTableViewWithData()
            tableView.reloadData()
        }
    }
    
    func showIndicatorViewScreen() {
        
        tableView.backgroundColor = UIColor.white
        indicatorViewDataSourceAndDelegate = IndicatorViewDataSourceAndDelegate()
        
        tableView.isScrollEnabled = false
        tableView.dataSource = indicatorViewDataSourceAndDelegate
        tableView.delegate = indicatorViewDataSourceAndDelegate
    }
    
    func fillTableViewWithData() {

        observedCurrenciesDataSourceAndDelegate = ObservedCurrenciesDataSourceAndDelegate()
    
        navigationItem.rightBarButtonItem?.isEnabled = true
        observedCurrenciesDataSourceAndDelegate.cmcInfoModel = cmcInfoModel
        if allObservedCoins.count == 0 {
            navigationItem.leftBarButtonItem = nil
            observedCurrenciesDataSourceAndDelegate.noCoins = true
        }else{
            navigationItem.leftBarButtonItem = leftBarButtonItem
            navigationItem.leftBarButtonItem?.isEnabled = true
            observedCurrenciesDataSourceAndDelegate.noCoins = false
            observedCurrenciesDataSourceAndDelegate.observedCoinsArray = allObservedCoins
        }
        observedCurrenciesDataSourceAndDelegate.viewController = self
        
        tableView.isScrollEnabled = true
        tableView.dataSource = observedCurrenciesDataSourceAndDelegate
        tableView.delegate = observedCurrenciesDataSourceAndDelegate
    }
    
    @objc func editObservedCurrenciesAction() {
        
        if isEditing {
            setEditing(false, animated: true)
            tableView.setEditing(false, animated: true)
            navigationItem.leftBarButtonItem = originalEditButton
            navigationItem.rightBarButtonItem?.isEnabled = true
        }else{
            setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
            navigationItem.leftBarButtonItem = originalDoneButton
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @objc func addObservedCurrency() {
        
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchCurrencyVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController") as! CurrencySearchViewController
        searchCurrencyVC.coinType = CoinType.Observed
        let navContr = UINavigationController.init(rootViewController: searchCurrencyVC)
        navigationController?.present(navContr, animated: true, completion: nil)
    }
    
    @objc func refreshMarketCapAndCurrenciesRates() {
        
        allObservedCoins = CoreDataManager.shared.getObservedUserCoinsArray()
        
        requestManager.getCryptoMarketCap { (value) in
            CoreDataManager.shared.updateCoinMarketCap(value: value)
            self.cmcInfoModel.marketCap = self.createCoinMaketCapString(value: value)
            
            let coinsExchangesArray = CoinsArrayFormatter.createCoinsExchangesArray(coins: self.allObservedCoins)
            self.requestManager.coinsExchanges.removeAll()
            self.requestManager.exchangesCounter = 0
            
            self.requestManager.coinsExchanges = coinsExchangesArray
            
            self.requestManager.updateCoinsRates(completion: { (newArray) in
                
                for coin in self.allObservedCoins {
                    let updatedCoin = newArray[coin.exchange.rawValue][coin.shortName]
                    
                    let updatedCoinRate = (updatedCoin?.exchangeRate)!
                    coin.exchangeRate = updatedCoinRate
                    let coinRate24hPercentChange = (updatedCoin?.rate24hPercentChange)!
                    coin.rate24hPercentChange = coinRate24hPercentChange
                }
                
                CoreDataManager.shared.updateObservedUserCoins(observedCoins: self.allObservedCoins)
                self.fillTableViewWithData()
                self.tableView.reloadData()
            })
        }
    }
    
    func createCoinMaketCapString(value: Int) -> String {
        
        let numberFormatter = GlobalNumberFormatter.createNumberFormatter(number: Double(value))
        numberFormatter.maximumFractionDigits = 0
        let cmcString = numberFormatter.string(from: NSNumber.init(value: value))!
        let marketCapString = String(format: "$%@", cmcString)
        return marketCapString
    }
    
    func getMarketCapValue(completion: @escaping (Int) -> ()) {
        
        requestManager.getCryptoMarketCap { (value) in
            completion(value)
        }
    }
    
    @objc func updateCoinMarketCap() {
        
        getMarketCapValue { (value) in
            CoreDataManager.shared.updateCoinMarketCap(value: value)
            self.cmcInfoModel.marketCap = self.createCoinMaketCapString(value: value)
            self.tableView.reloadData()
        }
    }
}
