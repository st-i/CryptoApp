//
//  TrackedCurrenciesViewController.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

//struct Coin {
//    //    var id: String
//    //    var fullName: String
//    var shortName: String
//    var exchangeRate: Double
//}

class TrackedCurrenciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var trackedCurrenciesDataSource:TrackedCurrenciesDataSource!
    var trackedCurrenciesDelegate:TrackedCurrenciesDelegate!

    var originalEditButton: UIBarButtonItem!
    var originalDoneButton: UIBarButtonItem!
    var someVC: UIViewController!
    
    var btcRate:Double = 0.0
    var userCoins = [Coin]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        request("https ://poloniex.com/public?command=returnTicker").responseJSON { (response) in
//            print(response)
//        }
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        //init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Портфель"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
//        originalEditButton = UIBarButtonItem.init(title: "Изм.", style: .plain, target: self, action: #selector(editPortfolioAction))
//        (barButtonSystemItem: .edit, target: self, action: #selector(editPortfolioAction))
        originalDoneButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(editPortfolioAction))
//        (barButtonSystemItem: .done, target: self, action: #selector(editPortfolioAction))
        self.navigationItem.leftBarButtonItem = originalEditButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addTrackedCurrency))
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshCurrenciesRates))
        navigationItem.leftBarButtonItem = refreshButton
        navigationItem.rightBarButtonItem = addButton
//        navigationItem.rightBarButtonItems = [addButton, refreshButton]
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        fillTableViewWithData()
        
//        request(RequestToBitfinexBuilder.buildBtcRateRequest()).responseJSON { (firstResponse) in
//            guard let dataArray = firstResponse.result.value as? [String: AnyObject] else{
//                print("Не могу перевести в JSON")
//                return
//            }
//            let btcRate = BitfinexResponseParser.getBtcRate(response: dataArray)
//            print(btcRate)
//
//            let allUserCoins = AllCoinsManager.createArrayWithAllCoins()
//
////            print(firstResponse)
//        }
    
//        request(RequestToBitfinexBuilder.buildEthRateRequest()).responseJSON { (firstResponse) in
//
//            guard let dataArray = firstResponse.result.value as? [String: AnyObject] else{
//                print("Не могу перевести в JSON")
//                return
//            }
//            let ethRate = BitfinexResponseParser.getEthRate(response: dataArray)
//            print(ethRate)
//
//            let allUserCoins = AllCoinsManager.createArrayWithAllCoins()
//
////            print(firstResponse)

//            request(RequestToIDEXBuilder.buildAllCoinsRequest(), method: .post, parameters: nil).responseJSON { (response) in
//                print(response)
//                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
//                    print("Не могу перевести в JSON")
//                    return
//                }
//                IDEXResponseParser.parseResponse(response: arrayOfData, coinsArray: allUserCoins, ethRate: ethRate)
//            }
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        loadExchangeRateForBTC()
//        fillTableViewWithData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
////        loadExchangeRateForBTC()
//    }
    
//    func loadExchangeRateForBTC() {//(completion: @escaping (String) -> Void) {
//        let coinId = "btc"
//        let coinRequestUrl = RequestToBitfinexBuilder.buildRequest(currencyId: coinId)
//        request(coinRequestUrl)
//            .responseJSON(completionHandler: { (response) in
//
//                switch response.result {
//                case .success(let value):
//                    print(value)
//                    guard let jsonDict = response.result.value as? [String: String] else { return }
//                    self.btcRate = jsonDict["mid"]!
////                    self.fillTableViewWithData()
//                    self.tableView.reloadData()
////                    completion(btcExchangeRate)
//
//                case .failure(let error):
//                    print(error)
////                    completion("")
////                    return
//                }
//
//
//            })
//    }
    
    func fetchAllTrackedCoins() {// -> [NSManagedObject] {
        userCoins = CoreDataManager.shared.getAndMapUserCoinsArrayToCoinsArray()
//        print(userCoins)
    }
    
    func fillTableViewWithData() {
//        let btcRate = loadExchangeRateForBTC()
        
        tableView.backgroundColor = UIColor.white
        trackedCurrenciesDataSource = TrackedCurrenciesDataSource()
        trackedCurrenciesDelegate = TrackedCurrenciesDelegate()
        
        tableView.dataSource = trackedCurrenciesDataSource
        tableView.delegate = trackedCurrenciesDelegate
        
//        let tempArrayWithCells = TrackedCurrenciesScreenDirector.createTrackedCurrenciesCells(for: self.tableView, btcRate: btcRate)
//        let arrayWithCells = NSMutableArray.init(array: tempArrayWithCells)
        
//        self.trackedCurrenciesDataSource.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
//        self.trackedCurrenciesDelegate.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
        createCoinsArray()
        trackedCurrenciesDataSource.coins = userCoins
        trackedCurrenciesDelegate.coins = userCoins
        trackedCurrenciesDelegate.viewController = self
    }
    
    @IBAction func openPortfolioGraph(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let portfolioGraphVC = storyboard.instantiateViewController(withIdentifier: "PortfolioGraphViewController")
        navigationController?.pushViewController(portfolioGraphVC, animated: true)
    }
    
    @objc func editPortfolioAction() {
        if isEditing {
            setEditing(false, animated: true)
            tableView.setEditing(false, animated: true)
            navigationItem.leftBarButtonItem = originalEditButton
        }else{
            setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
            navigationItem.leftBarButtonItem = originalDoneButton
        }
    }
    
    @objc func addTrackedCurrency() {
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchCurrencyVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController") as! CurrencySearchViewController
//        searchCurrencyVC.isPresentedVC = true
        let navContr = UINavigationController.init(rootViewController: searchCurrencyVC)
        navigationController?.present(navContr, animated: true, completion: nil)
        
//        someVC = UIViewController()
//        someVC.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
//        let navContr = UINavigationController.init(rootViewController: someVC)
//        present(navContr, animated: true, completion: nil)
    }
    
