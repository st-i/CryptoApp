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
    var rubleRate: Double = 0.0 //57.356798
    var userCoins = [Coin]()
    
    var requestManager: RequestManager!
    var coinsArrayFormatter: CoinsArrayFormatter!

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
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        requestManager = RequestManager()
        coinsArrayFormatter = CoinsArrayFormatter()
        
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
//        requestManager.sendSomeRequestForTest()
//        request(RubleRateRequestBuilder.buildRubleRequest()).responseJSON { (response) in
//            guard let arrayOfData = response.result.value as? Dictionary<String, AnyObject> else{
//                print("Не могу перевести в JSON")
//                return
//            }
//            
//            let sonedkfn = RubleRateResponseParser.parseResponse(response: arrayOfData)
//            print(sonedkfn)
//        }
        
//        let someArray = [4, 6, 2, 7, 1, 3, 5]
//        let sortedArray = someArray.sorted { $0 < $1 }
//        print(sortedArray)
        
//        loadExchangeRateForBTC()
//        fillTableViewWithData()
    }
    
    func fillTableViewWithData() {
        
        tableView.backgroundColor = UIColor.white //UIColor.groupTableViewBackground
        trackedCurrenciesDataSource = TrackedCurrenciesDataSource()
        trackedCurrenciesDelegate = TrackedCurrenciesDelegate()
        
        tableView.dataSource = trackedCurrenciesDataSource
        tableView.delegate = trackedCurrenciesDelegate
        
//        let tempArrayWithCells = TrackedCurrenciesScreenDirector.createTrackedCurrenciesCells(for: self.tableView, btcRate: btcRate)
//        let arrayWithCells = NSMutableArray.init(array: tempArrayWithCells)
        
//        self.trackedCurrenciesDataSource.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
//        self.trackedCurrenciesDelegate.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
        
        let allSavedCoins = CoreDataManager.shared.getUserCoinsArray()
        userCoins = CoinsArrayGroupingFormatter.groupCoins(coins: allSavedCoins)
        trackedCurrenciesDataSource.coins = userCoins
        trackedCurrenciesDelegate.coins = userCoins
        trackedCurrenciesDelegate.viewController = self
//        trackedCurrenciesDelegate.rubleRate = rubleRate
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
        
        let coinsExchangesArray = coinsArrayFormatter.createCoinsExchangesArray(coins: userCoins)
        
        requestManager.getRubleExchangeRate { (newRubleRate) in
            self.rubleRate = newRubleRate
            
            self.requestManager.coinsExchanges.removeAll()
            self.requestManager.exchangesCounter = 0
            
            self.requestManager.coinsExchanges = coinsExchangesArray
            self.requestManager.updateCoinsRates(completion: { (newArray) in
                for coin in self.userCoins {
                    let updatedCoin = newArray[coin.exchange.rawValue][coin.shortName]
                    let updatedCoinRate = (updatedCoin?.exchangeRate)!
                    coin.exchangeRate = updatedCoinRate
                    coin.sum = coin.amount * updatedCoinRate
                    coin.rate24hPercentChange = (updatedCoin?.rate24hPercentChange)!
                }
                
                var portfolioValuesStringsDict = Dictionary<String, String>()
                
                let userCoinsSumInDollars = SumCalculator.getCoinsTotalSum(coins: self.userCoins)
                var currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: userCoinsSumInDollars)
                let userCoinsSumInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: userCoinsSumInDollars))
                let userCoinsSumInDollarsWithSignString = String(format:"$%@", userCoinsSumInDollarsString!)
                portfolioValuesStringsDict.updateValue(userCoinsSumInDollarsWithSignString, forKey: "totalSumInDollarsString")
                
                let userCoinsSumInRubles = userCoinsSumInDollars * newRubleRate
                currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: userCoinsSumInRubles)
                let userCoinsSumInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: userCoinsSumInRubles))
                let userCoinsSumInRublesWithSignString = String(format:"%@₽", userCoinsSumInRublesString!)
                portfolioValuesStringsDict.updateValue(userCoinsSumInRublesWithSignString, forKey: "totalSumInRublesString")
                
                let initialCoinsCostInDollars = 4000.505
                currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: initialCoinsCostInDollars)
                let initialCoinsCostInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: initialCoinsCostInDollars))
                let initialCoinsCostInDollarsWithSignString = String(format:"$%@", initialCoinsCostInDollarsString!)
                portfolioValuesStringsDict.updateValue(initialCoinsCostInDollarsWithSignString, forKey: "initialCostInDollarsString")
                
                let initialCoinsCostInRubles = initialCoinsCostInDollars * newRubleRate
                currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: initialCoinsCostInRubles)
                let initialCoinsCostInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: initialCoinsCostInRubles))
                let initialCoinsCostInRublesWithSignString = String(format:"%@₽", initialCoinsCostInRublesString!)
                portfolioValuesStringsDict.updateValue(initialCoinsCostInRublesWithSignString, forKey: "initialCostInRublesString")
                
                let profitOrLossInDollars = 1000.505
                let positiveProfitOrLossInDollars = fabs(profitOrLossInDollars)
                currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: positiveProfitOrLossInDollars)
                let profitOrLossInDollarsString = currentNumberFormatter.string(from: NSNumber.init(value: positiveProfitOrLossInDollars))
                let minusSign = profitOrLossInDollars >= 0 ? "+" : "-"
                let profitOrLossInDollarsWithSignString = String(format:"%@$%@", minusSign, profitOrLossInDollarsString!)
                portfolioValuesStringsDict.updateValue(profitOrLossInDollarsWithSignString, forKey: "profitOrLossInDollarsString")
                
                let profitOrLossInRubles = positiveProfitOrLossInDollars * newRubleRate
                currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: profitOrLossInRubles)
                let profitOrLossInRublesString = currentNumberFormatter.string(from: NSNumber.init(value: profitOrLossInRubles))
                let profitOrLossInRublesWithSignString = String(format:"%@%@₽", minusSign, profitOrLossInRublesString!)
                portfolioValuesStringsDict.updateValue(profitOrLossInRublesWithSignString, forKey: "profitOrLossInRublesString")
                
                let changeFromBeginningInPercentages = (positiveProfitOrLossInDollars / initialCoinsCostInDollars) * 100.0
                currentNumberFormatter = GlobalNumberFormatter.createNumberFormatter(number: changeFromBeginningInPercentages)
                currentNumberFormatter.maximumFractionDigits = 2
                let changeFromBeginningInPercentagesString = currentNumberFormatter.string(from: NSNumber.init(value: changeFromBeginningInPercentages))
                let percentagesMinusSign = profitOrLossInDollars >= 0 ? "+" : "-"
                let changeFromBeginningInPercentagesWithSignString = String(format:"%@%@%%", percentagesMinusSign, changeFromBeginningInPercentagesString!)
