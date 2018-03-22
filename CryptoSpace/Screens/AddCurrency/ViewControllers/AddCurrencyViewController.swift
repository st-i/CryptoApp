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

class AddCurrencyViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var addCurrencyDataSourceAndDelegate:AddCurrencyDataSourceAndDelegate!
    var currentCoin: Coin!
//    var scrolledToRow: Bool!
    
    var firstZeroAndComma: Bool!
    var secondZeroAndComma: Bool!
    var thirdZeroAndComma: Bool!
    
    var needScrollToRateRow:Bool!
    
    var purchaseExchangeRateValue: Double!
    var purchaseSumValue: Double!
    var currencyAmountValue: Double!
    
    var numberFormatter: NumberFormatter!
    var commonNumberFormatter: NumberFormatter!
    
    var requestWasSend = false
    
//    var viewAboveKeyboard: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = currentCoin.shortName //"Bitcoin"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "\\/", style: .plain, target: self, action: #selector(addCurrencyAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white

//        scrolledToRow = false
        
        firstZeroAndComma = false
        secondZeroAndComma = false
        thirdZeroAndComma = false
        
        needScrollToRateRow = true
        
        purchaseExchangeRateValue = 0
        purchaseSumValue = 0
        currencyAmountValue = 0
        
        specifyNumberFormatter()
        specifyCommonNumberFormatter()
        
        fillTableViewWithData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.fillTableViewWithData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !requestWasSend {
            
            let currentExchangeRateCell = tableView.cellForRow(at: IndexPath.init(row: 1, section: 1)) as! CurrentExchangeRateCell
            
//            var indicatorRect = currentExchangeRateCell.coinRateIndicator.frame
//            if currentExchangeRateCell.rightTextLabel.text == "" {
//                indicatorRect.origin.x = view.frame.maxX - 35
//            }else{
//                indicatorRect.origin.x = view.frame.minX + 135
//            }
//            currentExchangeRateCell.coinRateIndicator.frame = indicatorRect
            
            currentExchangeRateCell.coinRateIndicator.startAnimating()
            currentExchangeRateCell.coinRateIndicator.activityIndicatorViewStyle = .gray

            let requestManager = RequestManager.init()
            requestManager.getExchangeRate(coin: currentCoin) { (coinRate) in
    //            let currentExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 1)) as! CurrentExchangeRateCell
                self.currentCoin.exchangeRate = coinRate
                currentExchangeRateCell.coinRateIndicator.stopAnimating()
                currentExchangeRateCell.coinRateIndicator.removeFromSuperview()
                self.requestWasSend = true
//                currentExchangeRateCell.coinRateIndicator.activityIndicatorViewStyle = .white
                
//                indicatorRect.origin.x = self.view.frame.maxX
//                currentExchangeRateCell.coinRateIndicator.frame = indicatorRect
                
                let coinRateString = String.init("$\(self.createStringFromDouble(coinRate: coinRate))")
                
                currentExchangeRateCell.rightTextLabel.text = coinRateString
                
                let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
                if purchaseExchangeRateCell.purchaseExchangeRateTextField.text == "" {
                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = coinRateString
                }
                //"\(coinRate)"
            }
        }
    }
    
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
    
    func fillTableViewWithData() {
        self.tableView.backgroundColor = UIColor.white //groupTableViewBackground
        self.addCurrencyDataSourceAndDelegate = AddCurrencyDataSourceAndDelegate()
        self.addCurrencyDataSourceAndDelegate.currencyPurchase = true
        
        self.tableView.dataSource = self.addCurrencyDataSourceAndDelegate
        self.tableView.delegate = self.addCurrencyDataSourceAndDelegate
        
        let arrayWithCells = AddCurrencyScreenDirector.createAddCurrencyCells(for: self.tableView)
        
        let detailedDateFormatter = DetailedDateFormatter.init()
        
        addCurrencyDataSourceAndDelegate.dateString = detailedDateFormatter.stringFromDate(date: Date())
        addCurrencyDataSourceAndDelegate.currentCoin = currentCoin
        addCurrencyDataSourceAndDelegate.arrayWithCells = arrayWithCells
        addCurrencyDataSourceAndDelegate.viewController = self
    }
    
    func specifyNumberFormatter() {
        numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = " "
        numberFormatter.decimalSeparator = ","
        numberFormatter.numberStyle = .decimal
    }
    
    func viewAboveKeyboard() -> UIView {
        let helperView = UIView.init(frame: CGRect.init(x: 0, y: view.bounds.height + 40, width: view.bounds.width, height: 40))
//        helperView.backgroundColor = UIColor.init(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0)
//        UIColor.init(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        helperView.backgroundColor = UIColor.init(red: 213.0 / 255.0, green: 217.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0)

        let nextTextFieldButton = UIButton.init(type: .custom)
        nextTextFieldButton.addTarget(self, action: #selector(nextTextFieldAction), for: .touchUpInside)
//        nextTextFieldButton.setTitleColor(UIColor.init(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0), for: .normal)
//        nextTextFieldButton.setTitleColor(UIColor.groupTableViewBackground, for: .highlighted)
        nextTextFieldButton.setImage(UIImage.init(named: "next"), for: .normal)
//        nextTextFieldButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        nextTextFieldButton.frame = CGRect.init(x: helperView.frame.midX - 15, y: helperView.bounds.midY - 15, width: 30, height: 30)
        nextTextFieldButton.backgroundColor = UIColor.clear
        helperView.addSubview(nextTextFieldButton)
        
        let doneButton = UIButton.init(type: .custom)
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        doneButton.setTitleColor(UIColor.init(red: 0.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0), for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .highlighted)
        doneButton.setTitle("Готово", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 16) //UIFont.systemFont(ofSize: 16, weight: .semibold)
        doneButton.frame = CGRect.init(x: helperView.frame.maxX - 80, y: 0, width: 60, height: 40)
        doneButton.backgroundColor = UIColor.clear
        helperView.addSubview(doneButton)
        
        return helperView
        
//        viewAboveKeyboard = helperView
    }
    
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
    
//    func showViewAboveKeyboard() {
//        view.addSubview(viewAboveKeyboard)
//        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
//            self.viewAboveKeyboard.frame.origin.y = self.view.bounds.height - 125
//        }, completion: nil)
//    }
//
//    func hideViewAboveKeyboard() {
//        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
//            self.viewAboveKeyboard.frame.origin.y = self.view.bounds.height + 40
//        }, completion: { (true) in
//            self.viewAboveKeyboard.removeFromSuperview()
//        })
//    }
    
    @objc func nextTextFieldAction() {
        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell

        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            currencyAmountCell.currencyAmountTextField.becomeFirstResponder()
        }else if currencyAmountCell.currencyAmountTextField.isFirstResponder {
            purchaseSumCell.purchaseSumTextField.becomeFirstResponder()
        }else{
//            hideViewAboveKeyboard()
            purchaseSumCell.purchaseSumTextField.resignFirstResponder()
//            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
            animateTableViewDown()
        }
    }
    
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
//        hideViewAboveKeyboard()
//        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        animateTableViewDown()
    }
    
    @objc func textViewDoneAction() {
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as! NotesCell
        notesCell.notesTextView.resignFirstResponder()
        animateTableViewDown()
        let textViewText = notesCell.notesTextView.text
        if textViewText == "" {
            notesCell.notesTextView.text = "Дoпoлнитeльнaя инфoрмaция"
            notesCell.notesTextView.textColor = UIColor.init(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0)
        }
    }
    
    @objc func animateTableViewDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }, completion: nil)
