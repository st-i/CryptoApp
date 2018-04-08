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
    
    func saveUserCoin(coin: Coin) {
        
        let currentCoinUniqueId = determineUniqueNumberIdForCoin(coin: coin)
        
        //1
        let managedContext = persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "UserCoin", in: managedContext)!
        let userCoin = NSManagedObject(entity: entity, insertInto: managedContext)
        //3
        userCoin.setValue(coin.fullName, forKeyPath: "fullName")
        userCoin.setValue(coin.shortName, forKey: "shortName")
        userCoin.setValue(coin.id, forKey: "id")
        userCoin.setValue(currentCoinUniqueId, forKey: "uniqueId")
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
    
    //MARK: - Core Data Delete
    //ДОРАБОТАТЬ!!
    func deleteUserCoinFromCoreData(coin: Coin) {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        fetchRequest.predicate = NSPredicate.init(format: "id==\(coin.id)")
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        if let result = try? managedContext.fetch(fetchRequest) {
            for object in result {
                managedContext.delete(object)
            }
        }
    }
    
    //MARK: - Mapping
    func getUserCoinsArray() -> [Coin] {
        
        var coinsArray = [Coin]()
        
        let userTrackedCoins = getCoreDataUserCoinsArray()
        
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
                currentCoin.sum = someCoin.value(forKey: "sum") as! Double
                currentCoin.initialSum = someCoin.value(forKey: "initialSum") as! Double
                currentCoin.amount = someCoin.value(forKey: "amount") as! Double
                coinsArray.append(currentCoin)
            }
        }
        return coinsArray
    }
    
    private func getCoreDataUserCoinsArray() -> [NSManagedObject] {
        
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCoin")
        
        //3
        var userTrackedCoins = [NSManagedObject]()
        do {
            userTrackedCoins = try managedContext.fetch(fetchRequest)
//            let someCoin = userTrackedCoins[2]
//            let someCoinName = someCoin.value(forKey: "fullName") as! String
//            print(someCoinName)
//            print(userTrackedCoins)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return userTrackedCoins
    }
    
    //MARK: - Unique id for coin
    func determineUniqueNumberIdForCoin(coin: Coin) -> Int {
        
        let allStoredCoins = getCoreDataUserCoinsArray()
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
    
//    func mapUserCoinToCoin(userCoin: NSManagedObject) -> Coin {
//
//    }

}