//    @objc func dismissVC() {
//        someVC.dismiss(animated: true, completion: nil)
//    }
    
//    func addCoinAction() {
//        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
//        let searchVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController")
//        self.navigationController?.pushViewController(searchVC, animated: true)
//    }
    
    @objc func refreshCurrenciesRates() {
        userCoins = CoreDataManager.shared.getAndMapUserCoinsArrayToCoinsArray()
        trackedCurrenciesDataSource.coins = userCoins
        trackedCurrenciesDelegate.coins = userCoins
        tableView.reloadData()
        
//        let requestManager = RequestManager.init()
//        requestManager.coinsArray = userCoins
//        requestManager.currentVC = self
//        requestManager.updateCoins()
        
//         fetchAllTrackedCoins()
        
//        requestManager.updateCoins /*(sendedCoinsArray: userCoins)*/ { (coinsRates) in
//            self.userCoins = UserCoinsManager.refreshValuesForCoins(coinsArray: self.userCoins, coinsRates: coinsRates)
//            self.refreshCoinsArray()
//        }
        
//        userCoins = UserCoinsManager.refreshValuesForCoins(coinsArray: userCoins, coinsRates: requestManager.coinsRates)
//        refreshCoinsArray()
//        requestManager.updateCoins(coinsArray: userCoins) { (coinsRates) in
//        
//            self.userCoins = UserCoinsManager.refreshValuesForCoins(coinsArray: self.userCoins, coinsRates: coinsRates)
//            self.refreshCoinsArray()
//        }
        //loadExchangeRateForBTC()
    }
    
    func loadExchangeRateForBTC() {//(completion: @escaping (String) -> Void) {
        let coinId = "btc"
        let coinRequestUrl = RequestToBitfinexBuilder.buildRequest(currencyId: coinId)
        request(coinRequestUrl)
            .responseJSON(completionHandler: { response in
                
                guard response.result.isSuccess else{
                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
                    return
                }
                
                guard let arrayOfData = response.result.value as? [String: AnyObject] else{
                    print("Не могу перевести в JSON")
                    return
                }
                
                self.btcRate = Double((arrayOfData["mid"] as? String)!)!
                print(arrayOfData)
                print(self.btcRate)
                self.refreshCoinsArray()
//                self.fillTableViewWithData()

//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
                
//                switch response.result {
//                case .success(let value):
//                    print(value)
//                    guard let jsonDict = response.result.value as? [String: String] else { return }
//                    self.btcRate = jsonDict["mid"]!
//                    self.tableView.reloadData()
//                    //completion(btcExchangeRate)
//
//                case .failure(let error):
//                    print(error)
//                    //completion("")
//                    //return
//                }
            })
    }
    
    func createCoinsArray() {// -> [Coin] {
//        userCoins = UserCoinsManager.fetchAllUserCoins()
        
        let allCoins = AllCoinsManager.createArrayWithAllCoins()
        for i in 0..<10 {
            userCoins.append(allCoins[i])
        }
        
        //second section
//        let btcCoin = "BTC"
//        let ethCoin = "ETH"
//        let xprCoin = "XPR"
//        let bchCoin = "BCH"
//        let ltcCoin = "LTC"
//        let adaCoin = "ADA"
//        let xlmCoin = "XLM"
//        let neoCoin = "NEO"
//        let eosCoin = "EOS"
//        let iotaCoin = "MIOTA"
//        let shortNames = [btcCoin, ethCoin, xprCoin, bchCoin, ltcCoin, adaCoin, xlmCoin, neoCoin, eosCoin, iotaCoin]
//
//        var coinsArray = [Coin]()
//        for i in 0..<10 {
//
//            var exchangeRate = 10000.54
//            if i == 0 {
//                exchangeRate = btcRate
//            }
//            let someCoin = Coin(id: shortName: shortNames[i], exchangeRate: exchangeRate)
////                if i == 0 {
//////                    someCoin.id = "btc"
////                    someCoin.shortName = shortNames[0]
////                }else{
////                    someCoin.shortName = shortNames[i]
////                }
//            coinsArray.append(someCoin)
//        }
//        userCoins = coinsArray
//        return userCoins
    }
    
    func refreshCoinsArray() {
//        for var someCoin in userCoins {
//            if someCoin.shortName == "BTC" {
//                someCoin.exchangeRate = btcRate
//            }
//        }
//        trackedCurrenciesDataSource.coins = userCoins
//        createCoinsArray()
        trackedCurrenciesDataSource.coins = userCoins
        tableView.reloadData()
    }
}
