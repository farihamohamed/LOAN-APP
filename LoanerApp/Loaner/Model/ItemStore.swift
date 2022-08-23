//
//  ItemStore.swift
//  loaner
//
//  Created by Fariha Mohamed on 8/22/22.
//  Copyright © 2022 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

enum FetchItemsResult{
    case success([Item])
    case failure(Error)
}

class ItemStore: NSObject {
    
    let persistentContainer: NSPersistentContainer = {
         let container = NSPersistentContainer(name: "LoanedItems")
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data(\(error)).")
            }
            
        }
        return container
    }()
    
    func fetchPersistedData(completion: @escaping (FetchItemsResult) -> Void){
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let viewContext = persistentContainer.viewContext
        
        do{
            let allItems = try viewContext.fetch(fetchRequest)
            completion(.success(allItems))
        }
        
        catch{
            completion(.failure(error))
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    func saveContext(){
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try viewContext.save()
                
            }
            catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    
    
    
    
    

}


