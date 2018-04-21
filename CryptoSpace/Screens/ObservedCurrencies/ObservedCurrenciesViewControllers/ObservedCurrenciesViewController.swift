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
    var observedCurrenciesDataSource:ObservedCurrenciesDataSource!
    var observedCurrenciesDelegate:ObservedCurrenciesDelegate!
    
    var originalEditButton: UIBarButtonItem!
    var originalDoneButton: UIBarButtonItem!
    
    var requestManager: RequestManager!
    
    var cmcInfoModel: CMCInfoModel!
    var observedCoinsArray = [Coin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Криптовалюты"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
        originalEditButton = UIBarButtonItem.init(title: "Изм.", style: .plain, target: self, action: #selector(editObservedCurrenciesAction))
        originalDoneButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(editObservedCurrenciesAction))
        self.navigationItem.rightBarButtonItem = originalEditButton
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
//        self.navigationItem.rightBarButtonItem =
//            UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editObservedCurrenciesAction))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addCoinAction))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshScreenValues)) // sendRequestForTest updateCoinMarketCap
        navigationItem.leftBarButtonItem = refreshButton
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        requestManager = RequestManager()
        
        self.cmcInfoModel = CMCInfoModel()
        fillTableViewWithData()
        
        let marketCapValue = CoreDataManager.shared.getCoinMarketCap()
        if marketCapValue == 0 {
            getMarketCapValue(completion: { (value) in
                CoreDataManager.shared.saveCoinMarketCap(value: value)
                self.cmcInfoModel.marketCap = self.createCoinMaketCapString(value: value)
                self.tableView.reloadData()
            })
        }else{
            cmcInfoModel.marketCap = createCoinMaketCapString(value: marketCapValue)
            tableView.reloadData()
        }
    }
    
    func fillTableViewWithData() {

        tableView.backgroundColor = UIColor.white //UIColor.groupTableViewBackground
        observedCurrenciesDataSource = ObservedCurrenciesDataSource()
        observedCurrenciesDelegate = ObservedCurrenciesDelegate()
        
        tableView.dataSource = observedCurrenciesDataSource
        tableView.delegate = observedCurrenciesDelegate
        
        observedCoinsArray = CoreDataManager.shared.getObservedUserCoinsArray()
        
        observedCurrenciesDataSource.cmcInfoModel = cmcInfoModel
        observedCurrenciesDataSource.observedCoinsArray = observedCoinsArray
    }
    
    @objc func editObservedCurrenciesAction() {
        
        if isEditing {
            setEditing(false, animated: true)
            tableView.setEditing(false, animated: true)
            navigationItem.rightBarButtonItem = originalEditButton
        }else{
            setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
            navigationItem.rightBarButtonItem = originalDoneButton
        }
    }
    
    func addCoinAction() {
        
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController")
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc func refreshScreenValues() {
        
        requestManager.getCryptoMarketCap { (value) in
            CoreDataManager.shared.updateCoinMarketCap(value: value)
            self.cmcInfoModel.marketCap = self.createCoinMaketCapString(value: value)
            
            let coinsExchangesArray = CoinsArrayFormatter.createCoinsExchangesArray(coins: self.observedCoinsArray)
            self.requestManager.coinsExchanges.removeAll()
            self.requestManager.exchangesCounter = 0
            
            self.requestManager.coinsExchanges = coinsExchangesArray
            
            self.requestManager.updateCoinsRates(completion: { (newArray) in
                
                for coin in self.observedCoinsArray {
                    let updatedCoin = newArray[coin.exchange.rawValue][coin.shortName]
                    
                    let updatedCoinRate = (updatedCoin?.exchangeRate)!
                    coin.exchangeRate = updatedCoinRate
                    let coinRate24hPercentChange = (updatedCoin?.rate24hPercentChange)!
                    coin.rate24hPercentChange = coinRate24hPercentChange
                    
                    self.tableView.reloadData()
                }
                
                CoreDataManager.shared.updateObservedUserCoins(observedCoins: self.observedCoinsArray)
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
