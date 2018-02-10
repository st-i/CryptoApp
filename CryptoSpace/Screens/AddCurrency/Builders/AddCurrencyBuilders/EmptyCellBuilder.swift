//
//  EmptyCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 05.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kEmptyCellIdentifier = "EmptyCell"
//var menuView: BTNavigationDropdownMenu!

class EmptyCellBuilder: NSObject {
    
    class func buildEmptyCell(tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kEmptyCellIdentifier) as! EmptyCell
        cell.selectionStyle = .none
        
//        let items = ["Покупка", "Отслеживать курс"]
//        
//        let menuView = BTNavigationDropdownMenu(containerView: cell.containerView, title: BTTitle.index(0), items: items)
//        
//        menuView.cellHeight = 50
//        menuView.cellBackgroundColor = UIColor.groupTableViewBackground
//        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
//        menuView.shouldKeepSelectedCellColor = true
//        menuView.cellTextLabelColor = UIColor.white
//        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
//        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
//        menuView.arrowPadding = 15
//        menuView.animationDuration = 0.5
//        menuView.maskBackgroundColor = UIColor.black
//        menuView.maskBackgroundOpacity = 0.3
//        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> Void in
//            print("Did select item at index: \(indexPath)")
////            self.selectedCellLabel.text = items[indexPath]
//        }
//        
//        cell.containerView = menuView
        
        return cell
    }

}

