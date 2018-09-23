//
//  EmptyCell.swift
//  CryptoSpace
//
//  Created by iStef on 05.01.18.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class EmptyCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
