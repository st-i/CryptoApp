//
//  ObservedPositionCell.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class ObservedPositionCell: UITableViewCell {

    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var currencyPairLabel: UILabel!
    @IBOutlet weak var currencyFullNameLabel: UILabel!
    @IBOutlet weak var currencyExchangeRateCostLabel: UILabel!
    @IBOutlet weak var currencyExchangeRatePercentagesChangeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
