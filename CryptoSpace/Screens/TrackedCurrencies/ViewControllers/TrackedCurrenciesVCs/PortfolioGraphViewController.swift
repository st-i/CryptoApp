//
//  PortfolioGraphViewController.swift
//  CryptoSpace
//
//  Created by Иван Стефанов on 28.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class PortfolioGraphViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var portfolioGraphDataSourceAndDelegate:PortfolioGraphDataSourceAndDelegate!
    var arrayWithCells = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let titleViewLabel = UILabel.init(frame: titleView.frame)
        titleViewLabel.textAlignment = .center
        titleViewLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        titleViewLabel.textColor = UIColor.white
        titleViewLabel.text = "Статистика"
        titleView.addSubview(titleViewLabel)
        navigationItem.titleView = titleView
    
        fillTableViewWithData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        animateCurrenciesColumns()
    }
    
    func fillTableViewWithData() {
        tableView.backgroundColor = UIColor.groupTableViewBackground
        portfolioGraphDataSourceAndDelegate = PortfolioGraphDataSourceAndDelegate()
        
        tableView.dataSource = portfolioGraphDataSourceAndDelegate
        tableView.delegate = portfolioGraphDataSourceAndDelegate
        
        arrayWithCells = PortfolioGraphScreenDirector.createCells(for: tableView)

        portfolioGraphDataSourceAndDelegate.arrayWithCells = arrayWithCells
    }
    
    func animateCurrenciesColumns() {
        for cellsArray:[PortfolioCurrencyGraphCell] in arrayWithCells as! [[PortfolioCurrencyGraphCell]] {
            for columnCell:PortfolioCurrencyGraphCell in cellsArray {
                let columnRect = columnCell.currencyColumnView.frame
                
                UIView.animate(withDuration: 0.9, delay: 0, options: .curveEaseOut, animations: {
                    columnCell.currencyColumnView.frame = CGRect.init(x: columnRect.origin.x, y: columnRect.origin.y, width: columnCell.currencyColumnWidth, height: columnRect.height)
                }, completion: nil)
                
            }
        }
    }
}
