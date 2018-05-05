//
//  CoreDataManager.swift
//  CryptoSpace
//
//  Created by st.i on 21.03.2018.
//  Copyright © 2018 Stefanov. All rights reserved.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    static let shared = CoreDataManager()

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
    
    // MARK: Core Data Saving support
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
    
    //MARK: Tracked Coins Part
    func saveTrackedUserCoin(coin: Coin) {
        
        let currentCoinUniqueId = determineUniqueNumberIdForCoin(coin: coin)
        
        //1
        let managedContext = persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "UserCoin", in: managedContext)!
        let userCoin = NSManagedObject(entity: entity, insertInto: managedContext)
        //3
        userCoin.setValue(coin.purchaseDate, forKey: "purchaseDate")
        userCoin.setValue(coin.fullName, forKeyPath: "fullName")
        userCoin.setValue(coin.shortName, forKey: "shortName")
        userCoin.setValue(coin.id, forKey: "id")
        userCoin.setValue(currentCoinUniqueId, forKey: "uniqueId")
        userCoin.setValue(coin.note, forKey: "note")
        userCoin.setValue(NSNumber.init(value:coin.coinType.rawValue), forKey: "coinType")
        userCoin.setValue(NSNumber.init(value:coin.exchange.rawValue), forKey: "exchange")
        userCoin.setValue(NSNumber.init(value:coin.exchangeRate), forKey: "exchangeRate")
        userCoin.setValue(NSNumber.init(value:coin.purchaseExchangeRate), forKey: "purchaseExchangeRate")
        userCoin.setValue(NSNumber.init(value:coin.amount), forKey: "amount")
        userCoin.setValue(NSNumber.init(value:coin.sum), forKey: "sum")
        userCoin.setValue(NSNumber.init(value:coin.initialSum), forKey: "initialSum")
        userCoin.setValue(NSNumber.init(value:coin.rate24hPercentChange), forKey: "rate24hPercentChange")
        //4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //Deletion of tracked coins group from core data
    func deleteGroupOfTrackedUserCoinsFromCoreData(coinShortName: String) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        fetchRequest.predicate = NSPredicate.init(format: "shortName == %@ && coinType == 0", coinShortName)
        
        var coinsArray = [NSManagedObject]()
        do {
            coinsArray = try managedContext.fetch(fetchRequest)
            if coinsArray.count > 0 {
                for coin in coinsArray {
                    managedContext.delete(coin)
                }
            }
        } catch let error as NSError {
            print("Could not fetch fetchCoinsGroupForDelete. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save coinsGroupForDelete. \(error), \(error.userInfo)")
        }
    }
    
    //Deletion of certain tracked coin from core data
    func deleteCertainTrackedUserCoinFromCoreData(coinModel: TrackedCoinPurchaseInfoModel) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        fetchRequest.predicate = NSPredicate.init(format: "shortName == %@ && uniqueId == %i && coinType == 0", coinModel.shortName, coinModel.uniqueId)
        
        var coinsArray = [NSManagedObject]()
        do {
            coinsArray = try managedContext.fetch(fetchRequest)
            //на всякий случай удалим все с этим uniqueId
            if coinsArray.count > 0 {
                for coin in coinsArray {
                    managedContext.delete(coin)
                }
            }
        } catch let error as NSError {
            print("Could not fetch fetchCertainCoinForDelete. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save certainCoinForDelete. \(error), \(error.userInfo)")
        }
    }
    
    //Mapping from entity to model
    func getUserCoinsArray() -> [Coin] {
        
        var coinsArray = [Coin]()
        
        let userTrackedCoins = getCoreDataTrackedUserCoinsArray()
        
        if userTrackedCoins.count > 0 {
            for someCoin in userTrackedCoins {
                let currentCoin = Coin()
                currentCoin.fullName = someCoin.value(forKey: "fullName") as! String
                currentCoin.shortName = someCoin.value(forKey: "shortName") as! String
                currentCoin.id = someCoin.value(forKey: "id") as! String
                currentCoin.uniqueId = someCoin.value(forKey: "uniqueId") as! Int
                currentCoin.exchangeRate = someCoin.value(forKey: "exchangeRate") as! Double
                currentCoin.purchaseExchangeRate = someCoin.value(forKey: "purchaseExchangeRate") as! Double
                currentCoin.coinType = CoinType(rawValue: someCoin.value(forKey: "coinType") as! Int)!
                currentCoin.exchange = ExchangeBehavior(rawValue: someCoin.value(forKey: "exchange") as! Int)!
                currentCoin.sum = someCoin.value(forKey: "sum") as! Double //УБРАТЬ
                currentCoin.initialSum = someCoin.value(forKey: "initialSum") as! Double
                currentCoin.rate24hPercentChange = someCoin.value(forKey: "rate24hPercentChange") as! Double
                currentCoin.amount = someCoin.value(forKey: "amount") as! Double
                coinsArray.append(currentCoin)
            }
        }
        return coinsArray
    }
    
    func getCertainTrackedUserCoinArray(coinShortName: String) -> [Coin] {
        
        var certainCoinArray = [Coin]()
        let certainTrackedCoinArray = getCoreDataCertainTrackedUserCoinArray(coinShortName: coinShortName)
        if certainTrackedCoinArray.count > 0 {
            for someCoin in certainTrackedCoinArray {
                let currentCoin = Coin()
                currentCoin.uniqueId = someCoin.value(forKey: "uniqueId") as! Int
                currentCoin.exchangeRate = someCoin.value(forKey: "exchangeRate") as! Double
                currentCoin.purchaseExchangeRate = someCoin.value(forKey: "purchaseExchangeRate") as! Double
                currentCoin.initialSum = someCoin.value(forKey: "initialSum") as! Double
                currentCoin.amount = someCoin.value(forKey: "amount") as! Double
                currentCoin.purchaseDate = someCoin.value(forKey: "purchaseDate") as! Date
                currentCoin.note = someCoin.value(forKey: "note") as! String
                certainCoinArray.append(currentCoin)
            }
        }
        return certainCoinArray
    }
    
    //Fetching from CoreData
    private func getCoreDataTrackedUserCoinsArray() -> [NSManagedObject] { //tracked
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        let coinTypePredicate = NSPredicate(format: "coinType = 0") //CoinType.Tracked
        fetchRequest.predicate = coinTypePredicate
        
        //3
        var userTrackedCoins = [NSManagedObject]()
        do {
            userTrackedCoins = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return userTrackedCoins
    }
    
    private func getCoreDataCertainTrackedUserCoinArray(coinShortName: String) -> [NSManagedObject] {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        let coinShortNamePredicate = NSPredicate(format: "shortName = %@ && coinType = 0", coinShortName) //&& coinType == \(CoinType.Tracked)")
        fetchRequest.predicate = coinShortNamePredicate
        
        var certainTrackedUserCoinArray = [NSManagedObject]()
        do {
            certainTrackedUserCoinArray = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch CertainTrackedUserCoinArray. \(error), \(error.userInfo)")
        }
        return certainTrackedUserCoinArray
    }
    
    //Unique id for tracked coin
    func determineUniqueNumberIdForCoin(coin: Coin) -> Int {
        
        let allStoredCoins = getCoreDataTrackedUserCoinsArray()
        if allStoredCoins.count == 0 {
            return 0
        }
        var allStoredCoinsKeysAndUniqueIds = Dictionary<String, [Int]>()
        if allStoredCoins.count > 0 {
            for userCoin in allStoredCoins {
                let userCoinKey = userCoin.value(forKey:"shortName") as! String
                if !allStoredCoinsKeysAndUniqueIds.keys.contains(userCoinKey) {
                    allStoredCoinsKeysAndUniqueIds.updateValue([], forKey: userCoinKey)
                }
            }
        }
        
        if allStoredCoinsKeysAndUniqueIds.keys.count > 0 {
            for userCoin in allStoredCoins {
                let userCoinKey = userCoin.value(forKey:"shortName") as! String
                if allStoredCoinsKeysAndUniqueIds.keys.contains(userCoinKey) {
                    var userCoinUniqueIdsArray = allStoredCoinsKeysAndUniqueIds[userCoinKey]
                    let userCoinUniqueId = userCoin.value(forKey:"uniqueId") as! Int
                    userCoinUniqueIdsArray?.append(userCoinUniqueId)
                    allStoredCoinsKeysAndUniqueIds.updateValue(userCoinUniqueIdsArray!, forKey: userCoinKey)
                }
            }
        }
        
        if allStoredCoinsKeysAndUniqueIds.keys.contains(coin.shortName) {
            let userCoinUniqueIdsArray = allStoredCoinsKeysAndUniqueIds[coin.shortName]
            let sortedUserCoinUniqueIdsArray = userCoinUniqueIdsArray?.sorted { $0 < $1 }
            let newUniqueId = (sortedUserCoinUniqueIdsArray?.last)! + 1
            return newUniqueId
        }else{
            return 0
        }
    }
    
    func updateTrackedUserCoins(trackedCoins: [Coin]) {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        let coinTypePredicate = NSPredicate(format: "coinType = 0") //CoinType.Tracked
        fetchRequest.predicate = coinTypePredicate
        
        do {
            let userTrackedCoinsEntitiesArray = try managedContext.fetch(fetchRequest)
            if trackedCoins.count > 0 {
                for trackedCoin in trackedCoins {
                    for userTrackedCoinsEntity in userTrackedCoinsEntitiesArray {
                        let userTrackedCoinEntityShortName = userTrackedCoinsEntity.value(forKey: "shortName") as! String
                        if userTrackedCoinEntityShortName == trackedCoin.shortName {
                            userTrackedCoinsEntity.setValue(trackedCoin.exchangeRate, forKey: "exchangeRate")
                            userTrackedCoinsEntity.setValue(trackedCoin.rate24hPercentChange, forKey: "rate24hPercentChange")
                        }
                    }
                }
            }
        } catch let error as NSError {
            print("Could not update updateTrackedUserCoins. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save updateTrackedUserCoins. \(error), \(error.userInfo)")
        }
    }
    
    //MARK: Observed Coins Part
    private func saveObservedUserCoin(coin: Coin) {
        
        //1
        let managedContext = persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "UserCoin", in: managedContext)!
        let userCoin = NSManagedObject(entity: entity, insertInto: managedContext)
        //3
        userCoin.setValue(coin.fullName, forKeyPath: "fullName")
        userCoin.setValue(coin.shortName, forKey: "shortName")
        userCoin.setValue(coin.id, forKey: "id")
        userCoin.setValue(NSNumber.init(value:coin.exchangeRate), forKey: "exchangeRate")
        userCoin.setValue(NSNumber.init(value:coin.coinType.rawValue), forKey: "coinType")
        userCoin.setValue(NSNumber.init(value:coin.exchange.rawValue), forKey: "exchange")
        userCoin.setValue(NSNumber.init(value:coin.rate24hPercentChange), forKey: "rate24hPercentChange")
        //4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func tryToSaveObservedCoin(coin: Coin) {
        
        var alreadyWasSaved = false
        let allObservedCoins = getObservedUserCoinsArray()
        for someCoin in allObservedCoins {
            if someCoin.shortName == coin.shortName {
                alreadyWasSaved = true
            }
        }
        if alreadyWasSaved == false {
            saveObservedUserCoin(coin: coin)
        }else{
            print("Такая отслеживаемая монета уже сохранена")
        }
    }
    
    //Deletion of observed coin from core data
    func deleteObservedUserCoinFromCoreData(coin: Coin) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        fetchRequest.predicate = NSPredicate.init(format: "shortName == %@ && coinType == 1", coin.shortName)
        
        var coinsArray = [NSManagedObject]()
        do {
            coinsArray = try managedContext.fetch(fetchRequest)
            //на всякий случай удалим все с этим shortName
            if coinsArray.count > 0 {
                for coin in coinsArray {
                    managedContext.delete(coin)
                }
            }
        } catch let error as NSError {
            print("Could not fetch fetchObservedCoinForDelete. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save observedCoinForDelete. \(error), \(error.userInfo)")
        }
    }
    
    private func getCoreDataObservedUserCoinsArray() -> [NSManagedObject] {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        let coinTypePredicate = NSPredicate(format: "coinType = 1") //CoinType.Observed
        fetchRequest.predicate = coinTypePredicate
        
        //3
        var userTrackedCoins = [NSManagedObject]()
        do {
            userTrackedCoins = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch getCoreDataObservedUserCoinsArray. \(error), \(error.userInfo)")
        }
        return userTrackedCoins
    }
    
    func getObservedUserCoinsArray() -> [Coin] {
        
        var coinsArray = [Coin]()
        
        let userObservedCoins = getCoreDataObservedUserCoinsArray()
        
        if userObservedCoins.count > 0 {
            for someCoin in userObservedCoins {
                let currentCoin = Coin()
                currentCoin.fullName = someCoin.value(forKey: "fullName") as! String
                currentCoin.shortName = someCoin.value(forKey: "shortName") as! String
                currentCoin.id = someCoin.value(forKey: "id") as! String
                currentCoin.exchangeRate = someCoin.value(forKey: "exchangeRate") as! Double
                currentCoin.coinType = CoinType(rawValue: someCoin.value(forKey: "coinType") as! Int)!
                currentCoin.exchange = ExchangeBehavior(rawValue: someCoin.value(forKey: "exchange") as! Int)!
                currentCoin.rate24hPercentChange = someCoin.value(forKey: "rate24hPercentChange") as! Double
                coinsArray.append(currentCoin)
            }
        }
        return coinsArray
    }
    
    func updateObservedUserCoins(observedCoins: [Coin]) {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        let coinTypePredicate = NSPredicate(format: "coinType = 1") //CoinType.Observed
        fetchRequest.predicate = coinTypePredicate
        
        do {
            let userObservedCoinsEntitiesArray = try managedContext.fetch(fetchRequest)
            if userObservedCoinsEntitiesArray.count > 0 {
                for userObservedCoinEntity in userObservedCoinsEntitiesArray {
                    let userObservedCoinEntityShortName = userObservedCoinEntity.value(forKey: "shortName") as! String
                    for userObservedCoin in observedCoins {
                        if userObservedCoin.shortName == userObservedCoinEntityShortName {
                            userObservedCoinEntity.setValue(userObservedCoin.exchangeRate, forKey: "exchangeRate")
                            userObservedCoinEntity.setValue(userObservedCoin.rate24hPercentChange, forKey: "rate24hPercentChange")
                            break
                        }
                    }
                }
            }
        } catch let error as NSError {
            print("Could not update updateObservedUserCoins. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save updateObservedUserCoins. \(error), \(error.userInfo)")
        }
    }
    
    //MARK: Coin Market Cap Part
    func saveCoinMarketCap(value: Double) {
        
        //1
        let managedContext = persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "MarketCap", in: managedContext)!
        let marketCapEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        //3
        marketCapEntity.setValue(value, forKey: "marketCapValue")
        //4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save saveCoinMarketCap. \(error), \(error.userInfo)")
        }
    }
    
    func getCoinMarketCap() -> Double {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MarketCap")
        
        var coinMarketCapValue = 0.0
        do {
            let coinMarketCapEntityArray = try managedContext.fetch(fetchRequest)
            if coinMarketCapEntityArray.count > 0 {
                let coinMarketCapEntity = coinMarketCapEntityArray.first
                coinMarketCapValue = coinMarketCapEntity?.value(forKey: "marketCapValue") as! Double
            }
        } catch let error as NSError {
            print("Could not fetch getCoinMarketCap. \(error), \(error.userInfo)")
        }
        return coinMarketCapValue
    }
    
    func updateCoinMarketCap(value: Double) {

        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MarketCap")
        
        do {
            let coinMarketCapEntityArray = try managedContext.fetch(fetchRequest)
            if coinMarketCapEntityArray.count > 0 {
                let coinMarketCapEntity = coinMarketCapEntityArray.first
                coinMarketCapEntity?.setValue(value, forKey: "marketCapValue")
            }
        } catch let error as NSError {
            print("Could not update updateCoinMarketCap. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save updateCoinMarketCap. \(error), \(error.userInfo)")
        }
    }
    
    //MARK: Portfolio Part
    func savePortfolio(portfolio: Portfolio) {
        
        //1
        let managedContext = persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "UserPortfolio", in: managedContext)!
        let userPortfolioEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        //3
        userPortfolioEntity.setValue(portfolio.initialDollarValue, forKey: "initialDollarValue")
        userPortfolioEntity.setValue(portfolio.currentDollarValue, forKey: "currentDollarValue")
        userPortfolioEntity.setValue(portfolio.last24hValueDollarChange, forKey: "last24hValueDollarChange")
        userPortfolioEntity.setValue(portfolio.last24hValuePercentChange, forKey: "last24hValuePercentChange")
        userPortfolioEntity.setValue(portfolio.rubleExchangeRate, forKey: "rubleExchangeRate")
        //4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save savePortfolio. \(error), \(error.userInfo)")
        }
    }
    
    func getUserPortfolio() -> Portfolio {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserPortfolio")
        
        let portfolio = Portfolio()
        do {
            let userPortfolioEntityArray = try managedContext.fetch(fetchRequest)
            if userPortfolioEntityArray.count > 0 {
                let userPortfolioEntity = userPortfolioEntityArray.first
                portfolio.initialDollarValue = userPortfolioEntity?.value(forKey: "initialDollarValue") as! Double
                portfolio.currentDollarValue = userPortfolioEntity?.value(forKey: "currentDollarValue") as! Double
                portfolio.last24hValueDollarChange = userPortfolioEntity?.value(forKey: "last24hValueDollarChange") as! Double
                portfolio.last24hValuePercentChange = userPortfolioEntity?.value(forKey: "last24hValuePercentChange") as! Double
                portfolio.rubleExchangeRate = userPortfolioEntity?.value(forKey: "rubleExchangeRate") as! Double
            }
        } catch let error as NSError {
            print("Could not fetch getUserPortfolio. \(error), \(error.userInfo)")
        }
        
        return portfolio
    }
    
    func checkPortfolioExistance() -> Bool {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserPortfolio")
        
        var portfolioExistance = false
        do {
            let userPortfolioEntityArray = try managedContext.fetch(fetchRequest)
            if userPortfolioEntityArray.count > 0 {
                portfolioExistance = true
            }
        } catch let error as NSError {
            print("Could not fetch checkPortfolioExistance. \(error), \(error.userInfo)")
        }
        
        return portfolioExistance
    }
    
    func updatePortfolio(portfolio: Portfolio) {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserPortfolio")
        
        do {
            let userPortfolioEntityArray = try managedContext.fetch(fetchRequest)
            if userPortfolioEntityArray.count > 0 {
                let userPortfolioEntity = userPortfolioEntityArray.first
                userPortfolioEntity?.setValue(portfolio.initialDollarValue, forKey: "initialDollarValue")
                userPortfolioEntity?.setValue(portfolio.currentDollarValue, forKey: "currentDollarValue")
                userPortfolioEntity?.setValue(portfolio.last24hValueDollarChange, forKey: "last24hValueDollarChange")
                userPortfolioEntity?.setValue(portfolio.last24hValuePercentChange, forKey: "last24hValuePercentChange")
                userPortfolioEntity?.setValue(portfolio.rubleExchangeRate, forKey: "rubleExchangeRate")
            }
        } catch let error as NSError {
            print("Could not update updatePortfolio. \(error), \(error.userInfo)")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save updatePortfolio. \(error), \(error.userInfo)")
        }
    }
}
