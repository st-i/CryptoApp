//
//  IndicatorViewCell.swift
//  CryptoSpace
//
//  Created by st.i on 22.04.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class IndicatorViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
