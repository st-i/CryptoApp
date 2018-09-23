//
//  TrackedCurrencyViewController.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TrackedCurrencyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var bannerView: GADBannerView!

    var trackedCurrencyDataSource:TrackedCurrencyDataSource!
    var trackedCurrencyDelegate:TrackedCurrencyDelegate!
    
    var animationTimer = Timer()
    
    var currentCoin: Coin!
    var trackedGroupedCoins = [Coin]()
    
    var firstCell: CommonCoinInfoCell!
    
    var viewDidLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        
        bannerView.adUnitID = coinDetailsAdMobBannerId //testAdMobAppId
        bannerView.rootViewController = self
        let adRequest = GADRequest()
//        adRequest.testDevices = [kGADSimulatorID]
        bannerView.load(adRequest)
        bannerView.delegate = self
        
        addBannerViewToView(bannerView)
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = currentCoin.shortName //"Bitcoin"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "TrashBin"), style: .plain, target: self, action: #selector(deleteCoinGroupAction))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        fillTableViewWithData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if !viewDidLoaded {
            startCurrencyImageAnimation()
            
            animationTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(startCurrencyImageAnimation), userInfo: nil, repeats: true)
            
            viewDidLoaded = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        animationTimer.invalidate()
    }
    
    func fillTableViewWithData() {
        
        tableView.backgroundColor = UIColor.white
        trackedCurrencyDataSource = TrackedCurrencyDataSource()
        trackedCurrencyDelegate = TrackedCurrencyDelegate()
    
        tableView.dataSource = trackedCurrencyDataSource
        tableView.delegate = trackedCurrencyDelegate
    
        let modelsArray = CertainCoinInfoMapper.mapTrackedCoinToInfoModelsArray(coin: currentCoin)
    
        trackedCurrencyDataSource.viewController = self
        trackedCurrencyDataSource.modelsArray = modelsArray
        trackedCurrencyDelegate.modelsArray = modelsArray
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
        
        let alert = UIAlertController.init(title: "Удалить позицию?", message: "Все покупки данной криптовалюты также будут удалены", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Отмена", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction.init(title: "Удалить", style: .default, handler: { (action) in
            CoreDataManager.shared.deleteGroupOfTrackedUserCoinsFromCoreData(coinShortName: self.currentCoin.shortName)
            for trackedCoin in self.trackedGroupedCoins {
                if trackedCoin.shortName == self.currentCoin.shortName {
                    self.trackedGroupedCoins.remove(at: self.trackedGroupedCoins.index(of: trackedCoin)!)
                }
            }
            CoinsOrderManager.updateCoinsOrder(coinsType: .Tracked, disorderedCoins: self.trackedGroupedCoins)
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true, completion: nil)
    }
}
