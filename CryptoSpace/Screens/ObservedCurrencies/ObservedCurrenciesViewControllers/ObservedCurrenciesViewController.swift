//
//  ObservedCurrenciesViewController.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedCurrenciesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var observedCurrenciesDataSource:ObservedCurrenciesDataSource!
    var observedCurrenciesDelegate:ObservedCurrenciesDelegate!
    
    var originalEditButton: UIBarButtonItem!
    var originalDoneButton: UIBarButtonItem!
    
    var requestManager: RequestManager!
    
    var cmcInfoModel: CMCInfoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Криптовалюты"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
        originalEditButton = UIBarButtonItem.init(title: "Изм.", style: .plain, target: self, action: #selector(editObservedCurrenciesAction))
        originalDoneButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(editObservedCurrenciesAction))
        self.navigationItem.rightBarButtonItem = originalEditButton
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
//        self.navigationItem.rightBarButtonItem =
//            UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editObservedCurrenciesAction))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addCoinAction))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshScreenValues)) // sendRequestForTest
        navigationItem.leftBarButtonItem = refreshButton
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        requestManager = RequestManager()

        self.fillTableViewWithData()
    }
    
    func fillTableViewWithData() {

        tableView.backgroundColor = UIColor.white //UIColor.groupTableViewBackground
        observedCurrenciesDataSource = ObservedCurrenciesDataSource()
        observedCurrenciesDelegate = ObservedCurrenciesDelegate()
        
        tableView.dataSource = observedCurrenciesDataSource
        tableView.delegate = observedCurrenciesDelegate
        
        let observedCoinsArray = CoreDataManager.shared.getObservedUserCoinsArray()
        
        cmcInfoModel = CMCInfoModel()
        observedCurrenciesDataSource.cmcInfoModel = cmcInfoModel
    }
    
    @objc func editObservedCurrenciesAction() {
        
        if isEditing {
            setEditing(false, animated: true)
            tableView.setEditing(false, animated: true)
            navigationItem.rightBarButtonItem = originalEditButton
        }else{
            setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
            navigationItem.rightBarButtonItem = originalDoneButton
        }
    }
    
    func addCoinAction() {
        
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController")
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc func refreshScreenValues() {
        
        requestManager.getCryptoMarketCap { (value) in
            let numberFormatter = GlobalNumberFormatter.createNumberFormatter(number: Double(value))
            numberFormatter.maximumFractionDigits = 0
            let cmcString = numberFormatter.string(from: NSNumber.init(value: value))!
            self.cmcInfoModel.marketCap = String(format: "$%@", cmcString)
            self.tableView.reloadData()
//            print(value)
        }
    }
}
