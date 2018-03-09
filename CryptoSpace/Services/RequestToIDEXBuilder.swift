//
//  RequestToIDEXBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//http s://api.idex.market/returnTicker
class RequestToIDEXBuilder: NSObject {
    
    //должен быть метод POST
    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.idex.market/returnTicker"
        return requestString
    }
}
