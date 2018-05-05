//
//  PortfolioGraphViewController.swift
//  CryptoSpace
//
//  Created by st.i on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class PortfolioGraphViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var portfolioGraphDataSourceAndDelegate:PortfolioGraphDataSourceAndDelegate!
    var displayModelsArray = [GraphViewModel]()
    var arrayWithCells = [PortfolioCurrencyGraphCell]()
    var graphWasAnimated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.navBarColor()
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Статистика"
        titleView.addSubview(titleViewLabel)
        navigationItem.titleView = titleView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "X", style: .plain, target: self, action: #selector(dismissViewController))
    
        fillTableViewWithData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if graphWasAnimated == false {
            animateCurrenciesColumns()
            graphWasAnimated = true
        }
    }
    
    func fillTableViewWithData() {
        tableView.backgroundColor = UIColor.white
        portfolioGraphDataSourceAndDelegate = PortfolioGraphDataSourceAndDelegate()
        
        tableView.dataSource = portfolioGraphDataSourceAndDelegate
        tableView.delegate = portfolioGraphDataSourceAndDelegate
        
        arrayWithCells = PortfolioGraphScreenDirector.createCells(tableView, displayModels: displayModelsArray)

        portfolioGraphDataSourceAndDelegate.arrayWithCells = arrayWithCells
    }
    
    func animateCurrenciesColumns() {
        for columnCell:PortfolioCurrencyGraphCell in arrayWithCells {
            let columnRect = columnCell.currencyColumnView.frame
            
            UIView.animate(withDuration: 0.9, delay: 0, options: .curveEaseOut, animations: {
                columnCell.currencyColumnView.frame = CGRect.init(x: columnRect.origin.x, y: columnRect.origin.y, width: columnCell.currencyColumnWidth, height: columnRect.height)
            }, completion: nil)
            
        }
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}