//            { (true) in
//        })
        self.tableView.isScrollEnabled = true
        self.needScrollToRateRow = true
    }
    
    @objc func addCurrencyAction() {
//        for someVC in (navigationController?.viewControllers)! {
//            if someVC.isKind(of: CurrencySearchViewController.self) {
//                let currentVC = someVC as! CurrencySearchViewController
//                navigationController?.popToViewController(someVC, animated: true)
//                currentVC.cancelSearchBar()
//            }
//        }
//        tabBarController?.selectedIndex = 0
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
        
//        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
//        let currencyAmountText = currencyAmountCell.currencyAmountTextField.text!
//        if currencyAmountText.count > 0 {
//            currentCoin.amount = Double(currencyAmountText)!
//        }else{
//            currentCoin.amount = 0.0
//        }
//
//        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell
//        let purchaseSumText = purchaseSumCell.purchaseSumTextField.text!.suffix(1)
//        if purchaseSumText.count > 0 {
//            currentCoin.sum = Double()
//        }else{
//            currentCoin.sum = 0.0
//        }
        currentCoin.sum = purchaseSumValue
        currentCoin.amount = currencyAmountValue

        //1
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "UserCoin", in: managedContext)!
        let userCoin = NSManagedObject(entity: entity, insertInto: managedContext)
        //3
        userCoin.setValue(currentCoin.fullName, forKeyPath: "fullName")
        userCoin.setValue(currentCoin.shortName, forKey: "shortName")
        userCoin.setValue(currentCoin.id, forKey: "id")
        userCoin.setValue(NSNumber.init(value:currentCoin.exchange.rawValue), forKey: "exchange")
        userCoin.setValue(NSNumber.init(value:currentCoin.exchangeRate), forKey: "exchangeRate")
        userCoin.setValue(NSNumber.init(value:currentCoin.amount), forKey: "amount")
        userCoin.setValue(NSNumber.init(value:currentCoin.sum), forKey: "sum")
        //4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        dismiss(animated: true, completion: nil)
        
        print("Added!")
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
//            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
//        }, completion: nil)
//        self.tableView.isScrollEnabled = true
//        return true;
//    }
    
    //UITextViewDelegate
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as! NotesCell
        notesCell.notesTextView.inputAccessoryView = viewAboveTextViewKeyboard()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
//        if needScrollToRateRow {
        doneAction()
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 310.0, 0)
        self.tableView.scrollToRow(at: IndexPath.init(row: 4, section: 1), at: .top, animated: true)
        self.tableView.isScrollEnabled = false
        
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as! NotesCell
        let textViewText = notesCell.notesTextView.text
        if textViewText == "Дoпoлнитeльнaя инфoрмaция" {
            notesCell.notesTextView.text = ""
            notesCell.notesTextView.textColor = UIColor.black
        }
