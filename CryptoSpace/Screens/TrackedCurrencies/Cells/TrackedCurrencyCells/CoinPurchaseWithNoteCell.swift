//
//  CoinPurchaseWithNoteCell.swift
//  CryptoSpace
//
//  Created by st.i on 18.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class CoinPurchaseWithNoteCell: UITableViewCell {
    
    @IBOutlet weak var initialPurchaseSum: UILabel!
    @IBOutlet weak var currentPurchaseSum: UILabel!
    @IBOutlet weak var purchaseExchangeRate: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var initialPurchaseSumMoneyChangeLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
