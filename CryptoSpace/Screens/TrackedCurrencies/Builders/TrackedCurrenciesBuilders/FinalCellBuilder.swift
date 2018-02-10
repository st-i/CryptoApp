//
//  FinalCellBuilder.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

private let kFinalCellIdentifier = "FinalCell"

class FinalCellBuilder: NSObject {
    
    class func buildFinalCell(for tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kFinalCellIdentifier) as! FinalCell
        cell.selectionStyle = .none
        cell.finalLineView.layer.cornerRadius = cell.finalLineView.frame.height/2
        cell.finalLineView.backgroundColor = UIColor.clear //UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        return cell
    }
}