//            needScrollToRateRow = false
//        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as! NotesCell
//        notesCell.notesTextView.inputAccessoryView = viewAboveTextViewKeyboard()
//        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let notesCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as! NotesCell
        var textViewText = notesCell.notesTextView.text
        if textViewText?.count ?? 0 > 100 {
            textViewText?.removeLast()
        }
        let tempText = textViewText
        if countInstances(of: "\n", in: tempText!) > 10 {
            textViewText?.removeLast()
        }
        
        notesCell.notesTextView.text = textViewText
    }
    
    @IBAction func cellTextFieldDidBeginEditingAction(_ sender: UITextField) {
        if needScrollToRateRow {
//            showViewAboveKeyboard()
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 145.0, 0)
            self.tableView.scrollToRow(at: IndexPath.init(row: 3, section: 1), at: .top, animated: true)
            self.tableView.isScrollEnabled = false
            needScrollToRateRow = false
            
//            tableView.isUserInteractionEnabled = false
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                self.tableView.isUserInteractionEnabled = true
//            }
//            addCurrencyDataSourceAndDelegate.hideChoiceView()
        }
        
        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell
        
        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            purchaseExchangeRateCell.purchaseExchangeRateTextField.inputAccessoryView = viewAboveKeyboard()
        }else if currencyAmountCell.currencyAmountTextField.isFirstResponder {
            currencyAmountCell.currencyAmountTextField.inputAccessoryView = viewAboveKeyboard()
        }else{
            purchaseSumCell.purchaseSumTextField.inputAccessoryView = viewAboveKeyboard()
        }
    }
    
    @IBAction func cellTextFieldEditingChangedAction(_ sender: UITextField) {
        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell

        let currentNumberFormatter = NumberFormatter.init()
        currentNumberFormatter.groupingSeparator = " "
        currentNumberFormatter.groupingSize = 3
        currentNumberFormatter.usesGroupingSeparator = true
        currentNumberFormatter.decimalSeparator = ","
        currentNumberFormatter.numberStyle = .decimal
//            currentNumberFormatter.maximumFractionDigits = 2
        
        //первый текстФилд - курс покупки
        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            
//            currentNumberFormatter.locale = Locale.init(identifier: "be_NL")
//            currentNumberFormatter.numberStyle = .decimal
//            currentNumberFormatter.maximumFractionDigits = 2
            
            var firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            
//            let number1 = 99999.99
//            let number2 = 9999999999.99999999
//            let numeber3 = number1 * number2
//            let tempString11 = currentNumberFormatter.string(from: NSNumber.init(value: numeber3))
            
            if firstTextFieldText?.first == "$" && firstTextFieldText?.count == 1 {
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = ""
                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            }
            
            if firstTextFieldText?.first == "," && firstTextFieldText?.count == 1 {
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,"
                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            }
            
            if firstTextFieldText?.count != 0 && !(firstTextFieldText!.contains("$")) {
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@", firstTextFieldText!)
                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            }

            if (firstTextFieldText?.contains(","))! && countInstances(of: ",", in: firstTextFieldText!) > 1 {
                firstTextFieldText?.removeLast()
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = firstTextFieldText
            }

            if firstTextFieldText?.count ?? 0 > 0 {
                if firstTextFieldText!.contains("$0") {
                    currentNumberFormatter.maximumFractionDigits = 6
                    if firstTextFieldText == "$0" {
                        if firstZeroAndComma {
                            purchaseExchangeRateCell.purchaseExchangeRateTextField.text = ""
                            firstZeroAndComma = false
                        }else{
                            purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,"
                            firstZeroAndComma = true
                        }
                        firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
                    }else{
                        if firstTextFieldText!.count > 9 || firstTextFieldText! == "$0,000000" {
                            firstTextFieldText?.removeLast()
                        }
                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = firstTextFieldText
                    }
                }else{
                    //вся работа с пробелами в числах
                    var firstText: String!
                    
                    if (firstTextFieldText?.contains(" "))! {
                        firstText = removeSpaces(in: firstTextFieldText!)
                    }else{
                        firstText = firstTextFieldText
                    }

                    let tempStart = firstText?.index((firstText?.startIndex)!, offsetBy: 1)
                    let tempEnd = firstText?.index((firstText?.endIndex)!, offsetBy: 0)
                    let tempRange = tempStart! ..< tempEnd!
                    firstText = String(firstText![tempRange])

                    var afterCommaText: String!
                    if firstText.contains(",") {
                        currentNumberFormatter.maximumFractionDigits = 2
                        let start = firstText?.index(firstText.index(of: ",")!, offsetBy: 1)
                        let end = firstText?.index((firstText?.endIndex)!, offsetBy: 0)
                        let range = start! ..< end!
                        afterCommaText = String(firstText![range])

                        if afterCommaText.count > 2 {
                            firstText.removeLast()
                            afterCommaText.removeLast()
                        }
                    }
                    
                    if firstText.count > 5 && !(firstText.contains(",")) {
                        if firstText.last != "," {
                            firstText.removeLast()
                        }
                    }
                    
                    if firstText.count > 6 && firstText.last == "," {
                        firstText.removeLast()
                    }

                    let tempNumber = currentNumberFormatter.number(from: firstText)
                    let tempString = currentNumberFormatter.string(from: tempNumber!)
                    
                    if firstText.last == "," {
                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@,", tempString!)
                    }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 1 {
                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@,0", tempString!)
                    }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 2 {
                        let zerosStart = firstText?.index(firstText.index(of: ",")!, offsetBy: 1)
                        let zerosEnd = firstText?.index((firstText?.endIndex)!, offsetBy: 0)
                        let range = zerosStart! ..< zerosEnd!
                        let afterCommaZeros = String(firstText![range])
                        if afterCommaZeros == "00" {
                            purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@,00", tempString!)
                        }else{
                            purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@0", tempString!)
                        }
                    }else{
                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@", tempString!)
                    }
                    print(tempString!)
                }
            }
                
            firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            
            //умножение
            if firstTextFieldText?.count != 0 {
                let start = firstTextFieldText?.index((firstTextFieldText?.startIndex)!, offsetBy: 1)
                let end = firstTextFieldText?.index((firstTextFieldText?.endIndex)!, offsetBy: 0)
                let range = start! ..< end!
                var rateNumberString = String(firstTextFieldText![range])
                
                //не делай через форматер; делай через стринг.даблВалуе
                if (rateNumberString.contains(" ")) {
                    rateNumberString = removeSpaces(in: rateNumberString)
                }
                if rateNumberString.range(of: ",") != nil {
                    rateNumberString = rateNumberString.replacingOccurrences(of: ",", with: ".")
                }
                let rateNumber = (rateNumberString as NSString).doubleValue
                purchaseExchangeRateValue = rateNumber

                if currencyAmountCell.currencyAmountTextField.text?.count != 0 {
//                    if currencyAmountCell.currencyAmountTextField.text!.count < 20 {
                    purchaseSumValue = purchaseExchangeRateValue * currencyAmountValue
                    var purchaseSumValueText = String(format: "%f", purchaseSumValue)
                    if (purchaseSumValueText.contains(" ")) {
                        purchaseSumValueText = removeSpaces(in: purchaseSumValueText)
                    }
                    if purchaseSumValueText.range(of: ".") != nil {
                        purchaseSumValueText = purchaseSumValueText.replacingOccurrences(of: ".", with: ",")
                    }
                    if purchaseSumValueText.first == "0" && purchaseSumValueText.contains(",") {
                        currentNumberFormatter.maximumFractionDigits = 6
                    }else{
                        currentNumberFormatter.maximumFractionDigits = 2
                    }
                    let tempNumber = currentNumberFormatter.number(from: purchaseSumValueText)
                    let tempString = currentNumberFormatter.string(from: tempNumber!)
                    purchaseSumCell.purchaseSumTextField.text = String(format: "$%@", tempString!)
//                    }
                }
            }
           
        
            //второй текстФилд - сумма покупки
            //раньше сумма покупки была выше количества, поэтому firstTextFieldText и secondTextFieldText перепутаны в коде
        }else if purchaseSumCell.purchaseSumTextField.isFirstResponder {
            var secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
            
            if secondTextFieldText?.first == "$" && secondTextFieldText?.count == 1 {
                purchaseSumCell.purchaseSumTextField.text = ""
                secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
            }
            
            if secondTextFieldText?.first == "," && secondTextFieldText?.count == 1 {
                purchaseSumCell.purchaseSumTextField.text = "$0,"
                secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
            }
            
            if secondTextFieldText?.count != 0 && !(secondTextFieldText!.contains("$")) {
                purchaseSumCell.purchaseSumTextField.text = String(format: "$%@", secondTextFieldText!)
                secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
            }
            
            if (secondTextFieldText?.contains(","))! && countInstances(of: ",", in: secondTextFieldText!) > 1 {
                secondTextFieldText?.removeLast()
                purchaseSumCell.purchaseSumTextField.text = secondTextFieldText
            }
            
            if secondTextFieldText?.count ?? 0 > 0 {
                if secondTextFieldText!.contains("$0") {
                    currentNumberFormatter.maximumFractionDigits = 6
                    if secondTextFieldText == "$0" {
                        if firstZeroAndComma {
                            purchaseSumCell.purchaseSumTextField.text = ""
                            firstZeroAndComma = false
                        }else{
                            purchaseSumCell.purchaseSumTextField.text = "$0,"
                            firstZeroAndComma = true
                        }
                        secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
                    }else{
                        if secondTextFieldText!.count > 9 || secondTextFieldText! == "$0,000000" {
                            secondTextFieldText?.removeLast()
                        }
                        purchaseSumCell.purchaseSumTextField.text = secondTextFieldText
                    }
                }else{
                    //вся работа с пробелами в числах
                    var secondText: String!
                    
                    if (secondTextFieldText?.contains(" "))! {
                        secondText = removeSpaces(in: secondTextFieldText!)
                    }else{
                        secondText = secondTextFieldText
                    }
                    
                    let tempStart = secondText?.index((secondText?.startIndex)!, offsetBy: 1)
                    let tempEnd = secondText?.index((secondText?.endIndex)!, offsetBy: 0)
                    let tempRange = tempStart! ..< tempEnd!
                    secondText = String(secondText![tempRange])
                    
                    var afterCommaText: String!
                    if secondText.contains(",") {
                        currentNumberFormatter.maximumFractionDigits = 2
                        let start = secondText?.index(secondText.index(of: ",")!, offsetBy: 1)
                        let end = secondText?.index((secondText?.endIndex)!, offsetBy: 0)
                        let range = start! ..< end!
                        afterCommaText = String(secondText![range])
                        
                        if afterCommaText.count > 2 {
                            secondText.removeLast()
                            afterCommaText.removeLast()
                        }
                    }
                    
                    if secondText.count > 11 && !(secondText.contains(",")) {
                        if secondText.last != "," {
                            secondText.removeLast()
                        }
                    }
                    
                    if secondText.count > 12 && secondText.last == "," {
                        secondText.removeLast()
                    }
                    
                    let tempNumber = currentNumberFormatter.number(from: secondText)
                    let tempString = currentNumberFormatter.string(from: tempNumber!)
                    
                    if secondText.last == "," {
                        purchaseSumCell.purchaseSumTextField.text = String(format: "$%@,", tempString!)
                    }else if secondText.contains(",") && secondText.last == "0" && afterCommaText.count == 1 {
                        purchaseSumCell.purchaseSumTextField.text = String(format: "$%@,0", tempString!)
                    }else if secondText.contains(",") && secondText.last == "0" && afterCommaText.count == 2 {
                        let zerosStart = secondText?.index(secondText.index(of: ",")!, offsetBy: 1)
                        let zerosEnd = secondText?.index((secondText?.endIndex)!, offsetBy: 0)
                        let range = zerosStart! ..< zerosEnd!
                        let afterCommaZeros = String(secondText![range])
                        if afterCommaZeros == "00" {
                            purchaseSumCell.purchaseSumTextField.text = String(format: "$%@,00", tempString!)
                        }else{
                            purchaseSumCell.purchaseSumTextField.text = String(format: "$%@0", tempString!)
                        }
                    }else{
                        purchaseSumCell.purchaseSumTextField.text = String(format: "$%@", tempString!)
                    }
                    print(tempString!)
                }
            }
            
            secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
            
            //умножение
            if secondTextFieldText?.count != 0 {
                let start = secondTextFieldText?.index((secondTextFieldText?.startIndex)!, offsetBy: 1)
                let end = secondTextFieldText?.index((secondTextFieldText?.endIndex)!, offsetBy: 0)
                let range = start! ..< end!
                var purchaseSumNumberString = String(secondTextFieldText![range])
                
                //не делай через форматер; делай через стринг.даблВалуе
                if (purchaseSumNumberString.contains(" ")) {
                    purchaseSumNumberString = removeSpaces(in: purchaseSumNumberString)
                }
                if purchaseSumNumberString.range(of: ",") != nil {
                    purchaseSumNumberString = purchaseSumNumberString.replacingOccurrences(of: ",", with: ".")
                }
                let purchaseSumNumber = (purchaseSumNumberString as NSString).doubleValue
                purchaseSumValue = purchaseSumNumber
                
                if purchaseExchangeRateCell.purchaseExchangeRateTextField.text?.count != 0 {
                    currencyAmountValue = purchaseSumValue / purchaseExchangeRateValue
                    var currencyAmountValueText = String(format: "%f", currencyAmountValue)
                    if (currencyAmountValueText.contains(" ")) {
                        currencyAmountValueText = removeSpaces(in: currencyAmountValueText)
                    }
                    if currencyAmountValueText.range(of: ".") != nil {
                        currencyAmountValueText = currencyAmountValueText.replacingOccurrences(of: ".", with: ",")
                    }
                    currentNumberFormatter.maximumFractionDigits = 8
//                    if currencyAmountValueText.contains("99999999999000000,000000") && currencyAmountValueText.count > 24 {
//                        currencyAmountValueText.removeLast()
//                    }
                    let tempNumber = currentNumberFormatter.number(from: currencyAmountValueText)
                    let tempString = currentNumberFormatter.string(from: tempNumber!)
                    currencyAmountCell.currencyAmountTextField.text = String(format: "%@", tempString!)
                }
            }else{
                currencyAmountCell.currencyAmountTextField.text = ""
            }

            
        
            //третий текстФилд - количество
            //раньше сумма покупки была выше количества, поэтому firstTextFieldText и secondTextFieldText перепутаны в коде
        }else{
            var thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
            
//            if thirdTextFieldText?.first == "0" && thirdTextFieldText?.count == 1 {
//                currencyAmountCell.currencyAmountTextField.text = ""
//                thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
//            }
            
            if thirdTextFieldText?.first == "," && thirdTextFieldText?.count == 1 {
                currencyAmountCell.currencyAmountTextField.text = "0,"
                thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
            }
            
//            if thirdTextFieldText?.count != 0 && !(thirdTextFieldText!.contains("$")) {
//                currencyAmountCell.currencyAmountTextField.text = String(format: "$%@", thirdTextFieldText!)
//                thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
//            }
            
            if (thirdTextFieldText?.contains(","))! && countInstances(of: ",", in: thirdTextFieldText!) > 1 {
                thirdTextFieldText?.removeLast()
                currencyAmountCell.currencyAmountTextField.text = thirdTextFieldText
            }
            
            if thirdTextFieldText?.count ?? 0 > 0 {
                if thirdTextFieldText!.first == "0" {
                    currentNumberFormatter.maximumFractionDigits = 6
                    if thirdTextFieldText?.first == "0" && thirdTextFieldText?.count ?? 0 > 1 && !((thirdTextFieldText?.contains(","))!) {
                        thirdTextFieldText!.insert(",", at: thirdTextFieldText!.index(thirdTextFieldText!.startIndex, offsetBy: 1))
                    }
                    if thirdTextFieldText == "0" {
                        if firstZeroAndComma {
                            currencyAmountCell.currencyAmountTextField.text = ""
                            firstZeroAndComma = false
                        }else{
                            currencyAmountCell.currencyAmountTextField.text = "0,"
                            firstZeroAndComma = true
                        }
                        thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
                    }else{
                        if thirdTextFieldText!.count > 10 || thirdTextFieldText! == "0,00000000" {
                            thirdTextFieldText?.removeLast()
                        }
                        currencyAmountCell.currencyAmountTextField.text = thirdTextFieldText
                    }
                }else{
                    //вся работа с пробелами в числах
                    var thirdText: String!
                    
                    if (thirdTextFieldText?.contains(" "))! {
                        thirdText = removeSpaces(in: thirdTextFieldText!)
                    }else{
                        thirdText = thirdTextFieldText
                    }
                    
//                    let tempStart = thirdText?.index((thirdText?.startIndex)!, offsetBy: 0)
//                    let tempEnd = thirdText?.index((thirdText?.endIndex)!, offsetBy: 0)
//                    let tempRange = tempStart! ..< tempEnd!
//                    thirdText = String(thirdText![tempRange])
                    
                    if thirdText.count > 10 && !(thirdText.contains(",")) {
                        if thirdText.last != "," {
                            thirdText.removeLast()
                        }
                    }
                    
                    if thirdText.count > 11 && thirdText.last == "," {
                        thirdText.removeLast()
                    }
                    
                    var beforeCommaText = thirdText!
                    var afterCommaText: String!
                    if thirdText.contains(",") {
//                        currentNumberFormatter.maximumFractionDigits = 2
                        let start = thirdText?.index(thirdText.index(of: ",")!, offsetBy: 1)
                        let end = thirdText?.index((thirdText?.endIndex)!, offsetBy: 0)
                        let range = start! ..< end!
                        afterCommaText = String(thirdText![range])
                        
                        let start1 = thirdText?.index((thirdText.startIndex), offsetBy: 0)
                        let end1 = thirdText?.index(thirdText.index(of: ",")!, offsetBy: 0)
                        let range1 = start1! ..< end1!
                        beforeCommaText = String(thirdText![range1])
                        
//                        if afterCommaText.count > 2 {
//                            thirdText.removeLast()
//                            afterCommaText.removeLast()
//                        }
                    }
                    
                    let tempNumber = currentNumberFormatter.number(from: beforeCommaText)
                    let tempString = currentNumberFormatter.string(from: tempNumber!)
                    
                    if thirdText.last == "," {
                        currencyAmountCell.currencyAmountTextField.text = String(format: "%@,", tempString!)
                    }else if thirdText.contains(",") && thirdText.last != "," {
                        if afterCommaText.count > 8 {
                            afterCommaText.removeLast()
                        }
                        currencyAmountCell.currencyAmountTextField.text = String(format: "%@,%@", tempString!, afterCommaText)
                    
//                    else if thirdText.contains(",") && thirdText.last == "0" && afterCommaText.count == 1 {
//                        currencyAmountCell.currencyAmountTextField.text = String(format: "%@,0", tempString!)
//                    }else if thirdText.contains(",") && thirdText.last == "0" && afterCommaText.count == 2 {
//                        let zerosStart = thirdText?.index(thirdText.index(of: ",")!, offsetBy: 1)
//                        let zerosEnd = thirdText?.index((thirdText?.endIndex)!, offsetBy: 0)
//                        let range = zerosStart! ..< zerosEnd!
//                        let afterCommaZeros = String(thirdText![range])
//                        if afterCommaZeros == "00" {
//                            currencyAmountCell.currencyAmountTextField.text = String(format: "%@,00", tempString!)
//                        }else{
//                            currencyAmountCell.currencyAmountTextField.text = String(format: "%@0", tempString!)
//                        }
                    }else{
                        currencyAmountCell.currencyAmountTextField.text = String(format: "%@", tempString!)
                    }
                    print(tempString!)
                }
            }
            
            thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
            
            //умножение
            if thirdTextFieldText?.count != 0 {
//                let start = firstTextFieldText?.index((firstTextFieldText?.startIndex)!, offsetBy: 1)
//                let end = firstTextFieldText?.index((firstTextFieldText?.endIndex)!, offsetBy: 0)
//                let range = start! ..< end!
//                let rateNumberString = String(firstTextFieldText![range])
                var amountNumberString = thirdTextFieldText!
                
                //не делай через форматер; делай через стринг.даблВалуе
                if (amountNumberString.contains(" ")) {
                    amountNumberString = removeSpaces(in: amountNumberString)
                }
                if amountNumberString.range(of: ",") != nil {
                    amountNumberString = amountNumberString.replacingOccurrences(of: ",", with: ".")
                }
                let amountNumber = (amountNumberString as NSString).doubleValue
                currencyAmountValue = amountNumber
                
                if purchaseExchangeRateCell.purchaseExchangeRateTextField.text?.count != 0 {
//                    if purchaseExchangeRateCell.purchaseExchangeRateTextField.text!.count < 11 {
                        purchaseSumValue = purchaseExchangeRateValue * currencyAmountValue
                        var purchaseSumValueText = String(format: "%f", purchaseSumValue)
                        if (purchaseSumValueText.contains(" ")) {
                            purchaseSumValueText = removeSpaces(in: purchaseSumValueText)
                        }
                        if purchaseSumValueText.range(of: ".") != nil {
                            purchaseSumValueText = purchaseSumValueText.replacingOccurrences(of: ".", with: ",")
                        }
                        if purchaseSumValueText.first == "0" && purchaseSumValueText.contains(",") {
                            currentNumberFormatter.maximumFractionDigits = 6
                        }else{
                            currentNumberFormatter.maximumFractionDigits = 2
                        }
                        let tempNumber = currentNumberFormatter.number(from: purchaseSumValueText)
                        let tempString = currentNumberFormatter.string(from: tempNumber!)
                        purchaseSumCell.purchaseSumTextField.text = String(format: "$%@", tempString!)
                    
//                    }
                }
            }else{
                purchaseSumCell.purchaseSumTextField.text = ""
            }
        }
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

    
//    @IBAction func purchaseExchangeRateTextFieldAction(_ sender: UITextField) {
//    }
//    @IBAction func purchaseSumTextFieldAction(_ sender: UITextField) {
//    }
//    @IBAction func currencyAmountTextFieldAction(_ sender: UITextField) {
//    }
    
}

