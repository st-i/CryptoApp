//
//  RequestToQuoineBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 24.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

class RequestToQuoineBuilder: NSObject {

    class func buildAllCoinsRequest() -> String {
        let requstString = "https://api.quoine.com/products"
        return requstString
    }
}
