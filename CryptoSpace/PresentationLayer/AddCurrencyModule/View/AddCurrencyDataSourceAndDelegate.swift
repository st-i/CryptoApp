//
//  AddCurrencyDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 01.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kStandardCellHeight = 50
private let kDefaultNumberCellHeight = 40
private let kUserNumberCellHeight = 68
private let kNotesCellHeight = 110

class AddCurrencyDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewController = AddCurrencyViewController()
    
    var currencyPurchase = Bool()
    var actionСhoice = Bool()
    
    var choiceBlurView = UIView()
    var viewAboveDatePicker = UIView()
    var dateChoiceBlurView = UIView()
    
    var purchaseDatePicker = UIDatePicker()
    
    var purchaseButton = ActionChoiceButton()
    var exchangeRateButton = ActionChoiceButton()
    
    var currencyPurchaseImageView = UIImageView()
    var trackExchangeRateImageView = UIImageView()
    var actionCheckmarkImageView = UIImageView()
    
    var indicatorWasShown = false
    
    var purchaseDate: Date?
    
    var addCoinModel = AddCoinModel()
    
    override init() {
        super.init()
        self.createChoiceView()
        createDateChoiceView()
    }
    
    //MARK: dataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            if self.currencyPurchase {
                return 7
            }else{
                return 2
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if self.currencyPurchase {
                return ActionWithCurrencyCellBuilder.buildActionWithCurrencyCell(for: tableView, leftText: "Покупка")
            }else{
                return ActionWithCurrencyCellBuilder.buildActionWithCurrencyCell(for: tableView, leftText: "Отслеживание курса")
            }
        }else{
            return self.cellWithOperationSetting(tableView: tableView, rowNumber: indexPath.row)
        }
    }
    
    //MARK: delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 {
                return CGFloat(kUserNumberCellHeight)
            }else if indexPath.row == 0 {
                return 60
            }else if indexPath.row == 6 {
                return CGFloat(kNotesCellHeight)
            }else{
                return CGFloat(kDefaultNumberCellHeight)
            }
        }else{
            return CGFloat(kStandardCellHeight)
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0.5
        }else{
            return CGFloat.leastNormalMagnitude
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 30.0
        }else{
            return CGFloat.leastNormalMagnitude
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
            
            let firstIndexPath = IndexPath.init(row: 0, section: 0)
            let cell = tableView.cellForRow(at: firstIndexPath) as! ActionWithCurrencyCell
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                cell.arrowImageView.transform = cell.arrowImageView.transform.rotated(by: .pi)
            }, completion:nil)
            
            if actionСhoice {
                self.hideChoiceView()
                self.actionСhoice = false
                tableView.isScrollEnabled = true
            }else{
                self.showChoiceView()
                self.actionСhoice = true
                tableView.isScrollEnabled = false
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 2 {
                showDatePicker()
            }
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.5))
            if section == 1 {
                headerView.backgroundColor = UIColor.init(red: 154.0 / 255.0, green: 154.0 / 255.0, blue: 154.0 / 255.0, alpha: 0.4)
            }else{
                headerView.backgroundColor = UIColor.white
            }
            return headerView
        }else{
            return nil
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            return UIView.init()
        }else{
            return nil
        }
    }
    
    //MARK: Methods
    func cellWithOperationSetting(tableView: UITableView, rowNumber: Int) -> UITableViewCell {
        if self.currencyPurchase {
            switch rowNumber {
            case 0:
                return CurrencyPairCellBuilder.buildCurrencyPairCell(for: tableView, coinId: addCoinModel.currentCoin.id, coinName: addCoinModel.currentCoin.fullName)
                
            case 1:
                return CurrentExchangeRateCellBuilder.buildCurrentExchangeRateCell(for: tableView, leftText: "Текущий курс", exchangeRateString: addCoinModel.coinExchangeRate)
                
            case 2:
                return ActionWithCurrencyDateCellBuilder.buildActionWithCurrencyDateCell(for: tableView, date: addCoinModel.dateString)
                
            case 3:
                return PurchaseExchangeRateCellBuilder.buildPurchaseExchangeRateCell(for: tableView, delegate: self.viewController, exchangeRateString: addCoinModel.coinExchangeRate)
                
            case 4:
                return CurrencyAmountCellBuilder.buildCurrencyAmountCell(for: tableView, delegate: self.viewController)
                
            case 5:
                return PurchaseSumCellBuilder.buildPurchaseSumCell(for: tableView, delegate: self.viewController)
                
            case 6:
                return NotesCellBuilder.buildNotesCell(for: tableView)
                
            default:
                return PurchaseSumCellBuilder.buildPurchaseSumCell(for: tableView, delegate: self.viewController)
            }
        }else{
            switch rowNumber {
            case 0:
                return CurrencyPairCellBuilder.buildCurrencyPairCell(for: tableView, coinId: addCoinModel.currentCoin.id, coinName: addCoinModel.currentCoin.fullName)
                
            case 1:
                return CurrentExchangeRateCellBuilder.buildCurrentExchangeRateCell(for: tableView, leftText: "Текущий курс", exchangeRateString: addCoinModel.coinExchangeRate)
                
            default:
                return CurrentExchangeRateCellBuilder.buildCurrentExchangeRateCell(for: tableView, leftText: "Текущий курс", exchangeRateString: addCoinModel.coinExchangeRate)
            }
        }
    }
    
    //MARK: action with currency choice
    func createChoiceView() {
        self.choiceBlurView = UIView.init(frame: CGRect(x: 0, y: 50.5, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 114))
        self.choiceBlurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        let purchase = ActionChoiceButton.init(type: .custom)
        purchase.addTarget(self, action: #selector(purchaseAction), for: .touchUpInside)
        purchase.titleEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        purchase.setTitleColor(UIColor.black, for: .normal)
        purchase.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        purchase.contentHorizontalAlignment = .left
        purchase.frame = CGRect.init(x: 0, y: 0, width: self.choiceBlurView.frame.width, height: 0)
        purchase.backgroundColor = UIColor.white
        
        let purchaseImageView = UIImageView.init(frame: CGRect.init(x: 15, y: 12, width: 26, height: 26))
        purchaseImageView.image = UIImage(named:"Purchase")
        self.currencyPurchaseImageView = purchaseImageView
        
        let checkmarkImageView = UIImageView.init(frame: CGRect.init(x: purchase.frame.width - 41, y: 17, width: 15, height: 15))
        checkmarkImageView.image = UIImage(named:"Checkmark")
        self.actionCheckmarkImageView = checkmarkImageView
        
        self.purchaseButton = purchase
        self.choiceBlurView.addSubview(self.purchaseButton)
        
        let exchangeRate = ActionChoiceButton.init(type: .custom)
        exchangeRate.addTarget(self, action: #selector(trackExchangeRateAction), for: .touchUpInside)
        exchangeRate.titleEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        exchangeRate.setTitleColor(UIColor.black, for: .normal)
        exchangeRate.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        exchangeRate.contentHorizontalAlignment = .left
        exchangeRate.frame = CGRect.init(x: 0, y: 50, width: self.choiceBlurView.frame.width, height: 0)
        exchangeRate.backgroundColor = UIColor.white
        
        let trackRateImageView = UIImageView.init(frame: CGRect.init(x: 15, y: 14, width: 26, height: 26))
        trackRateImageView.image = UIImage(named:"Binoculars")
        self.trackExchangeRateImageView = trackRateImageView
        
        self.exchangeRateButton = exchangeRate
        self.choiceBlurView.addSubview(self.exchangeRateButton)
    }
    
    func showChoiceView() {
        self.viewController.view.addSubview(self.choiceBlurView)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.choiceBlurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            self.purchaseButton.frame = CGRect.init(x: 0, y: 0, width: self.choiceBlurView.frame.width, height: 50)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.exchangeRateButton.frame = CGRect.init(x: 0, y: 50, width: self.choiceBlurView.frame.width, height: 50)
            }, completion: { (true) in
                
                self.purchaseButton.addSubview(self.currencyPurchaseImageView)
                self.purchaseButton.setTitle("Покупка", for: .normal)
            
                self.exchangeRateButton.addSubview(self.trackExchangeRateImageView)
                self.exchangeRateButton.setTitle("Отслеживание курса", for: .normal)
                
                if self.currencyPurchase {
                    self.purchaseButton.addSubview(self.actionCheckmarkImageView)
                }else{
                    self.exchangeRateButton.addSubview(self.actionCheckmarkImageView)
                }
            })
        })
        
        viewController.tableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.viewController.tableView.isUserInteractionEnabled = true
        }
    }
    
    func hideChoiceView() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.choiceBlurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            self.exchangeRateButton.frame = CGRect.init(x: 0, y: 50, width: self.choiceBlurView.frame.width, height: 0)
            
            self.currencyPurchaseImageView.removeFromSuperview()
            self.purchaseButton.setTitle("", for: .normal)
            
            self.trackExchangeRateImageView.removeFromSuperview()
            self.exchangeRateButton.setTitle("", for: .normal)
            
            self.actionCheckmarkImageView.removeFromSuperview()
        }, completion: { (true) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.purchaseButton.frame = CGRect.init(x: 0, y: 0, width: self.choiceBlurView.frame.width, height: 0)
            }, completion: { (true) in
                self.choiceBlurView.removeFromSuperview()
            })
        })
    }
    
    @objc func purchaseAction() {
        let firstIndexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.viewController.tableView.cellForRow(at: firstIndexPath) as! ActionWithCurrencyCell
        
        if !self.currencyPurchase {
            self.currencyPurchase = true
            let indexPaths = NSMutableArray()
            for i in 2..<7 {
                let currentIndexPath = IndexPath.init(row: i, section: 1)
                indexPaths.add(currentIndexPath)
            }
            cell.leftTextLabel.text = "Покупка"
            
            self.viewController.tableView.beginUpdates()
            self.viewController.tableView.insertRows(at: indexPaths as! [IndexPath], with: .bottom)
            self.viewController.tableView.endUpdates()
            
            viewController.enableOrDisableAddButton()
        }
        
        self.hideChoiceView()
        self.actionСhoice = false
        self.viewController.tableView.isScrollEnabled = true
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            cell.arrowImageView.transform = cell.arrowImageView.transform.rotated(by: .pi)
        }, completion: nil)
    }
    
    @objc func trackExchangeRateAction() {
        let firstIndexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.viewController.tableView.cellForRow(at: firstIndexPath) as! ActionWithCurrencyCell
        if self.currencyPurchase {
            self.currencyPurchase = false
            let indexPaths = NSMutableArray()
            for i in 2..<7 {
                let currentIndexPath = IndexPath.init(row: i, section: 1)
                indexPaths.add(currentIndexPath)
            }
            cell.leftTextLabel.text = "Отслеживание курса"
            
            self.viewController.tableView.beginUpdates()
            self.viewController.tableView.deleteRows(at: indexPaths as! [IndexPath], with: .top)
            self.viewController.tableView.endUpdates()
            
            viewController.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        self.hideChoiceView()
        self.actionСhoice = false
        self.viewController.tableView.isScrollEnabled = true
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            cell.arrowImageView.transform = cell.arrowImageView.transform.rotated(by: .pi)
        }, completion: nil)
    }
    
    //MARK: purchase date picker (date choice)
    func datePickerInputAccessoryView () -> UIView {
        let helperView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 40))
        helperView.backgroundColor = UIColor.white
        
        let cancelButton = UIButton.init(type: .custom)
        cancelButton.addTarget(self, action: #selector(hideDatePicker), for: .touchUpInside)
        cancelButton.setTitleColor(UIColor.init(red: 0.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0), for: .normal)
        cancelButton.setTitleColor(UIColor.groupTableViewBackground, for: .highlighted)
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelButton.contentHorizontalAlignment = .left
        cancelButton.frame = CGRect.init(x: 20, y: 0, width: 70, height: 40)
        cancelButton.backgroundColor = UIColor.clear
        helperView.addSubview(cancelButton)
        
        let chooseDateButton = UIButton.init(type: .custom)
        chooseDateButton.addTarget(self, action: #selector(datePickerChooseAction), for: .touchUpInside)
        chooseDateButton.setTitleColor(UIColor.init(red: 0.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0), for: .normal)
        chooseDateButton.setTitleColor(UIColor.groupTableViewBackground, for: .highlighted)
        chooseDateButton.setTitle("Выбрать", for: .normal)
        chooseDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        chooseDateButton.contentHorizontalAlignment = .right
        chooseDateButton.frame = CGRect.init(x: helperView.frame.maxX - 90, y: 0, width: 70, height: 40)
        chooseDateButton.backgroundColor = UIColor.clear
        helperView.addSubview(chooseDateButton)
        
        return helperView
    }
    
    func createDateChoiceView() {
        //затемнение экрана
        dateChoiceBlurView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        dateChoiceBlurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        viewAboveDatePicker = datePickerInputAccessoryView()
        dateChoiceBlurView.addSubview(viewAboveDatePicker)
        
        let datePicker = UIDatePicker.init(frame: CGRect.init(x: 0, y: dateChoiceBlurView.frame.maxY + 40, width: dateChoiceBlurView.frame.width, height: 200))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale.init(identifier: "ru_RU")
        datePicker.date = Date()
        
        //создание datePicker
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        var minDateComponent = calendar.components([.day,.month,.year], from: Date())
        minDateComponent.day = 01
        minDateComponent.month = 01
        minDateComponent.year = 2005
        let minDate = calendar.date(from: minDateComponent)
        
        datePicker.minimumDate = minDate! as Date
        datePicker.maximumDate = Date()
        
        datePicker.backgroundColor = UIColor.white
        datePicker.inputAccessoryView?.insertSubview(datePickerInputAccessoryView(), at: 0)
        
        purchaseDatePicker = datePicker
        dateChoiceBlurView.addSubview(purchaseDatePicker)
    }
    
    func showDatePicker() {
        viewController.view.addSubview(dateChoiceBlurView)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.dateChoiceBlurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
            self.viewAboveDatePicker.frame.origin.y = self.dateChoiceBlurView.frame.maxY - 200 - 40 - 63
            self.purchaseDatePicker.frame.origin.y = self.dateChoiceBlurView.frame.maxY - 200 - 63
        }, completion: nil)
    }
    
    @objc func hideDatePicker() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.dateChoiceBlurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.0)
            self.viewAboveDatePicker.frame.origin.y = self.dateChoiceBlurView.frame.maxY
            self.purchaseDatePicker.frame.origin.y = self.dateChoiceBlurView.frame.maxY + 40
        }, completion: { (true) in
            self.dateChoiceBlurView.removeFromSuperview()
        })
    }
    
    @objc func datePickerChooseAction() {
        let purchaseDate = purchaseDatePicker.date
        self.purchaseDate = purchaseDate
        
        let purchaseDateString = DetailedDateFormatter.stringFromDate(date: purchaseDate)
        
        let dateCell = viewController.tableView.cellForRow(at: IndexPath.init(row: 2, section: 1)) as! ActionWithCurrencyDateCell
        dateCell.purchaseDateLabel.text = purchaseDateString
        addCoinModel.dateString = purchaseDateString
        hideDatePicker()
    }
}