//************************************************************

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.tableView.scrollToRow(at: IndexPath.init(row: 3, section: 1), at: .top, animated: true)
//        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
//        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! PurchaseSumCell
//        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! CurrencyAmountCell
//
//        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
//            return purchaseSumCell.purchaseSumTextField.becomeFirstResponder()
//        }else if purchaseSumCell.purchaseSumTextField.isFirstResponder {
//            return currencyAmountCell.currencyAmountTextField.becomeFirstResponder()
//        }else{
//            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
//            return currencyAmountCell.currencyAmountTextField.resignFirstResponder()
//        }
//    }



//            if firstTextFieldText == "0" {
//                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0"
//                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
//            }

//            if firstTextFieldText == "$0" && firstZeroAndComma {
//                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = ""
//                firstZeroAndComma = false
//                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
//            }



//            if firstTextFieldText?.count ?? 0 > 0 {
//                var firstText: String!
//
//                if (firstTextFieldText?.contains(" "))! {
//                    firstText = removeSpaces(in: firstTextFieldText!)
//                }else{
//                    firstText = firstTextFieldText
//                }
//
//                let tempStart:String.Index!
//                if firstText.count == 1 {
//                    tempStart = firstText?.index((firstText?.startIndex)!, offsetBy: 0)
//                }else{
//                    tempStart = firstText?.index((firstText?.startIndex)!, offsetBy: 1)
//                }
//                let tempEnd = firstText?.index((firstText?.endIndex)!, offsetBy: 0)
//                let tempRange = tempStart! ..< tempEnd!
//                firstText = String(firstText![tempRange])
//
//                var afterCommaText: String!
//                if firstText.contains(",") {
//                    let start = firstText?.index(firstText.index(of: ",")!, offsetBy: 1)
//                    let end = firstText?.index((firstText?.endIndex)!, offsetBy: 0)
//                    let range = start! ..< end!
//                    afterCommaText = String(firstText![range])
//                    let afterCommaTextLength: Int!
//                    if firstText.contains("0,") {
//                        afterCommaTextLength = 6
//                        currentNumberFormatter.maximumFractionDigits = 6
//                    }else{
//                        afterCommaTextLength = 2
//                        currentNumberFormatter.maximumFractionDigits = 2
//                    }
//                    if afterCommaText.count > afterCommaTextLength {
//                        firstText.removeLast()
//                        afterCommaText.removeLast()
//                    }
//                }
//
//                let tempNumber = currentNumberFormatter.number(from: firstText)
//                let tempString = currentNumberFormatter.string(from: tempNumber!)

