//
//  NoPasteTextField.swift
//  CryptoSpace
//
//  Created by Иван Стефанов on 27.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class NoPasteTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
