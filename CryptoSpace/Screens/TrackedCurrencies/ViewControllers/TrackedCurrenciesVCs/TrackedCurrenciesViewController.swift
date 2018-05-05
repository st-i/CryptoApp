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

class TrackedCurrenciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var trackedCurrenciesDataSourceAndDelegate:TrackedCurrenciesDataSourceAndDelegate!
    var indicatorViewDataSourceAndDelegate: IndicatorViewDataSourceAndDelegate!

    var originalEditButton: UIBarButtonItem?
    var originalDoneButton: UIBarButtonItem?
    var leftBarButtonItem: UIBarButtonItem?
    var someVC: UIViewController!
    
    var btcRate:Double = 0.0
    var rubleRate: Double = 0.0 //57.356798
    var allUnsortedCoins = [Coin]()
    var userCoins = [Coin]()
    
    var currentUserPortfolio: Portfolio!
    var userPortfolioModel = PortfolioModel()
    
    var requestManager: RequestManager!

    //MARK: VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        //init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Портфель"
        titleView.addSubview(titleViewLabel)
        navigationItem.titleView = titleView
        
        originalEditButton = UIBarButtonItem.init(title: "Изм.", style: .plain, target: self, action: #selector(editPortfolioAction))
        originalDoneButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(editPortfolioAction))
        leftBarButtonItem = originalEditButton
        
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshCurrenciesRates))
        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addTrackedCurrency))
        
        navigationItem.rightBarButtonItems = [addButton, refreshButton]
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        requestManager = RequestManager()
        
        if CoreDataManager.shared.checkPortfolioExistance() == false {
            CoreDataManager.shared.savePortfolio(portfolio: Portfolio())
        }
        
//        let refm = TrackedCoinPurchaseInfoModel()
//        refm.shortName = "BTC"
//        refm.uniqueId = 0
//        CoreDataManager.shared.deleteCertainTrackedUserCoinFromCoreData(coinModel: refm)
        
