//
//  RequestToLivecoinBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//https ://api.livecoin.net/exchange/ticker
class RequestToLivecoinBuilder: NSObject {

    //выдавал ошибку NSURLSessionManager. посмотреть
    class func buildAllCoinsRequest() -> String {
        let requestString = "https://api.livecoin.net/exchange/ticker"
        return requestString
    }
}
