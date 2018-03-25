//
//  TotalPortfolioCostCell.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TotalPortfolioCostCell: UITableViewCell {
    
//    @IBOutlet weak var lastChangesLabel: UILabel!
    
    @IBOutlet weak var totalPortfolioValueLabel: UILabel!
    @IBOutlet weak var portfolioPercentagesChangesLabel: UILabel!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        backgroundView = UIView.init()
//        backgroundView?.backgroundColor = UIColor.red
//    }
//    
//    override var alpha: CGFloat {
//        didSet {
//            super.alpha = 1.0
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
