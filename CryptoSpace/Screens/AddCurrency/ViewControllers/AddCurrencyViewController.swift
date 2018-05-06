//
//  AddCurrencyViewController.swift
//  CryptoSpace
//
//  Created by iStef on 27.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit
import CoreData

private let kPurchaseExchangeRateCellIdentifier = "PurchaseExchangeRateCell"
private let kPurchaseSumCellIdentifier = "PurchaseSumCell"
private let kCurrencyAmountCellIdentifier = "CurrencyAmountCell"

class AddCurrencyViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var addCurrencyDataSourceAndDelegate:AddCurrencyDataSourceAndDelegate!
    var indicatorViewDataSourceAndDelegate: IndicatorViewDataSourceAndDelegate!
    var currentCoin: Coin!
    
    var showDataTimer = Timer()
    
    var firstZeroAndComma: Bool!
    var secondZeroAndComma: Bool!
    var thirdZeroAndComma: Bool!
    
    var needScrollToRateRow:Bool!
    
    var purchaseExchangeRateValue: Double!
    var purchaseSumValue: Double!
    var currencyAmountValue: Double!
    
    var purchaseExchRateText: String?
    var currencyAmountText: String?
    var purchaseSumText: String?
    
    var commonNumberFormatter: NumberFormatter!
    
    var requestWasSend = false
    
    var coinType: CoinType?
    
    //MARK: VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = currentCoin.shortName
        titleView.addSubview(titleViewLabel)
        navigationItem.titleView = titleView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Добавить", style: .plain, target: self, action: #selector(addCurrencyAction))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        firstZeroAndComma = false
        secondZeroAndComma = false
        thirdZeroAndComma = false
        
        needScrollToRateRow = true
        
        purchaseExchangeRateValue = 0
        purchaseSumValue = 0
        currencyAmountValue = 0
        
        specifyCommonNumberFormatter()
        
        showIndicatorViewScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !requestWasSend {
            showDataTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(showSingleCoinData), userInfo: nil, repeats: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        showDataTimer.invalidate()
    }
    
    //MARK: show data after delay
    @objc func showSingleCoinData() {
        let requestManager = RequestManager.init()
        requestManager.getExchangeRate(coin: currentCoin) { (singleCoinRequestResultModel) in
            if singleCoinRequestResultModel.error != convertToJSONError {
                let coinRate = (singleCoinRequestResultModel.singleCoinDict![self.currentCoin.shortName]!)[kCoinLastPrice]!
                self.currentCoin.exchangeRate = coinRate
                self.currentCoin.purchaseExchangeRate = coinRate
                self.currentCoin.rate24hPercentChange = (singleCoinRequestResultModel.singleCoinDict![self.currentCoin.shortName]!)[kCoin24hPercentChange]!
                self.purchaseExchangeRateValue = coinRate
                
                self.requestWasSend = true
                if self.coinType == CoinType.Tracked {
                    self.navigationItem.rightBarButtonItem?.isEnabled = false
                }else{
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
                self.fillTableViewWithData()
            }else{
                AlertsManager.showTryToUpdateLaterAndDismiss(inViewController: self)
            }
        }
    }
    
    //MARK: TableViewData
    func showIndicatorViewScreen() {
        tableView.backgroundColor = UIColor.white
        indicatorViewDataSourceAndDelegate = IndicatorViewDataSourceAndDelegate()
        
        tableView.isScrollEnabled = false
        tableView.dataSource = indicatorViewDataSourceAndDelegate
        tableView.delegate = indicatorViewDataSourceAndDelegate
    }
    
    func fillTableViewWithData() {
        self.addCurrencyDataSourceAndDelegate = AddCurrencyDataSourceAndDelegate()
        self.addCurrencyDataSourceAndDelegate.currencyPurchase = coinType == CoinType.Tracked ? true : false
        
        self.tableView.dataSource = self.addCurrencyDataSourceAndDelegate
        self.tableView.delegate = self.addCurrencyDataSourceAndDelegate
        tableView.isScrollEnabled = true
        
        let coinRateString = String.init("$\(self.createStringFromDouble(coinRate: currentCoin.exchangeRate))")
        let addCoinModel = AddCoinModel()
        addCoinModel.currentCoin = currentCoin
        addCoinModel.coinExchangeRate = coinRateString
        addCoinModel.purchaseDate = Date()
        addCoinModel.dateString = DetailedDateFormatter.stringFromDate(date: Date())
        
        addCurrencyDataSourceAndDelegate.purchaseDate = addCoinModel.purchaseDate
        addCurrencyDataSourceAndDelegate.addCoinModel = addCoinModel
        addCurrencyDataSourceAndDelegate.viewController = self
        tableView.reloadData()
    }

    //MARK: CommonFuncs
    @objc func doneAction() {
        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell

        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            if purchaseExchangeRateCell.purchaseExchangeRateTextField.text?.count ?? 0 > 0 {
                var purchaseExchangeRateText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
                if purchaseExchangeRateText?.last == "," {
                    purchaseExchangeRateText?.removeLast()
                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = purchaseExchangeRateText
                }
            }
            purchaseExchangeRateCell.purchaseExchangeRateTextField.resignFirstResponder()
        }else if currencyAmountCell.currencyAmountTextField.isFirstResponder {
            if currencyAmountCell.currencyAmountTextField.text?.count ?? 0 > 0 {
                var currencyAmountText = currencyAmountCell.currencyAmountTextField.text
                if currencyAmountText?.last == "," {
                    currencyAmountText?.removeLast()
                    currencyAmountCell.currencyAmountTextField.text = currencyAmountText
                }
            }
            currencyAmountCell.currencyAmountTextField.resignFirstResponder()
        }else{
            if purchaseSumCell.purchaseSumTextField.text?.count ?? 0 > 0 {
                var purchaseSumText = purchaseSumCell.purchaseSumTextField.text
                if purchaseSumText?.last == "," {
                    purchaseSumText?.removeLast()
                    purchaseSumCell.purchaseSumTextField.text = purchaseSumText
                }
            }
            purchaseSumCell.purchaseSumTextField.resignFirstResponder()
        }

        animateTableViewDown()
    }
    
    @objc func animateTableViewDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }, completion: nil)
        self.tableView.isScrollEnabled = true
        self.needScrollToRateRow = true
    }
    
    //MARK: BarButtons actions
    @objc func addCurrencyAction() {
        
        let currentCoinType = addCurrencyDataSourceAndDelegate.currencyPurchase ? CoinType.Tracked : CoinType.Observed
        if addCurrencyDataSourceAndDelegate.currencyPurchase {
//            currentCoin.exchangeRate = purchaseExchangeRateValue
            currentCoin.purchaseExchangeRate = purchaseExchangeRateValue
            currentCoin.amount = currencyAmountValue
            currentCoin.sum = purchaseSumValue
            currentCoin.initialSum = purchaseSumValue
            currentCoin.coinType = currentCoinType
            currentCoin.purchaseDate = addCurrencyDataSourceAndDelegate.purchaseDate
            CoreDataManager.shared.saveTrackedUserCoin(coin: currentCoin)
        }else{
            currentCoin.coinType = currentCoinType
            CoreDataManager.shared.tryToSaveObservedCoin(coin: currentCoin)
        }
        CoinsOrderManager.addNewCoinToQueue(coinType: currentCoinType, newCoin: currentCoin)
        
        //возврат на экран в зависимости от добавленного типа
        let presentingTabBarContr = navigationController?.presentingViewController as! UITabBarController
        if coinType == CoinType.Tracked && addCurrencyDataSourceAndDelegate.currencyPurchase == false {
            presentingTabBarContr.selectedIndex = 1
        }else if coinType == CoinType.Observed && addCurrencyDataSourceAndDelegate.currencyPurchase {
            presentingTabBarContr.selectedIndex = 0
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITextViewFuncs and Delegate
    func viewAboveTextViewKeyboard() -> UIView {
        let helperView = UIView.init(frame: CGRect.init(x: 0, y: view.bounds.height + 40, width: view.bounds.width, height: 40))
        //        UIColor.init(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        //        UIColor.init(red: 213.0 / 255.0, green: 217.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0)
        helperView.backgroundColor = UIColor.init(red: 213.0 / 255.0, green: 217.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0)
        
        let doneButton = UIButton.init(type: .custom)
        doneButton.addTarget(self, action: #selector(textViewDoneAction), for: .touchUpInside)
        doneButton.setTitleColor(UIColor.init(red: 0.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0), for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .highlighted)
        doneButton.setTitle("Готово", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 16) //UIFont.systemFont(ofSize: 16, weight: .semibold)
        doneButton.frame = CGRect.init(x: helperView.frame.maxX - 80, y: 0, width: 60, height: 40)
        doneButton.backgroundColor = UIColor.clear
        helperView.addSubview(doneButton)
        
        return helperView
    }
    
    @objc func textViewDoneAction() {
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 6, section: 1)) as! NotesCell
        notesCell.notesTextView.resignFirstResponder()
        animateTableViewDown()
        let textViewText = notesCell.notesTextView.text
        if textViewText == "" {
            notesCell.notesTextView.text = "Дoпoлнитeльнaя инфoрмaция"
            notesCell.notesTextView.textColor = UIColor.init(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0)
        }
        currentCoin.note = textViewText!
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 6, section: 1)) as! NotesCell
        notesCell.notesTextView.inputAccessoryView = viewAboveTextViewKeyboard()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        doneAction()
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 310.0, 0)
        self.tableView.scrollToRow(at: IndexPath.init(row: 4, section: 1), at: .top, animated: true)
        self.tableView.isScrollEnabled = false
        
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 6, section: 1)) as! NotesCell
        let textViewText = notesCell.notesTextView.text
        if textViewText == "Дoпoлнитeльнaя инфoрмaция" {
            notesCell.notesTextView.text = ""
            notesCell.notesTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 6, section: 1)) as! NotesCell
        var textViewText = notesCell.notesTextView.text
        if textViewText?.count ?? 0 > 100 {
            textViewText?.removeLast()
        }
        let tempText = textViewText
        if countInstances(of: "\n", in: tempText!) > 4 {
            textViewText?.removeLast()
        }
        
        notesCell.notesTextView.text = textViewText
    }
    
    //MARK: Helpers
    func specifyCommonNumberFormatter() {
        commonNumberFormatter = NumberFormatter.init()
        commonNumberFormatter.groupingSeparator = " "
        commonNumberFormatter.groupingSize = 3
        commonNumberFormatter.usesGroupingSeparator = true
        commonNumberFormatter.decimalSeparator = ","
        commonNumberFormatter.numberStyle = .decimal
    }
    
    func createStringFromDouble(coinRate: Double) -> String {
        if coinRate < 1 {
            commonNumberFormatter.maximumFractionDigits = 6
        }else{
            commonNumberFormatter.maximumFractionDigits = 2
        }
        return commonNumberFormatter.string(from: NSNumber.init(value: coinRate))!
    }
    
    func countInstances(of stringToFind: String, in stringToSearch: String) -> Int {
        var tempStringToSearch = stringToSearch
        var count = 0
        while let foundRange = tempStringToSearch.range(of: stringToFind, options: .diacriticInsensitive) {
            tempStringToSearch = tempStringToSearch.replacingCharacters(in: foundRange, with: "")
            count += 1
        }
        return count
    }
    
    func removeSpaces(in someString: String) -> String {
        var tempSomeString = someString
        while let foundRange = tempSomeString.range(of: " ") {
            tempSomeString = tempSomeString.replacingCharacters(in: foundRange, with: "")
        }
        return tempSomeString
    }
    
    func enableOrDisableAddButton() {
        if purchaseExchRateText?.count == 0 || currencyAmountText?.count == 0 || purchaseSumText?.count == 0 ||
            purchaseExchangeRateValue == 0.0 || purchaseSumValue == 0.0 || currencyAmountValue == 0.0 {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }else{
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
}
