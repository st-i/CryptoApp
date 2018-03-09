//
//  RequestToOKEXBuilder.swift
//  CryptoSpace
//
//  Created by st.i on 14.02.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit

//прохожу по массиву валют (без перебора ячеек)
//определяю для каждой валюты биржу, строю запрос
//этот запрос добавляю в массив запросов
//прохожу по массиву и отправляю спустя определенное время (несколько секунд)
//получаю обратно ответ
//полученный словарь парсю в соответствии с конкретной биржей и привожу к универсальному виду
//каждой валюте из массива присваиваю значения
//обновляю таблицу

//http s://www.okex.com/api/v1/ticker.do?symbol=ltc_btc
class RequestToOKEXBuilder: NSObject {
    
    class func buildRequest(currencyId: String) -> String {
        let requestString = String(format:"https://www.okex.com/api/v1/ticker.do?symbol=%@_btc", currencyId)
        return requestString
    }
}
