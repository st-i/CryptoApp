//
//  AppDelegate.swift
//  CryptoSpace
//
//  Created by iStef on 09.12.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

//enTdiaK3E6-zyge2_7ms API_KEY к какому-то сайту с крусом рубля

//Quoine - 3 (BTC, ETH and QASH) | "last_price_24h" = "6842.0"; сразу к доллару
//bittrex - 117 + | PrevDay = "0.1006195"; - перевести из BTC в USD и посчитать разницу
//Hitbtc - 51 + | open = "0.000864"; - перевести из BTC в USD и посчитать разницу
//binance - 29 + | openPrice = "0.00001212"; prevClosePrice = "0.00001213"; priceChange = "-0.00000027"; priceChangePercent = "-2.228"; - отдает вполне реальные проценты


//for future
//poloniex - 3 + | percentChange = "0.03187250"; отдает вполне реальные проценты
//cryptopia - 3 + | Change = "-0.55"; - отдает вполне реальные проценты, много монет можно кинуть на bittrex
//idex - 13 + (к эфиру) |
//gate.io - 8 + |
//kucoin - 26 + | changeRate = "-0.0133"; - перевести из BTC в USD и посчитать разницу //перепроверить
//livecoin - 3 + | убрал биржу
//bigone - 2 + | убрал биржу
//c2cx - 1 + | убрал биржу
//cobinhood - 1 + | убрал биржу
//coinexchange - 1 + | убрал биржу
//Yobit - 1 + | убрал биржу
//Yobit - 1 + |

//1.Quoine / Qryptos - API users should not make more than 300 requests per 5 minute (60 per minute)
//2.bittrex - We are currently restricting orders to 500 open orders and 200,000 orders a day. nothing else about limits (все сразу)
//3.Poloniex - 6 calls per second to the public API (99 валют) (360 per minute) (все сразу, 99 валют в ответе)
//4.Hitbtc - good api, has limits, no info (>200 валют, все сразу)
//5.Kucoin-есть api, ничего про лимиты (все сразу)
//6.cryptopia - есть апи, ничего про лимиты (>200 валют, можно взять только все пары)
//7.idex - has api, no limits info
//8.Gate.io - good api; has limits, but nothing about limits in numbers
//9.binance - Each route has a weight which determines for the number of requests each endpoint counts for. Heavier endpoints and endpoints that do operations on multiple symbols will have a heavier weight.

//10.Livecoin - Разрешается не более 60 любых запросов к API в течении 60 секунд подряд с одного IP адреса. (60 per minute)
//11.bigone - 108 currencies, есть api, ничего про лимиты (падает приложение на ответе)
//12.c2cx - 60 API request per minute per endpoint. If more then 60 API requests are sent per minute to an endpoint the sending IP will be blocked for between 30 and 60 seconds. Results are also limited to 100 results per API request. APIs that may return more than 100 result will have a pagination option. (60 per minute)(в разработке)
//13.cobinhood - has api, no limits info, можно взять все пары
//14.coinexchange - good api, has limits, no info
//15.Yobit - Server responses are cashed every 2 seconds that is why there is no sense in making requests faster. (30 per minute)

//16.bitfinex - between 10 and 90 per minute


//fatbtc - 1
//Tidex - 1
//btcalpha - 1
//Trade Satoshi - 1
//BarterDEX - 1
//c2cx - 2
//bigone - 1
//Yobit - 1
//Tidex - 1


//Qryptos - 5
//Quoine - 2
//liqui - 13
//binance - 4
//Aex - 7
//tradeogre - 1
//bitfinex - 5
//Ethfinex - 3
//Yobit - 9
//fatbtc - 3
//tidex - 6
//Bleutrade - 4
//aex - 7
//TradeByTrade - 5
//litebit.eu - 9
//radar relay - 6
//coinfalcon - 6
//bit-z - 5
//cryptox - 2
//cobinhood - 9
//bigone - 6
//Allcoin - 9
//Stellar Decentralized Exchange - 1
//Bxthailand - 2
//TDAX - 3
//Stocks.Exchange - 2
//Trade Satoshi - 1
//c2cx - 2
//btcalpha - 1
//coinegg - 4
//ccex - 3
//acx - 1
//exx - 2


//60.btcc - есть апи, не указаны лимиты
//60.itbit - Market data endpoints refresh every 5-6 seconds (10-12 per minute)
//60.xbtce - не смотрел апи, потому что низкий курс
//60.dsx - If you make more than 60 requests of Trading API methods (/tapi/) per minute using the same pair of API keys you will receive an error on each extra request during the same minute (60 per minute)

