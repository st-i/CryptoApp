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
    
    //MARK: - Core Data Delete
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
    func getAndMapUserCoinsArrayToCoinsArray() -> [Coin] {
        var coinsArray = [Coin]()
        
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
        
        if userTrackedCoins.count > 0 {
            for someCoin in userTrackedCoins {
                let currentCoin = Coin()
                currentCoin.fullName = someCoin.value(forKey: "fullName") as! String
                currentCoin.shortName = someCoin.value(forKey: "shortName") as! String
                currentCoin.id = someCoin.value(forKey: "id") as! String
                currentCoin.exchangeRate = someCoin.value(forKey: "exchangeRate") as! Double
                currentCoin.coinType = CoinType(rawValue: someCoin.value(forKey: "coinType") as! Int)!
                currentCoin.exchange = ExchangeBehavior(rawValue: someCoin.value(forKey: "exchange") as! Int)!
                currentCoin.sum = someCoin.value(forKey: "sum") as! Double
                currentCoin.amount = someCoin.value(forKey: "amount") as! Double
                coinsArray.append(currentCoin)
            }
        }
        return coinsArray
    }
    
//    func mapUserCoinToCoin(userCoin: NSManagedObject) -> Coin {
//
//    }

}
