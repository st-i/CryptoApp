//
//  EmptyCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 05.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kEmptyCellIdentifier = "EmptyCell"

class EmptyCellBuilder: NSObject {
    
    class func buildEmptyCell(tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kEmptyCellIdentifier) as! EmptyCell
        cell.selectionStyle = .none
        
        return cell
    }
}