//16.fatbtc - all tickers at once, no limits info (в последний раз не открывался)
//11.btcalpha - 33 валюты, We have limit in 2 calls per second from single account to authorization required methods and 100 calls per secong from single IP address to public methods (6000 per minute). биткоин-8650, у них 9236
//3.abucoins - 300 requests per 1 minute per IP and Account (все сразу, 36 валют в ответе)
//10.Aex - every 60 seconds the number of calls can not be more than 120 (120 per minute) (все сразу, 51 валюта в ответе)
//37.exx - Each IP can send maximum of 1000 https requests within 1 minute. If exceeds 1000 requests, the system will automatically block the IP for one hour. After an hour, the IP will be automatically unlocked. (1000 per minute) можно все тикеры
//18.tradebytrade - Please note that making more than 6 calls per second to the public API, or repeatedly and needlessly fetching excessive amounts of data, can result in your IP being banned. (360 per minute)
//19.coinfalcon - We throttle public endpoints by IP: 3 requests per second (180 per minute)


//2.okex - Each IP can send maximum of 3000 https requests within 5 minutes (600 per minute) (431 currencies, хороший курс)
//4.liqui - All information is cached every 2 seconds, so there's no point in making more frequent requests. (30 per minute)
//16.Tidex - All information is cached every 2 seconds, so there's no point in making more frequent requests (30 per minute)
//17.Bleutrade - has api, no limits info
//21.litebit.eu - has api, no limits info
//22.bit-z / bitz / bit z - good API, nothing about limits
//23.cryptox - has api, no limits info
//24.radar relay - has api, no limits info
//27.Allcoin - ничего о лимитах, апи есть
//28.Bxthailand-есть апи, 24 валюты, ничего про лимиты
//29.TDAX - есть апи, ничего о лимитах, можно взять все пары, очень высокий курс
//30.coinegg - good api, nothing about limits
//31.Stocks.Exchange - has api, no limits info
//32.xBTCe - has api, no limits info
//34.Trade Satoshi - has api, no limits info
//38.zb.com - Each IP can send maximum of 1000 https requests within 1 minute. If exceeds 1000 requests, the system will automatically block the IP for one hour. After an hour, the IP will be automatically unlocked (1000 per minute)
//39.Wex - Вся информация кэшируется каждые 2 секунды, поэтому нет смысла делать запросы чаще. (30 per minute)
//40.Gatecoin - has api, didn't find limits
//41.Acx-The Public API requires no authentication, no threshold, while the Private one does and has a threshold of 1000 request/keypair/5 minutes. Но 6 валют
//42.Coinroom - Good API, no limits info
//43.C-CEX / ccex / c cex - has api, nothing about limits
//44.tradeogre - has api, nothing about limits


//60.OasisDEX - сложно найти апи
//60.Nocks - не открывается
//60.ChaoEX - все в иероглифах
//60.BarterDEX - надо разбираться с апи
//60.OpenLedger DEX - не стал разбираться с апи
//60.CryptoDerivatives - есть апи, непонятное, адовый курс
//60.Waves Decentralized Exchange - есть апи, но не стал разбираться
//60.tidebit - не нашел апи
//60.rightbtc - не нашел апи
//60.coinnest - все в иероглифах
//60.Iquant - не нашел апи, возможно, нужно регистрироваться
//60.coinrail - все на корейском
//60.Stellar Decentralized Exchange - есть апи, ничего про лимиты, можно взять все монеты
//60.coss - не нашел апи
//60.oex - очень высокий курс
//60.qbtc - только post нашел
//60.bcex - api на китайском
//60.Mercatox - почему-то апи в виде ответа на весь экран сайта
//60.token store - не нашел апи
//60.Bancor Network - не нашел апи
//60.ddex - не нашел апи
//60.forkdelta - сайт на гитхаб, нихрена не понятно
//60.coinbe - has api, no limits info
//60.Bisq - не нашел апи
//26.upbit - все в иероглифах, не могу перевести
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
//65.bitso - 300 requests in 5 minutes, 8 currencies

//55.cryptobridge - nothing was found about api
//24.coinmarketcap - Please limit requests to no more than 10 per minute
//72.independent reserve - 3 валюты, 1 запрос в секунду


//58.coinhouse - didn't find api
//56.southxchange - has api, nothing anout limits
//1.bitbay - про лимиты ничего
//!7.cex.io - nothing about limits
//20.QuadrigaCX - nothing about limits
//41.Bitbay - good api, nothing about limits
//47.Coolcoin - 402 Requests are too frequent. Есть апи, ничего о лимитах, очень похожа на какую-то


//69.bitFlyer - не открывается
//4.bitstamp - не открывается
//8.Coinbase - only 4 positions, didn't find public info
//9.Gdax - later
//10.Exmo - couldn't open
//14.Kraken - not clear, some progressive way
//32.itbit - only btc
//38.Bitbank - китайский язык
//39.Lbank - апи в иероглифах
//42.Bibox - посмотреть с компа https ://api.bibox.com. не открывается
//45.Bitcoin Indonesia-нужна регистрация, посмотреть с компа
//48.Mr.Exchange или Mr.Ripple - все на китайском
//50.Xbtce-c компа
//51.Bitinka-только биткоин
//53.Simex-только бит и эфир
//55.Negociecoins - перевести сайт с компа
//56.Coinfloor-бит и бкеш
//58.Btc trade-все на китайском, нет апи
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
    }
}