//                if tempString == "0" {
//                    if firstText == "0,0" {
//                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,0"
//                    }else if firstText == "0,00" {
//                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,00"
//                    }else if firstText == "0,000" {
//                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,000"
//                    }else if firstText == "0,0000" {
//                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,0000"
//                    }else if firstText == "0,00000" || firstText == "0,000000" {
//                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,00000"
//                    }else{
//                        purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,"
//                        firstZeroAndComma = true
//                    }
//                }else if tempString != "0" && firstText.last == ","{
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@,", tempString!)
//
//                }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 1 {
//
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@,0", tempString!)
//
//                }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 2 {
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@0", tempString!)
//
//                }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 3 {
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@0", tempString!)
//
//                }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 4 {
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@0", tempString!)
//
//                }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 5 {
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@0", tempString!)
//
//                }else if firstText.contains(",") && firstText.last == "0" && afterCommaText.count == 6 {
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@0", tempString!)



//                        let afterCommaTextLength: Int!
//                        if firstText.contains("0,") {
//                            afterCommaTextLength = 6
//                            currentNumberFormatter.maximumFractionDigits = 6
//                        }else{
//                            afterCommaTextLength = 2
//                            currentNumberFormatter.maximumFractionDigits = 2
//                        }



//                    let tempStart:String.Index!
//                    if firstText.count == 1 {
//                        tempStart = firstText?.index((firstText?.startIndex)!, offsetBy: 0)
//                    }else{
//                        tempStart = firstText?.index((firstText?.startIndex)!, offsetBy: 1)
//                    }



