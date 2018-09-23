//
//  NotesCell.swift
//  CryptoSpace
//
//  Created by iStef on 26.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

import UIKit

class NotesCell: UITableViewCell {
    
    @IBOutlet weak var notesTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
