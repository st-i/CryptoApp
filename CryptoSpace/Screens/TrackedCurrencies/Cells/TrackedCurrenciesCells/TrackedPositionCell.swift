//
//  TrackedPositionCell.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedPositionCell: UITableViewCell {

    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var currencyPairLabel: UILabel!
    @IBOutlet weak var purchasedCoinsCostLabel: UILabel!
    @IBOutlet weak var purchasedCoinsAmountLabel: UILabel!
    @IBOutlet weak var currencyExchangeRateCostLabel: UILabel!
    @IBOutlet weak var currencyExchangeRatePercentagesChangeLabel: UILabel!
    @IBOutlet weak var lowerSeparator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
