//
//  ActionChoiceButton.swift
//  CryptoSpace
//
//  Created by Иван Стефанов on 08.01.2018.
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
