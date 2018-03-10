//
//  Checkups.swift
//  CryptoSpace
//
//  Created by st.i on 09.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import Foundation

class HitBTCCoinToEth: NSObject {
    
    class func isCoinToEth(testedCoin: String) -> Bool {
        for currentCoin in HitBTCCoinsToEth {
            if testedCoin == currentCoin {
                return true
            }
        }
        return false
    }
}

class Gate_ioCoinToEth: NSObject {
    
    class func isCoinToEth(testedCoin: String) -> Bool {
        for currentCoin in Gate_ioCoinsToEth {
            if testedCoin == currentCoin {
                return true
            }
        }
        return false
    }
}

