//
//  SettingsDataSourceAndDelegate.swift
//  CryptoSpace
//
//  Created by st.i on 27.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

private let kStandardCellHeight: CGFloat = 50.0
private let kBasicSettingsCellIdentifier = "basicSettingsCell"

class SettingsDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewController = SettingsViewController()
    
    //MARK: dataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kBasicSettingsCellIdentifier)
        
        if indexPath.row == 0 {
            cell?.textLabel?.text = "Ответственность"
        }else{
            cell?.textLabel?.text = "О приложении"
        }
        
        return cell!
    }
    
    //MARK: delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kStandardCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableView.frame.height - (kStandardCellHeight * 2)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
            let responsibilityVC = storyboard.instantiateViewController(withIdentifier: "ResponsibilityViewController")
            self.viewController.navigationController?.pushViewController(responsibilityVC, animated: true)
        }else{
            let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
            let aboutAppVC = storyboard.instantiateViewController(withIdentifier: "AboutAppViewController")
            self.viewController.navigationController?.pushViewController(aboutAppVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 100.0, width: tableView.frame.width, height: tableView.frame.height - 100.0))
        let appVersionLabel = UILabel.init(frame: CGRect(x: 0, y: 10, width: footerView.frame.width, height: 30))
        appVersionLabel.textAlignment = .center
        appVersionLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        appVersionLabel.textColor = UIColor.gray
        appVersionLabel.text = "Версия 1.0.0"
        footerView.addSubview(appVersionLabel)
        
        return footerView
    }
}
