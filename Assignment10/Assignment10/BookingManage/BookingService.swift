//
//  BookingService.swift
//  Assignment9
//
//  Created by 陈昕昀 on 3/31/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class BookingService{
    
    func getBookings(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Booking>{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Booking")
        let sortName = NSSortDescriptor(key: "movie", ascending: true)
        fetchRequest.sortDescriptors = [sortName]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do{
            try fetchedResultsController.performFetch()
        }catch let error as NSError{
            print("Error :\(error.userInfo)")
        }
        
        return fetchedResultsController as! NSFetchedResultsController<Booking>
    }
    
    func saveBooking(movie:Movie,customer:Customer,quantity:Int16,bookingDate:Date,returnDate:Date,managedContext:NSManagedObjectContext) -> Booking{
        
        let bookingEntity = NSEntityDescription.entity(forEntityName: "Booking", in: managedContext)
        let booking = NSManagedObject.init(entity: bookingEntity!, insertInto: managedContext)
        booking.setValue(movie, forKey: "movie")
        booking.setValue(customer, forKey: "customer")
        booking.setValue(quantity, forKey: "quantity")
        booking.setValue(bookingDate, forKey: "bookingDate")
        booking.setValue(returnDate, forKey: "returnDate")
        movie.quantity -= Int16(quantity)
        
        saveContext(managedContext: managedContext)
        return booking as! Booking
        
    }
    
    func isBookingCoreDataEmpty(entity: String,managedContext:NSManagedObjectContext)-> Int
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
    
    func FindBooking(booking:Booking,managedContext:NSManagedObjectContext) -> Booking?{
        let fetchedResultsController = getBookings(managedContext: managedContext)
        let bookingList = fetchedResultsController.fetchedObjects!
        for Booking in bookingList{
            if(Booking == booking){
                return Booking
            }
        }
        return nil
    }
}
