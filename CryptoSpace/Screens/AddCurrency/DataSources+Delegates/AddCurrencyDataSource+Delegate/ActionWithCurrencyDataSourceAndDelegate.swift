//
//  ActionWithCurrencyDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 06.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kActionChoiceCellIdentifier = "ActionChoiceCell"

class ActionWithCurrencyDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {

//    override init() {
//        super.init()
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kActionChoiceCellIdentifier) as! ActionChoiceCell
        print("numberOfRowsInSection")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemCell")!
////        if cell == nil {
////            cell = UITableViewCell.init(style: .default, reuseIdentifier: "SystemCell")
////        }
        
        if indexPath.row == 0 {
            cell.mainTextLabel?.text = "Покупка"
        }else{
            cell.mainTextLabel?.text = "Отслеживание курса"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
