//
//  ActionChoiceCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 01.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kActionChoiceCellIdentifier = "ActionChoiceCell"

class ActionChoiceCellBuilder: NSObject {
    
    class func buildActionChoiceCell(for tableView: UITableView, mainText: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kActionChoiceCellIdentifier) as! ActionChoiceCell
        cell.mainTextLabel.text = mainText
        
        return cell
    }
}
