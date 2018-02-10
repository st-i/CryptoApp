//
//  CryptoCurrenciesCapitalizationCell.swift
//  CryptoSpace
//
//  Created by iStef on 16.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class CryptoCurrenciesCapitalizationCell: UITableViewCell {

    @IBOutlet weak var lastChangesLabel: UILabel!
    @IBOutlet weak var capitalizationPercentagesChangesLabel: UILabel!
    
    @IBOutlet weak var capitalizationImageView: UIImageView!
    
    @IBOutlet weak var capitalizationHintLabel: UILabel!
    @IBOutlet weak var capitalizationValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