//                portfolioValuesStringsDict.updateValue(changeFromBeginningInPercentagesWithSignString, forKey: "changeFromBeginningInPercentages")
                
                self.trackedCurrenciesDataSource.coins = self.userCoins
                self.trackedCurrenciesDelegate.coins = self.userCoins
//                self.trackedCurrenciesDelegate.rubleRate = newRubleRate
                self.trackedCurrenciesDelegate.trackedCurrenciesDataSource = self.trackedCurrenciesDataSource
                
                self.trackedCurrenciesDataSource.totalSumString = userCoinsSumInDollarsWithSignString
                self.trackedCurrenciesDataSource.initialSumString = initialCoinsCostInDollarsWithSignString
                self.trackedCurrenciesDataSource.profitOrLossString = profitOrLossInDollarsWithSignString
                self.trackedCurrenciesDataSource.changeFromBeginningInPercentages = changeFromBeginningInPercentagesWithSignString
                
                self.trackedCurrenciesDelegate.totalSumString = userCoinsSumInDollarsWithSignString
                self.trackedCurrenciesDelegate.initialSumString = initialCoinsCostInDollarsWithSignString
                self.trackedCurrenciesDelegate.profitOrLossString = profitOrLossInRublesWithSignString
                
                self.trackedCurrenciesDelegate.portfolioValuesStringsDict = portfolioValuesStringsDict
                
                self.tableView.reloadData()
//            print(newArray)
            })
        }
        
        
//            { (coinsDicts) in
//            print(coinsDicts)
//        }
//        let updatedCoinsRates = requestManager.coinsExchanges
//        print(updatedCoinsRates)
        
//        userCoins = CoreDataManager.shared.getAndMapUserCoinsArrayToCoinsArray()
        
//        requestManager.updatedUserCoins.removeAll()
//        requestManager.updateCoinsRates(coins: userCoins, completion: { (updatedUserCoins) in
//            self.trackedCurrenciesDataSource.coins = updatedUserCoins
//            self.trackedCurrenciesDelegate.coins = updatedUserCoins
//            self.tableView.reloadData()
//        })
        
//        requestManager.sendSomeRequestForTest()
        
        
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
