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
    
    var observedCurrencyDataSource:ObservedCurrencyDataSource!
    var observedCurrencyDelegate:ObservedCurrencyDelegate!
    
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .compose, target: self, action: #selector(changeCoinDetailsAction))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        self.fillTableViewWithData()
//
//        let firstSection = self.trackedCurrencyDelegate.arrayWithCells[0] as! NSMutableArray
//        let cell = firstSection[0] as! TrackedCurrencyCell
//        
//        UIView.animate(withDuration: 1.8, delay: 0.0,
//                       options: [.curveEaseInOut, .autoreverse, .repeat],
//                       animations: {
//                        cell.currencyImageView.frame.origin.y = 39
//        },
//                       completion: nil)
        
//        self.animationTimer =
//            Timer.scheduledTimer(timeInterval: 10.0, target: self,
//                                 selector: #selector(startCurrencyImageAnimation),
//                                 userInfo: nil, repeats: true)
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
        if (self.navigationController?.viewControllers[0].isKind(of: TrackedCurrenciesViewController.self))! {
            self.trackedCurrencyDataSource = TrackedCurrencyDataSource()
            self.trackedCurrencyDelegate = TrackedCurrencyDelegate()
        
            self.tableView.dataSource = self.trackedCurrencyDataSource
            self.tableView.delegate = self.trackedCurrencyDelegate
        
//            let arrayWithCells = TrackedCurrencyScreenDirector.createTrackedCurrencyCells(for: tableView, currentCoin: currentCoin)
            
            let modelsArray = CertainCoinInfoMapper.mapTrackedCoinToInfoModelsArray(coin: currentCoin)
            
            self.trackedCurrencyDataSource.modelsArray = modelsArray
            self.trackedCurrencyDelegate.modelsArray = modelsArray
        }else{
            self.observedCurrencyDataSource = ObservedCurrencyDataSource()
            self.observedCurrencyDelegate = ObservedCurrencyDelegate()
            
            self.tableView.dataSource = self.observedCurrencyDataSource
            self.tableView.delegate = self.observedCurrencyDelegate
            
            let arrayWithCells = ObservedCurrencyScreenDirector.createObservedCurrencyCells(for: self.tableView)
            
            self.observedCurrencyDataSource.arrayWithCells = arrayWithCells
            self.observedCurrencyDelegate.arrayWithCells = arrayWithCells
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.startCurrencyImageAnimation()
//        }
    }
    
    @objc func startCurrencyImageAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.duration = 1.0
        animation.fromValue = NSNumber.init(floatLiteral: 0)
        animation.toValue = NSNumber.init(floatLiteral: 2 * .pi)
        
        if (self.navigationController?.viewControllers[0] .isKind(of: TrackedCurrenciesViewController.self))! {
//            let firstSection = self.trackedCurrencyDelegate.arrayWithCells[0] as! [UITableViewCell]
//            let cell = firstSection[0] as! CommonCoinInfoCell
            if firstCell == nil {
                firstCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! CommonCoinInfoCell
            }
            firstCell.currencyImageView.layer.add(animation, forKey: animation.keyPath)
            
//            UIView.animate(withDuration: 1.5, delay: 0.0,
//                           options: [.curveEaseInOut, .autoreverse, .repeat],
//                           animations: {
//                            cell.currencyImageView.frame.origin.y = 35
//            },
//                           completion: nil)
        }else{
            let firstSection = self.observedCurrencyDelegate.arrayWithCells[0] as! NSMutableArray
            let cell = firstSection[0] as! ObservedCurrencyCell
            cell.observedCurrencyImageView.layer.add(animation, forKey: animation.keyPath)
        }
//
//            let theAnimation = CAKeyframeAnimation.init(keyPath: "transform.rotation.y")
//            theAnimation.values =
//                [NSValue(caTransform3D: CATransform3DMakeRotation(0, 0, 0, 1)),
//                 NSValue(caTransform3D: CATransform3DMakeRotation(3.13, 0, 0, 1)),
//                 NSValue(caTransform3D: CATransform3DMakeRotation(6.26, 0, 0, 1))]
//            theAnimation.isCumulative = true
//            theAnimation.duration = 3.0
//            theAnimation.repeatCount = 5
//            theAnimation.isRemovedOnCompletion = true
//            theAnimation.timingFunctions =
//                [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),
//                 CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
//            cell.observedCurrencyImageView.layer.add(theAnimation, forKey: "rotation")
            
//
////
//            let animation = CABasicAnimation.init(keyPath: "transform.rotation.y")
//            
//            var transform = CATransform3DMakeRotation(1.0, 1.0, 1.0, 1.0)
//            let fromValue = NSValue.init(caTransform3D: transform)
//            
//            transform = CATransform3DMakeRotation((.pi * 2) - 1, 0, 1.0, 0)
//            let toValue = NSValue(caTransform3D: transform)
//            animation.fromValue = fromValue
//            animation.toValue = toValue
//            animation.duration = 2.0
//            animation.repeatCount = 5
//            // HUGE_VALF is defined in math.h so import it
//            cell.observedCurrencyImageView.layer.add(animation, forKey: "rotation")
//
       
        
//            UIView.animate(withDuration: 3.0, delay: 0.0,
//                           options: [.curveEaseInOut, .repeat],
//                           animations: {
//                            cell.observedCurrencyImageView.layer.transform = CATransform3DMakeRotation((.pi * 2) - 1, 0, 1, 0)
//                            
//            },
//                           completion: nil)
    }

//    func stopCurrencyImageAnimation() {
//        let firstSection = self.trackedCurrencyDelegate.arrayWithCells[0] as! NSMutableArray
//        let cell = firstSection[0] as! TrackedCurrencyCell
//        
//        cell.currencyImageView.frame.origin.y = 27
//    }
    
    @objc func changeCoinDetailsAction() {
        
    }
}
