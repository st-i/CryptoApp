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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
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
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        self.fillTableViewWithData()
    }
    
    func fillTableViewWithData() {
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.observedCurrenciesDataSource = ObservedCurrenciesDataSource()
        self.observedCurrenciesDelegate = ObservedCurrenciesDelegate()
        
        self.tableView.dataSource = self.observedCurrenciesDataSource
        self.tableView.delegate = self.observedCurrenciesDelegate
        
        let tempArrayWithCells = ObservedCurrenciesDirector.createObservedCurrenciesCells(for: self.tableView)
        let arrayWithCells = NSMutableArray.init(array: tempArrayWithCells)

        self.observedCurrenciesDataSource.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
        self.observedCurrenciesDelegate.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
        
        self.observedCurrenciesDelegate.viewController = self
    }
    
    @IBAction func openCryptoMarketGraph(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let portfolioGraphVC = storyboard.instantiateViewController(withIdentifier: "PortfolioGraphViewController")
        navigationController?.pushViewController(portfolioGraphVC, animated: true)
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
}
