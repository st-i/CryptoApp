//
//  TrackedCurrencyCell.swift
//  CryptoSpace
//
//  Created by iStef on 17.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class TrackedCurrencyCell: UITableViewCell {
    
    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var exchangeRatePercentagesChangeLabel: UILabel!
    @IBOutlet weak var purchasedCoinsPercentagesChangeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