//        UserDefaults.standard.set(Dictionary<String, Int>(), forKey: kTrackedCoinsQueueIndexesDict)
        
        showIndicatorViewScreen()
        let allSavedCoins = CoreDataManager.shared.getUserCoinsArray() //allSavedTrackedCoins
        allUnsortedCoins = allSavedCoins
        userCoins = CoinsArrayGroupingFormatter.groupCoins(coins: allSavedCoins)
        
        if userCoins.count > 0 {
            userCoins = CoinsOrderManager.orderCoins(coinsType: .Tracked, disorderedCoins: userCoins)
        }
        
        if allSavedCoins.count == 0 {
            currentUserPortfolio = Portfolio()
            userPortfolioModel = PortfolioModel()
            fillTableViewWithData()
            tableView.reloadData()
        }else{
            currentUserPortfolio = CoreDataManager.shared.getUserPortfolio()
            userPortfolioModel = PortfolioMapper.mapPortfolioModel(userPortfolio: currentUserPortfolio, userCoinsCount: userCoins.count)
            
            refreshCurrenciesRates()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let allSavedCoins = CoreDataManager.shared.getUserCoinsArray()
        if allSavedCoins.count != allUnsortedCoins.count {
            if allSavedCoins.count == 0 {
                allUnsortedCoins = allSavedCoins
                userCoins = CoinsArrayGroupingFormatter.groupCoins(coins: allSavedCoins)
                userCoins = CoinsOrderManager.orderCoins(coinsType: .Tracked, disorderedCoins: userCoins)
                userPortfolioModel = PortfolioModel()
                fillTableViewWithData()
            }else{
                 updateScreenWithoutRequest()
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: TableView Data
    func showIndicatorViewScreen() {
        
        tableView.backgroundColor = UIColor.white
        indicatorViewDataSourceAndDelegate = IndicatorViewDataSourceAndDelegate()
        
        tableView.isScrollEnabled = false
        tableView.dataSource = indicatorViewDataSourceAndDelegate
        tableView.delegate = indicatorViewDataSourceAndDelegate
    }
    
    func fillTableViewWithData() {
        
        tableView.isScrollEnabled = true
        trackedCurrenciesDataSourceAndDelegate = TrackedCurrenciesDataSourceAndDelegate()
        
        navigationItem.rightBarButtonItem?.isEnabled = true
        if userCoins.count == 0 {
            navigationItem.leftBarButtonItem = nil
            trackedCurrenciesDataSourceAndDelegate.noCoins = true
        }else{
            navigationItem.leftBarButtonItem = leftBarButtonItem
            navigationItem.leftBarButtonItem?.isEnabled = true
            trackedCurrenciesDataSourceAndDelegate.noCoins = false
            trackedCurrenciesDataSourceAndDelegate.coins = userCoins
            trackedCurrenciesDataSourceAndDelegate.viewController = self
        }
        trackedCurrenciesDataSourceAndDelegate.portfolioModel = userPortfolioModel
        
        tableView.dataSource = trackedCurrenciesDataSourceAndDelegate
        tableView.delegate = trackedCurrenciesDataSourceAndDelegate
    }
    
    //MARK: Actions
    @IBAction func openPortfolioGraph(_ sender: UIButton) {
        
        if userCoins.count > 0 {
            var graphViewModels = [GraphViewModel]()
            for trackedCoin in userCoins {
                let graphViewModel = GraphViewModel()
                graphViewModel.coinFullName = trackedCoin.fullName
                graphViewModel.coinId = trackedCoin.id
                graphViewModel.currentCoinValue = trackedCoin.sum
                graphViewModel.columnWidthPart = CGFloat(trackedCoin.sum / currentUserPortfolio.currentDollarValue)
                graphViewModels.append(graphViewModel)
            }
            
            let sortedGraphViewModels = graphViewModels.sorted { $0.currentCoinValue > $1.currentCoinValue }
            
            let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
            let portfolioGraphVC = storyboard.instantiateViewController(withIdentifier: "PortfolioGraphViewController") as! PortfolioGraphViewController
            portfolioGraphVC.displayModelsArray = sortedGraphViewModels
//            navigationController?.pushViewController(portfolioGraphVC, animated: true)

            let navContr = UINavigationController.init(rootViewController: portfolioGraphVC)
            navContr.modalTransitionStyle = .crossDissolve
            navContr.modalPresentationStyle = .overFullScreen
            present(navContr, animated: true, completion: nil)
        }else{
            let noCoinsAlert = UIAlertController.init(title: "Данные отсутствуют", message: "Добавьте криптовалюты, чтобы посмотреть статистику портфеля", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "ОK", style: .cancel, handler: nil)
            noCoinsAlert.addAction(okAction)
            present(noCoinsAlert, animated: true, completion: nil)
        }
    }
    
    @objc func editPortfolioAction() {
        
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
    
    @objc func addTrackedCurrency() {
        
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchCurrencyVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController") as! CurrencySearchViewController
        searchCurrencyVC.coinType = CoinType.Tracked
        let navContr = UINavigationController.init(rootViewController: searchCurrencyVC)
        navigationController?.present(navContr, animated: true, completion: nil)
    }
    
    //MARK: Requests
    
//    @objc func sendRequestForTest() {
//        requestManager.sendSomeRequestForTest()
//    }
    
    @objc func refreshCurrenciesRates() {
        
        let coinsExchangesArray = CoinsArrayFormatter.createCoinsExchangesArray(coins: userCoins)
        
        requestManager.getRubleExchangeRate { (rubleRequestResultModel) in
            if rubleRequestResultModel.error != convertToJSONError {
                self.rubleRate = rubleRequestResultModel.value!
                
                self.requestManager.coinsExchanges.removeAll()
                self.requestManager.exchangesCounter = 0
                self.requestManager.globalRequestResultModel = RequestResultModel()
                
                self.requestManager.coinsExchanges = coinsExchangesArray
                self.requestManager.updateCoinsRates(completion: { (coinsRequestResultModel) in
                    if coinsRequestResultModel.error != convertToJSONError {
                        var portfolio24ChangeInPercentages = 0.0
                        var portfolio24hChangeInDollars = 0.0
                        
                        var initialPortfolioCost = 0.0
                        
                        for coin in self.userCoins {
                            let updatedCoin = coinsRequestResultModel.coinsSortedByExchanges![coin.exchange.rawValue][coin.shortName]
                            
                            initialPortfolioCost = initialPortfolioCost + (updatedCoin?.initialSum)!
                            
                            let updatedCoinRate = (updatedCoin?.exchangeRate)!
                            coin.exchangeRate = updatedCoinRate
                            let coinSum = coin.amount * updatedCoinRate
                            coin.sum = coinSum
                            let coinRate24hPercentChange = (updatedCoin?.rate24hPercentChange)!
                            coin.rate24hPercentChange = coinRate24hPercentChange
                            
                            if self.userCoins.count == 1 {
                                portfolio24ChangeInPercentages = coinRate24hPercentChange
                            }
                            let currentTotalPercent = 100.0 + coinRate24hPercentChange //100% + изменение за 24ч
                            let openCoinSum = (coinSum * 100.0) / currentTotalPercent //сумма при открытии торгов
                            var currentCoinPriceChange = 0.0
                            if coinSum >= openCoinSum {
                                currentCoinPriceChange = coinSum - openCoinSum
                                portfolio24hChangeInDollars = portfolio24hChangeInDollars + currentCoinPriceChange
                            }else{
                                currentCoinPriceChange = openCoinSum - coinSum
                                portfolio24hChangeInDollars = portfolio24hChangeInDollars - currentCoinPriceChange
                            }
                        }

                        self.currentUserPortfolio.last24hValueDollarChange = portfolio24hChangeInDollars
                        self.currentUserPortfolio.rubleExchangeRate = self.rubleRate
                        
                        //текущая стоимость
                        let userCoinsSumInDollars = SumCalculator.getCoinsTotalSum(coins: self.userCoins)
                        self.currentUserPortfolio.currentDollarValue = userCoinsSumInDollars
                        
                        //начальная стоимость
                        let initialCoinsCostInDollars = initialPortfolioCost
                        self.currentUserPortfolio.initialDollarValue = initialCoinsCostInDollars
                        
                        //изменение в процентах за 24ч
                        var portfolio24PercentagesChange = 0.0
                        if self.userCoins.count == 1 {
                            portfolio24PercentagesChange = portfolio24ChangeInPercentages
                        }else{
                            portfolio24PercentagesChange = (portfolio24hChangeInDollars / userCoinsSumInDollars) * 100.0
                        }
                        self.currentUserPortfolio.last24hValuePercentChange = portfolio24PercentagesChange
                        
                        //Обновляем
                        CoreDataManager.shared.updatePortfolio(portfolio: self.currentUserPortfolio)
                        
                        if self.userCoins.count > 0 {
                            CoreDataManager.shared.updateTrackedUserCoins(trackedCoins: self.userCoins)
                        }
                        
                        //отображаем
                        self.userCoins = CoinsOrderManager.orderCoins(coinsType: .Tracked, disorderedCoins: self.userCoins)
                        self.userPortfolioModel = PortfolioMapper.mapPortfolioModel(userPortfolio: self.currentUserPortfolio, userCoinsCount:self.userCoins.count)
                        self.fillTableViewWithData()
                        self.tableView.reloadData()
                    }else{
                        self.updateScreenWithoutRequest()
                        self.tableView.reloadData()
                        AlertsManager.showTryToUpdateLater(inViewController: self)
                    }
                })
            }else{
                self.updateScreenWithoutRequest()
                self.tableView.reloadData()
                AlertsManager.showTryToUpdateLater(inViewController: self)
            }
        }
    }
    
    func updateScreenWithoutRequest() {
        
        let allSavedCoins = CoreDataManager.shared.getUserCoinsArray()
        allUnsortedCoins = allSavedCoins
        userCoins = CoinsArrayGroupingFormatter.groupCoins(coins: allSavedCoins)
        
        if userCoins.count > 0 {
            var portfolio24ChangeInPercentages = 0.0
            var portfolio24hChangeInDollars = 0.0
            
            var initialPortfolioCost = 0.0
            
            for coin in userCoins {
                initialPortfolioCost = initialPortfolioCost + coin.initialSum

                let coinSum = coin.amount * coin.exchangeRate
                let coinRate24hPercentChange = coin.rate24hPercentChange
                
                if userCoins.count == 1 {
                    portfolio24ChangeInPercentages = coinRate24hPercentChange
                }
                let currentTotalPercent = 100.0 + coinRate24hPercentChange //100% + изменение за 24ч
                let openCoinSum = (coinSum * 100.0) / currentTotalPercent //сумма при открытии торгов
                var currentCoinPriceChange = 0.0
                if coinSum >= openCoinSum {
                    currentCoinPriceChange = coinSum - openCoinSum
                    portfolio24hChangeInDollars = portfolio24hChangeInDollars + currentCoinPriceChange
                }else{
                    currentCoinPriceChange = openCoinSum - coinSum
                    portfolio24hChangeInDollars = portfolio24hChangeInDollars - currentCoinPriceChange
                }
            }
            
            currentUserPortfolio.last24hValueDollarChange = portfolio24hChangeInDollars
            
            //текущая стоимость
            let userCoinsSumInDollars = SumCalculator.getCoinsTotalSum(coins: userCoins)
            currentUserPortfolio.currentDollarValue = userCoinsSumInDollars
            
            //начальная стоимость
            let initialCoinsCostInDollars = initialPortfolioCost
            currentUserPortfolio.initialDollarValue = initialCoinsCostInDollars
            
            //изменение в процентах за 24ч
            var portfolio24PercentagesChange = 0.0
            if userCoins.count == 1 {
                portfolio24PercentagesChange = portfolio24ChangeInPercentages
            }else{
                portfolio24PercentagesChange = (portfolio24hChangeInDollars / userCoinsSumInDollars) * 100.0
            }
            currentUserPortfolio.last24hValuePercentChange = portfolio24PercentagesChange
            
            //Обновляем
            CoreDataManager.shared.updatePortfolio(portfolio: currentUserPortfolio)
            
            //отображаем
            userCoins = CoinsOrderManager.orderCoins(coinsType: .Tracked, disorderedCoins: userCoins)
            userPortfolioModel = PortfolioMapper.mapPortfolioModel(userPortfolio: currentUserPortfolio, userCoinsCount:userCoins.count)
        }else{
            CoreDataManager.shared.updatePortfolio(portfolio: Portfolio())
            userPortfolioModel = PortfolioModel()
        }
        fillTableViewWithData()
    }
}
