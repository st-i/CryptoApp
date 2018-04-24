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

    var originalEditButton: UIBarButtonItem!
    var originalDoneButton: UIBarButtonItem!
    var someVC: UIViewController!
    
    var btcRate:Double = 0.0
    var rubleRate: Double = 0.0 //57.356798
    var userCoins = [Coin]()
    
    var currentUserPortfolio: Portfolio!
    var userPortfolioModel = PortfolioModel()
    
    var requestManager: RequestManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshCurrenciesRates)) // sendRequestForTest
        navigationItem.leftBarButtonItem = refreshButton
        navigationItem.rightBarButtonItem = addButton
//        navigationItem.rightBarButtonItems = [addButton, refreshButton]
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        requestManager = RequestManager()
        
        if CoreDataManager.shared.checkPortfolioExistance() == false {
            CoreDataManager.shared.savePortfolio(portfolio: Portfolio())
        }
//        CoreDataManager.shared.updatePortfolio(portfolio: Portfolio())
        
        showIndicatorViewScreen()
        let allSavedCoins = CoreDataManager.shared.getUserCoinsArray()
        if allSavedCoins.count == 0 {
            userPortfolioModel = PortfolioModel()
            fillTableViewWithData()
            tableView.reloadData()
        }else{
            userCoins = CoinsArrayGroupingFormatter.groupCoins(coins: allSavedCoins)
            currentUserPortfolio = CoreDataManager.shared.getUserPortfolio()
            userPortfolioModel = PortfolioMapper.mapPortfolioModel(userPortfolio: currentUserPortfolio, userCoinsCount: userCoins.count)
            
            refreshCurrenciesRates()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func showIndicatorViewScreen() {
        tableView.backgroundColor = UIColor.white
        indicatorViewDataSourceAndDelegate = IndicatorViewDataSourceAndDelegate()
        
        tableView.isScrollEnabled = false
        tableView.dataSource = indicatorViewDataSourceAndDelegate
        tableView.delegate = indicatorViewDataSourceAndDelegate
//        fillTableViewWithData()
    }
    
    func fillTableViewWithData() {
        
        tableView.isScrollEnabled = true
//        tableView.backgroundColor = UIColor.white //UIColor.groupTableViewBackground
        trackedCurrenciesDataSourceAndDelegate = TrackedCurrenciesDataSourceAndDelegate()
        
        if userCoins.count == 0 {
            
        }else{
            trackedCurrenciesDataSourceAndDelegate.coins = userCoins
            trackedCurrenciesDataSourceAndDelegate.viewController = self
        }
        trackedCurrenciesDataSourceAndDelegate.portfolioModel = userPortfolioModel
        
        tableView.dataSource = trackedCurrenciesDataSourceAndDelegate
        tableView.delegate = trackedCurrenciesDataSourceAndDelegate
//        tableView.reloadData()
    }
    
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
            navigationController?.pushViewController(portfolioGraphVC, animated: true)
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
        }else{
            setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
            navigationItem.leftBarButtonItem = originalDoneButton
        }
    }
    
    @objc func addTrackedCurrency() {
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchCurrencyVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController") as! CurrencySearchViewController
        let navContr = UINavigationController.init(rootViewController: searchCurrencyVC)
        navigationController?.present(navContr, animated: true, completion: nil)
    }
    
    @objc func sendRequestForTest() {
        requestManager.sendSomeRequestForTest()
    }
    
    @objc func refreshCurrenciesRates() {
        
        let coinsExchangesArray = CoinsArrayFormatter.createCoinsExchangesArray(coins: userCoins)
        
        requestManager.getRubleExchangeRate { (newRubleRate) in
            self.rubleRate = newRubleRate
            
            self.requestManager.coinsExchanges.removeAll()
            self.requestManager.exchangesCounter = 0
            
            self.requestManager.coinsExchanges = coinsExchangesArray
            self.requestManager.updateCoinsRates(completion: { (newArray) in
                var portfolio24ChangeInPercentages = 0.0
                var portfolio24hChangeInDollars = 0.0
                
                var initialPortfolioCost = 0.0
                
                for coin in self.userCoins {
                    let updatedCoin = newArray[coin.exchange.rawValue][coin.shortName]
                    
                    initialPortfolioCost = initialPortfolioCost + (updatedCoin?.initialSum)!
                    
                    let updatedCoinRate = (updatedCoin?.exchangeRate)!
                    coin.exchangeRate = updatedCoinRate
                    let coinSum = coin.amount * updatedCoinRate
                    coin.sum = coinSum
                    let coinRate24hPercentChange = (updatedCoin?.rate24hPercentChange)!
                    coin.rate24hPercentChange = coinRate24hPercentChange
                    
                    if self.userCoins.count == 1 {
                        portfolio24ChangeInPercentages = coinRate24hPercentChange //ПОПРАВИТЬ
                    }else{
                        let currentTotalPercent = 100.0 + coinRate24hPercentChange
                        let openCoinSum = (coinSum * 100.0) / currentTotalPercent
                        var currentCoinPriceChange = 0.0
                        if coinSum >= openCoinSum {
                            currentCoinPriceChange = coinSum - openCoinSum
                            portfolio24hChangeInDollars = portfolio24hChangeInDollars + currentCoinPriceChange
                        }else{
                            currentCoinPriceChange = openCoinSum - coinSum
                            portfolio24hChangeInDollars = portfolio24hChangeInDollars - currentCoinPriceChange
                        }
                    }
                }
                
//                self.currentUserPortfolio = CoreDataManager.shared.getUserPortfolio()
//                self.userPortfolioModel = PortfolioMapper.mapPortfolioModel(userPortfolio: self.currentUserPortfolio, userCoinsCount: self.userCoins.count
//                )

                self.currentUserPortfolio.last24hValueDollarChange = portfolio24hChangeInDollars
                self.currentUserPortfolio.rubleExchangeRate = newRubleRate
                
                //текущая стоимость
                let userCoinsSumInDollars = SumCalculator.getCoinsTotalSum(coins: self.userCoins)
                self.currentUserPortfolio.currentDollarValue = userCoinsSumInDollars
                
                //начальная стоимость
                let initialCoinsCostInDollars = initialPortfolioCost
//                let initialDollarValueBeforeUpdate = self.currentUserPortfolio.initialDollarValue
                self.currentUserPortfolio.initialDollarValue = initialCoinsCostInDollars
                
                //изменение в процентах за 24ч
                var portfolio24PercentagesChange = 0.0
                if self.userCoins.count == 1 {
                    portfolio24PercentagesChange = portfolio24ChangeInPercentages
                }else{
                    portfolio24PercentagesChange = (portfolio24hChangeInDollars / userCoinsSumInDollars) * 100.0
                }
                self.currentUserPortfolio.last24hValuePercentChange = portfolio24PercentagesChange
                
                //сохраняем в кордату или обновляем
//                if initialDollarValueBeforeUpdate == 0 {
//                    CoreDataManager.shared.savePortfolio(portfolio: self.currentUserPortfolio)
//                }else{
//                    CoreDataManager.shared.updatePortfolio(portfolio: self.currentUserPortfolio)
//                }
                
                //Обновляем
                CoreDataManager.shared.updatePortfolio(portfolio: self.currentUserPortfolio)
                
                if self.userCoins.count > 0 {
                    CoreDataManager.shared.updateTrackedUserCoins(trackedCoins: self.userCoins)
                }
                
                //отображаем
//                let allSavedCoins = CoreDataManager.shared.getUserCoinsArray()
//                self.userCoins = CoinsArrayGroupingFormatter.groupCoins(coins: allSavedCoins)
                self.userPortfolioModel = PortfolioMapper.mapPortfolioModel(userPortfolio: self.currentUserPortfolio, userCoinsCount: self.userCoins.count
                )
                self.fillTableViewWithData()
                self.tableView.reloadData()
//                self.trackedCurrenciesDataSourceAndDelegate.coins = self.userCoins
//                self.trackedCurrenciesDataSourceAndDelegate.portfolioModel = self.userPortfolioModel
            })
        }
    }
}
