//
//  UIColor+Extension.swift
//  CryptoSpace
//
//  Created by st.i on 29.01.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

internal extension UIColor {
    
    class func navBarColor() -> UIColor {
        return UIColor.init(red: 6.0 / 255.0, green: 61.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0) //основа
//        return UIColor.init(red: 17.0 / 255.0, green: 84.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
//        return UIColor.init(red: 17.0 / 255.0, green: 85.0 / 255.0, blue: 160.0 / 255.0, alpha: 1.0)
//        return UIColor.init(red: 20.0 / 255.0, green: 79.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0)
    }
    
    class func greenChangeColor() -> UIColor {
        return UIColor.init(red: 0, green: 190.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
    }
    
    class func redChangeColor() -> UIColor {
        return UIColor.init(red: 222.0 / 255.0, green: 68.0 / 255.0, blue: 75.0 / 255.0, alpha: 1.0)
    }
}
