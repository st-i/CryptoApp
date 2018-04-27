//
//  TrackedCurrencyViewController.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrencyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var trackedCurrencyDataSource:TrackedCurrencyDataSource!
    var trackedCurrencyDelegate:TrackedCurrencyDelegate!
    
    var animationTimer = Timer()
    
    var currentCoin: Coin!
    
    var firstCell:CommonCoinInfoCell!
    
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .trash, target: self, action: #selector(deleteCoinGroupAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        self.fillTableViewWithData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.startCurrencyImageAnimation()
        
        self.animationTimer =
            Timer.scheduledTimer(timeInterval: 10.0, target: self,
                                 selector: #selector(startCurrencyImageAnimation),
                                 userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.animationTimer.invalidate()
    }
    
    func fillTableViewWithData() {
        self.tableView.backgroundColor = UIColor.white //groupTableViewBackground
        self.trackedCurrencyDataSource = TrackedCurrencyDataSource()
        self.trackedCurrencyDelegate = TrackedCurrencyDelegate()
    
        self.tableView.dataSource = self.trackedCurrencyDataSource
        self.tableView.delegate = self.trackedCurrencyDelegate
    
    
        let modelsArray = CertainCoinInfoMapper.mapTrackedCoinToInfoModelsArray(coin: currentCoin)
    
        self.trackedCurrencyDataSource.modelsArray = modelsArray
        self.trackedCurrencyDelegate.modelsArray = modelsArray
    }
    
    @objc func startCurrencyImageAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.duration = 1.0
        animation.fromValue = NSNumber.init(floatLiteral: 0)
        animation.toValue = NSNumber.init(floatLiteral: 2 * .pi)
    
        if firstCell == nil {
            firstCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! CommonCoinInfoCell
        }
        firstCell.currencyImageView.layer.add(animation, forKey: animation.keyPath)
    }
    
    @objc func deleteCoinGroupAction() {
        
    }
}
