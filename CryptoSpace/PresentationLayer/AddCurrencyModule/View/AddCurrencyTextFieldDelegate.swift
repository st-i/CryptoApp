//
//  AddCurrencyTextFieldDelegate.swift
//  CryptoSpace
//
//  Created by st.i on 22.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

extension AddCurrencyViewController: UITextFieldDelegate {
    
    func viewAboveTextFieldKeyboard() -> UIView {
        let helperView = UIView.init(frame: CGRect.init(x: 0, y: view.bounds.height + 40, width: view.bounds.width, height: 40))
        helperView.backgroundColor = UIColor.init(red: 213.0 / 255.0, green: 217.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0)
        
        let nextTextFieldButton = UIButton.init(type: .custom)
        nextTextFieldButton.addTarget(self, action: #selector(nextTextFieldAction), for: .touchUpInside)
        nextTextFieldButton.setImage(UIImage.init(named: "NextArrow"), for: .normal)
        nextTextFieldButton.frame = CGRect.init(x: helperView.frame.midX - 15, y: helperView.bounds.midY - 15, width: 30, height: 30)
        nextTextFieldButton.backgroundColor = UIColor.clear
        helperView.addSubview(nextTextFieldButton)
        
        let doneButton = UIButton.init(type: .custom)
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        doneButton.setTitleColor(UIColor.init(red: 0.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0), for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .highlighted)
        doneButton.setTitle("Готово", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        doneButton.frame = CGRect.init(x: helperView.frame.maxX - 80, y: 0, width: 60, height: 40)
        doneButton.backgroundColor = UIColor.clear
        helperView.addSubview(doneButton)
        
        return helperView        
    }
    
    @objc func nextTextFieldAction() {
        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell
        
        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            currencyAmountCell.currencyAmountTextField.becomeFirstResponder()
        }else if currencyAmountCell.currencyAmountTextField.isFirstResponder {
            purchaseSumCell.purchaseSumTextField.becomeFirstResponder()
        }else{
            purchaseSumCell.purchaseSumTextField.resignFirstResponder()
            animateTableViewDown()
        }
    }
    
    @IBAction func cellTextFieldDidBeginEditingAction(_ sender: UITextField) {
        if needScrollToRateRow {
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 145.0, 0)
            self.tableView.scrollToRow(at: IndexPath.init(row: 3, section: 1), at: .top, animated: true)
            self.tableView.isScrollEnabled = false
            needScrollToRateRow = false
        }
        
        let purchaseExchangeRateCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 1)) as! PurchaseExchangeRateCell
        let currencyAmountCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 1)) as! CurrencyAmountCell
        let purchaseSumCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 1)) as! PurchaseSumCell
        
        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            purchaseExchangeRateCell.purchaseExchangeRateTextField.inputAccessoryView = viewAboveTextFieldKeyboard()
        }else if currencyAmountCell.currencyAmountTextField.isFirstResponder {
            currencyAmountCell.currencyAmountTextField.inputAccessoryView = viewAboveTextFieldKeyboard()
        }else{
            purchaseSumCell.purchaseSumTextField.inputAccessoryView = viewAboveTextFieldKeyboard()
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
        
        //первый текстФилд - курс покупки
        if purchaseExchangeRateCell.purchaseExchangeRateTextField.isFirstResponder {
            
            var firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            
            if firstTextFieldText?.first == "$" && firstTextFieldText?.count == 1 {
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = ""
                firstTextFieldText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
            }
            
            //из-за ios 11
            if (firstTextFieldText?.contains(","))! && (firstTextFieldText?.contains("."))! {
                firstTextFieldText?.removeLast()
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = firstTextFieldText
            }
            
            //из-за ios 11
            if (firstTextFieldText?.contains("."))! {
                firstTextFieldText = replaceDotWithComma(firstTextFieldText!)
                purchaseExchangeRateCell.purchaseExchangeRateTextField.text = firstTextFieldText
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
//                    print(tempString!)
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
            
            //из-за ios 11
            if (secondTextFieldText?.contains(","))! && (secondTextFieldText?.contains("."))! {
                secondTextFieldText?.removeLast()
                purchaseSumCell.purchaseSumTextField.text = secondTextFieldText
            }
            
            //из-за ios 11
            if (secondTextFieldText?.contains("."))! {
                secondTextFieldText = replaceDotWithComma(secondTextFieldText!)
                purchaseSumCell.purchaseSumTextField.text = secondTextFieldText
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
//                    print(tempString!)
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
            
            //из-за ios 11
            if (thirdTextFieldText?.contains(","))! && (thirdTextFieldText?.contains("."))! {
                thirdTextFieldText?.removeLast()
                currencyAmountCell.currencyAmountTextField.text = thirdTextFieldText
            }
            
            //из-за ios 11
            if (thirdTextFieldText?.contains("."))! {
                thirdTextFieldText = replaceDotWithComma(thirdTextFieldText!)
                currencyAmountCell.currencyAmountTextField.text = thirdTextFieldText
            }
            
            if thirdTextFieldText?.first == "," && thirdTextFieldText?.count == 1 {
                currencyAmountCell.currencyAmountTextField.text = "0,"
                thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
            }
            
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
                        let start = thirdText?.index(thirdText.index(of: ",")!, offsetBy: 1)
                        let end = thirdText?.index((thirdText?.endIndex)!, offsetBy: 0)
                        let range = start! ..< end!
                        afterCommaText = String(thirdText![range])
                        
                        let start1 = thirdText?.index((thirdText.startIndex), offsetBy: 0)
                        let end1 = thirdText?.index(thirdText.index(of: ",")!, offsetBy: 0)
                        let range1 = start1! ..< end1!
                        beforeCommaText = String(thirdText![range1])
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
                    }else{
                        currencyAmountCell.currencyAmountTextField.text = String(format: "%@", tempString!)
                    }
//                    print(tempString!)
                }
            }
            
            thirdTextFieldText = currencyAmountCell.currencyAmountTextField.text
            
            //умножение
            if thirdTextFieldText?.count != 0 {
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
                }
            }else{
                purchaseSumCell.purchaseSumTextField.text = ""
            }
        }
        
        purchaseExchRateText = purchaseExchangeRateCell.purchaseExchangeRateTextField.text
        currencyAmountText = currencyAmountCell.currencyAmountTextField.text
        purchaseSumText = purchaseSumCell.purchaseSumTextField.text
        enableOrDisableAddButton()
    }
    
    func replaceDotWithComma(_ textForReplacing: String) -> String {
        let dotRange = textForReplacing.range(of: ".", options: .diacriticInsensitive)
        let newString = textForReplacing.replacingCharacters(in: dotRange!, with: ",")

        return newString
    }
}
