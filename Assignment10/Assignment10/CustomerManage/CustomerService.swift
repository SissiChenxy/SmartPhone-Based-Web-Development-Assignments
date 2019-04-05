//
//  CustomerService.swift
//  Assignment9
//
//  Created by 陈昕昀 on 3/30/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CustomerService{
    
    func getCustomers(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Customer>{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortName]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do{
            try fetchedResultsController.performFetch()
        }catch let error as NSError{
            print("Error :\(error.userInfo)")
        }
        
        return fetchedResultsController as! NSFetchedResultsController<Customer>
    }
    
    func saveCustomer(name:String,email:String,age:Int32,address:String,managedContext:NSManagedObjectContext) -> Customer{
        
        let customerEntity = NSEntityDescription.entity(forEntityName: "Customer", in: managedContext)
        let customer = NSManagedObject.init(entity: customerEntity!, insertInto: managedContext)
        customer.setValue(name, forKey: "name")
        customer.setValue(email, forKey: "email")
        customer.setValue(age, forKey: "age")
        customer.setValue(address, forKey: "address")
        
        saveContext(managedContext: managedContext)
        return customer as! Customer
    }
    
    func saveContext (managedContext:NSManagedObjectContext) {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func isCustomerCoreDataEmpty(entity: String,managedContext:NSManagedObjectContext)-> Int
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        var results : NSArray?
        
        do {
            results = try managedContext.fetch(request) as! [NSManagedObject] as NSArray
            
            return results!.count
            
        } catch let error as NSError {
            // failure
            print("Error: \(error.debugDescription)")
            return -1
        }
    }
    
    func FindCustomer(customer:Customer,managedContext:NSManagedObjectContext) -> Customer?{
        let fetchedResultsController = getCustomers(managedContext: managedContext)
        let customerList = fetchedResultsController.fetchedObjects!
        for Customer in customerList{
            if(Customer == customer){
                return Customer
            }
        }
        return nil
    }
}
