//
//  AppDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

//1.bitfinex - between 10 and 90 per minute
//2.okex - Each IP can send maximum of 3000 https requests within 5 minutes (600 per minute) (431 currencies, хороший курс)
//3.abucoins - 300 requests per 1 minute per IP and Account
//4.liqui - All information is cached every 2 seconds, so there's no point in making more frequent requests. (30 per minute)
//5.Quoine / Qryptos - API users should not make more than 300 requests per 5 minute (60 per minute)
//6.Poloniex - 6 calls per second to the public API (99 валют) (360 per minute)
//7.Yobit - Server responses are cashed every 2 seconds that is why there is no sense in making requests faster. (30 per minute)
//8.Kucoin-есть api, ничего про лимиты
//9.Livecoin - Разрешается не более 60 любых запросов к API в течении 60 секунд подряд с одного IP адреса. (60 per minute)
//10.Aex - every 60 seconds the number of calls can not be more than 120
//11.Hitbtc - good api, has limits, no info
//12.coinexchange - good api, has limits, no info
//13.idex - has api, no limits info
//14.Gate.io - good api; has limits, but nothing about limits in numbers
//15.fatbtc - all tickers at once, no limits info
//16.Tidex - All information is cached every 2 seconds, so there's no point in making more frequent requests (30 per minute)
//17.Bleutrade - has api, no limits info
//18.tradebytrade - Please note that making more than 6 calls per second to the public API, or repeatedly and needlessly fetching excessive amounts of data, can result in your IP being banned. (360 per minute)
//19.coinfalcon - We throttle public endpoints by IP: 3 requests per second (180 per minute)



//!5.bittrex - We are currently restricting orders to 500 open orders and 200,000 orders a day. nothing else about limits
//25.binance - Each route has a weight which determines for the number of requests each endpoint counts for. Heavier endpoints and endpoints that do operations on multiple symbols will have a heavier weight.

//60.Mercatox - почему-то апи в виде ответа на весь экран сайта
//60.radar relay - has api, no limits info
//60.token store - не нашел апи
//60.Bancor Network - не нашел апи
//60.ddex - не нашел апи
//60.forkdelta - сайт на гитхаб, нихрена не понятно
//60.coinbe - has api, no limits info
//60.Bisq - не нашел апи
//60.litebit.eu - has api, no limits info
//52.Coinroom-Good API, no limits info
//66.cryptopia - 479 валют, есть апи, ничего про лимиты (можно взять только все пары)
//26.upbit - все в иероглифах, не могу перевести
//30.exx - good API, nothing about limits, chinese language
//28.huobi - Each apikey can send maximum of 100 https requests within 10 seconds
//60.tuxexchange - низкий курс, We reserve the right to block API calls from users who we believe are making API calls with the intention of trying to disrupt the operation of the exchange.
//60.Bittylicious - мутная, не увидел апи
//60.Zaif - api не на англ
//2.btcalpha - 33 валюты, We have limit in 2 calls per second from single account to authorization required methods and 100 calls per secong from single IP address to public methods (6000 per minute). биткоин-8650, у них 9236
//3.bithumb - Public API: 20 request available per second (1200 per minute) (12 валют, чуть завышен курс).
//5.Lykke - The API throughput limit is 300 requests per minute for a single client (около 30 валют, на 200-300 завышен).
//6.BtcMarkets - 25 calls per 10 seconds (11 валют, хороший курс) (150 per minute)
//12.Gemini - we limit requests to 120 requests per minute
//34.coinone - 90 requests per minute


//17.Okcoin - Each IP can send maximum of 3000 https requests within 5 minutes (BTC, LTC, ETH)
//62.c2cx - 60 API request per minute per endpoint. If more then 60 API requests are sent per minute to an endpoint the sending IP will be blocked for between 30 and 60 seconds. Results are also limited to 100 results per API request. APIs that may return more than 100 result will have a pagination option.
//65.bitso - 300 requests in 5 minutes, 8 currencies
//54.? Acx-The Public API requires no authentication, no threshold, while the Private one does and has a threshold of 1000 request/keypair/5 minutes. Но 6 валют

//55.cryptobridge - nothing was found about api
//24.coinmarketcap - Please limit requests to no more than 10 per minute
//72.independent reserve - 3 валюты, 1 запрос в секунду


//58.coinhouse - didn't find api
//57.tradeogre - has api, nothing about limits
//56.southxchange - has api, nothing anout limits
//1.bitbay - про лимиты ничего
//!6.C-CEX - nothing about limits
//!7.cex.io - nothing about limits
//11.Gatecoin - didn't find limits, need to write to techsupport
//20.QuadrigaCX - nothing about limits
//22.Wex - nothing about limits
//29.bit-z - good API, nothing about limits
//31.coinegg - good api, nothing about limits
//41.Bitbay - good api, nothing about limits
//43.Allcoin - проверить в списке, ничего о лимитах, апи есть
//47.Coolcoin - 402 Requests are too frequent. Есть апи, ничего о лимитах, очень похожа на какую-то
//59.Bxthailand-есть апи, 24 валюты, ничего про лимиты
//68.bigone - 108 currencies, есть api, ничего про лимиты



//69.bitFlyer - не открывается
//4.bitstamp - не открывается
//8.Coinbase - only 4 positions, didn't find public info
//9.Gdax - later
//10.Exmo - couldn't open
//14.Kraken - not clear, some progressive way
//32.itbit - only btc
//36.Zb.com - посмотреть с компа
//38.Bitbank - китайский язык
//39.Lbank - с компа
//42.Bibox - посмотреть с компа https ://api.bibox.com
//45.Bitcoin Indonesia-нужна регистрация, посмотреть с компа
//48.Mr.Exchange или Mr.Ripple - все на китайском
//50.Xbtce-c компа
//51.Bitinka-только биткоин
//53.Simex-только бит и эфир
//55.Negociecoins - перевести сайт с компа
//56.Coinfloor-бит и бкеш
//57.Coinegg-проверить
//58.Btc trade-все на китайском, нет апи
//60.Exx -посмотреть
//61.aidos - одна валюта
//63.coinsquare - нет апи
//64.btcturk - с компа
//67.bl3p - only btc
//70.vebitcoin - 4 currencies
//71.topbtc - не нашел api
//73.exrates - долго искать апи
//74.fisco - 3 валюты
//75.btcbox - only btc
//76.gopax - все на корейском, 25 валют, апи не смотрел

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CryptoSpace")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

