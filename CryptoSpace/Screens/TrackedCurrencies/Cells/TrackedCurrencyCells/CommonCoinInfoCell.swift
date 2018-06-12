//
//  CommonCoinInfoCell.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class CommonCoinInfoCell: UITableViewCell {

    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinAmountLabel: UILabel!
    @IBOutlet weak var coinCurrentExchangeRate: UILabel!
    @IBOutlet weak var initialCoinSum: UILabel!
    @IBOutlet weak var currentCoinSum: UILabel!
    @IBOutlet weak var initialCoinSumMoneyChangeLabel: UILabel!
    @IBOutlet weak var initialCoinPercentChangeLabel: UILabel!
    @IBOutlet weak var last24hCoinSumMoneyChangeLabel: UILabel!
    @IBOutlet weak var last24hCoinSumPercentChangeLabel: UILabel!
    
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