//**************************************************************************************************
//            var firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
//DONE
//            if firstTextFieldText?.count != 0 && !(firstTextFieldText!.contains("$")) {
//                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = String(format: "$%@", firstTextFieldText!)
//                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
//            }
//DONE
//            if firstTextFieldText?.first == "$" && firstTextFieldText?.count == 1 {
//                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = ""
//                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
//            }
//DONE
//            if firstTextFieldText == "$0" {
//                if firstZeroAndComma {
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = ""
//                    firstZeroAndComma = false
//                }else{
//                    purchaseExchangeRateCell.purchaseExchangeRateTextField.text = "$0,"
//                    firstZeroAndComma = true
//                }
//                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
//            }
//DONE
//            if (firstTextFieldText?.contains(","))! && countInstances(of: ",", in: firstTextFieldText!) > 1 {
//                firstTextFieldText?.removeLast()
//                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = firstTextFieldText
//            }
//
//            if firstTextFieldText?.count != 0 {
//                let start = firstTextFieldText?.index((firstTextFieldText?.startIndex)!, offsetBy: 1)
//                let end = firstTextFieldText?.index((firstTextFieldText?.endIndex)!, offsetBy: 0)
//                let range = start! ..< end!
//
//                var rateNumberString = String(firstTextFieldText![range])
//                if rateNumberString.range(of: ",") != nil {
//                    rateNumberString = rateNumberString.replacingOccurrences(of: ",", with: ".")
//                }
//                let rateNumber = (rateNumberString as NSString).doubleValue
//                purchaseExchangeRateValue = rateNumber
//
//                if currencyAmountCell.currencyAmountTextField.text?.count != 0 {
//                    purchaseSumValue = purchaseExchangeRateValue * currencyAmountValue
//                    purchaseSumCell.purchaseSumTextField.text = String(format: "$%.2f", purchaseSumValue!)
//                }
//                print("\(rateNumber)")
//            }
//**************************************************************************************************



