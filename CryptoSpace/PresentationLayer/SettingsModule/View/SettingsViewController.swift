//
//  SettingsViewController.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var bannerView: GADBannerView!

    var settingsDataSourceAndDelegate:SettingsDataSourceAndDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeMediumRectangle)
        bannerView.adUnitID = settingsAdMobBannerId //testAdMobAppId
        bannerView.rootViewController = self
        let adRequest = GADRequest()
//        adRequest.testDevices = [kGADSimulatorID]
        bannerView.load(adRequest)
        bannerView.delegate = self
        
        addBannerViewToView(bannerView)
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Информация"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        self.fillTableViewWithData()
    }
    
    func fillTableViewWithData() {
        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor.groupTableViewBackground
        settingsDataSourceAndDelegate = SettingsDataSourceAndDelegate()
        
        tableView.dataSource = settingsDataSourceAndDelegate
        tableView.delegate = settingsDataSourceAndDelegate
        
        settingsDataSourceAndDelegate.viewController = self
    }
}
