//
//  ActionChoiceCell.swift
//  CryptoSpace
//
//  Created by iStef on 01.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class ActionChoiceCell: UITableViewCell {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var mainTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