//**************************************************************************************************
//            if secondTextFieldText?.count != 0 && !(secondTextFieldText!.contains("$")) {
//                purchaseSumCell.purchaseSumTextField.text = String(format: "$%@", secondTextFieldText!)
//                secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
//            }
//            if secondTextFieldText?.first == "$" && secondTextFieldText?.count == 1 {
//                purchaseSumCell.purchaseSumTextField.text = ""
//                secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
//            }
//            if secondTextFieldText == "$0" {
//                if firstZeroAndComma {
//                    purchaseSumCell.purchaseSumTextField.text = ""
//                    firstZeroAndComma = false
//                }else{
//                    purchaseSumCell.purchaseSumTextField.text = "$0,"
//                    firstZeroAndComma = true
//                }
//                secondTextFieldText = purchaseSumCell.purchaseSumTextField.text
//            }
//            if (secondTextFieldText?.contains(","))! && countInstances(of: ",", in: secondTextFieldText!) > 1 {
//                secondTextFieldText?.removeLast()
//                purchaseSumCell.purchaseSumTextField.text = secondTextFieldText
//            }

//            if secondTextFieldText?.count != 0 {
//                let start = secondTextFieldText?.index((secondTextFieldText?.startIndex)!, offsetBy: 1)
//                let end = secondTextFieldText?.index((secondTextFieldText?.endIndex)!, offsetBy: 0)
//                let range = start! ..< end!
//
//                var rateNumberString = String(secondTextFieldText![range])
//                if rateNumberString.range(of: ",") != nil {
//                    rateNumberString = rateNumberString.replacingOccurrences(of: ",", with: ".")
//                }
//                let rateNumber = (rateNumberString as NSString).doubleValue
//                purchaseSumValue = rateNumber
//
//                if purchaseExchangeRateCell.purchaseExchangeRateTextField.text?.count != 0 {
//                    currencyAmountValue = purchaseSumValue / purchaseExchangeRateValue
//                    currencyAmountCell.currencyAmountTextField.text = String(format: "%f", currencyAmountValue!)
//                }
//                print("\(rateNumber)")
//            }
//**************************************************************************************************



