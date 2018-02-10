//
//  TrackedCurrenciesViewController.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrenciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var trackedCurrenciesDataSource:TrackedCurrenciesDataSource!
    var trackedCurrenciesDelegate:TrackedCurrenciesDelegate!

    var originalEditButton: UIBarButtonItem!
    var originalDoneButton: UIBarButtonItem!
    var someVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        //init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Портфель"
        titleView.addSubview(titleViewLabel)
        self.navigationItem.titleView = titleView
        
        originalEditButton = UIBarButtonItem.init(title: "Изм.", style: .plain, target: self, action: #selector(editPortfolioAction))
//        (barButtonSystemItem: .edit, target: self, action: #selector(editPortfolioAction))
        originalDoneButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(editPortfolioAction))
//        (barButtonSystemItem: .done, target: self, action: #selector(editPortfolioAction))
        self.navigationItem.leftBarButtonItem = originalEditButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addTrackedCurrency))
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
        
        self.fillTableViewWithData()
    }
    
    func fillTableViewWithData() {
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.trackedCurrenciesDataSource = TrackedCurrenciesDataSource()
        self.trackedCurrenciesDelegate = TrackedCurrenciesDelegate()
        
        self.tableView.dataSource = self.trackedCurrenciesDataSource
        self.tableView.delegate = self.trackedCurrenciesDelegate
        
        let tempArrayWithCells = TrackedCurrenciesScreenDirector.createTrackedCurrenciesCells(for: self.tableView)
        let arrayWithCells = NSMutableArray.init(array: tempArrayWithCells)
        
        self.trackedCurrenciesDataSource.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
        self.trackedCurrenciesDelegate.arrayWithCells = arrayWithCells as! [[UITableViewCell]]
        
        self.trackedCurrenciesDelegate.viewController = self
    }
    
    @IBAction func openPortfolioGraph(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let portfolioGraphVC = storyboard.instantiateViewController(withIdentifier: "PortfolioGraphViewController")
        navigationController?.pushViewController(portfolioGraphVC, animated: true)
    }
    
    @objc func editPortfolioAction() {
        if isEditing {
            setEditing(false, animated: true)
            tableView.setEditing(false, animated: true)
            navigationItem.leftBarButtonItem = originalEditButton
        }else{
            setEditing(true, animated: true)
            tableView.setEditing(true, animated: true)
            navigationItem.leftBarButtonItem = originalDoneButton
        }
    }
    
    @objc func addTrackedCurrency() {
        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
        let searchCurrencyVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController") as! CurrencySearchViewController
//        searchCurrencyVC.isPresentedVC = true
        let navContr = UINavigationController.init(rootViewController: searchCurrencyVC)
        navigationController?.present(navContr, animated: true, completion: nil)
        
//        someVC = UIViewController()
//        someVC.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
//        let navContr = UINavigationController.init(rootViewController: someVC)
//        present(navContr, animated: true, completion: nil)
    }
    
//    @objc func dismissVC() {
//        someVC.dismiss(animated: true, completion: nil)
//    }
    
//    func addCoinAction() {
//        let storyboard = UIStoryboard.init(name: "TrackedCurrenciesStoryboard", bundle: nil)
//        let searchVC = storyboard.instantiateViewController(withIdentifier: "CurrencySearchViewController")
//        self.navigationController?.pushViewController(searchVC, animated: true)
//    }
}
