//
//  ActionChoiceButton.swift
//  CryptoSpace
//
//  Created by st.i on 08.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class ActionChoiceButton: UIButton {

    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.groupTableViewBackground : UIColor.white
        }
    }
}