//**************************************************************************************************
//            if thirdTextFieldText == "0" {
//                if thirdZeroAndComma {
//                    currencyAmountCell.currencyAmountTextField.text = ""
//                    thirdZeroAndComma = false
//                }else{
//                    currencyAmountCell.currencyAmountTextField.text = "0,"
//                    thirdZeroAndComma = true
//                }
//                thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
//            }
//            if (thirdTextFieldText?.contains(","))! && countInstances(of: ",", in: thirdTextFieldText!) > 1 {
//                thirdTextFieldText?.removeLast()
//                currencyAmountCell.currencyAmountTextField.text = thirdTextFieldText
//            }

//            if thirdTextFieldText?.count != 0 {
//                let start = thirdTextFieldText?.index((thirdTextFieldText?.startIndex)!, offsetBy: 0)
//                let end = thirdTextFieldText?.index((thirdTextFieldText?.endIndex)!, offsetBy: 0)
//                let range = start! ..< end!
//
//                var rateNumberString = String(thirdTextFieldText![range])
//                if rateNumberString.range(of: ",") != nil {
//                    rateNumberString = rateNumberString.replacingOccurrences(of: ",", with: ".")
//                }
//                let rateNumber = (rateNumberString as NSString).doubleValue
//                currencyAmountValue = rateNumber
//
//                if purchaseExchangeRateCell.purchaseExchangeRateTextField.text?.count != 0 {
//                    purchaseSumValue = purchaseExchangeRateValue * currencyAmountValue
//                    purchaseSumCell.purchaseSumTextField.text = String(format: "$%.2f", purchaseSumValue!)
//                }
//                print("\(rateNumber)")
//            }
//**************************************************************************************************
