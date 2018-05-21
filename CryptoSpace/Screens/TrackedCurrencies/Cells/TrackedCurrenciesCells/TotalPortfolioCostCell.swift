//
//  TotalPortfolioCostCell.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TotalPortfolioCostCell: UITableViewCell {
    
    @IBOutlet weak var totalPortfolioValueLabel: UILabel!
    @IBOutlet weak var portfolio24hChangeLabel: UILabel!
    @IBOutlet weak var changeFromPurchaseMoment: UILabel!
    @IBOutlet weak var initialPortfolioCostLabel: UILabel!
    @IBOutlet weak var portfolioProfitOrLossLabel: UILabel!
    @IBOutlet weak var portfolioProfitOrLoss24hLabel: UILabel!
    @IBOutlet weak var portfolioGraphButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
