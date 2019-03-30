//
//  MovieService.swift
//  Assignment9
//
//  Created by 陈昕昀 on 3/29/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MovieService {
    
//    var managedObjectContext:NSManagedObjectContext!
//    var movieEntity:NSEntityDescription!
    
//    init(){
//        let app = UIApplication.shared.delegate as! AppDelegate
//        //managedContext = app.persistentContainer.viewContext
//    }
    
    func getMovies(managedContext:NSManagedObjectContext) -> [Movie]{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortName]
        
        do{
            AppDelegate.MovieList = try managedContext.fetch(fetchRequest) as! [Movie]
        }catch let error as NSError{
            print("Error :\(error.userInfo)")
        }
        
        return AppDelegate.MovieList
    }
    
    func saveMovie(name:String,type:String,quantity:Int,img:Data,releaseYear:Int,managedContext:NSManagedObjectContext) -> Movie{
        
        //let movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: managedContext) as! Movie
        let movieEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        let movie = NSManagedObject.init(entity: movieEntity!, insertInto: managedContext)
        movie.setValue(name, forKey: "name")
        movie.setValue(type, forKey: "type")
        movie.setValue(Int16(quantity), forKey: "quantity")
        movie.setValue(img, forKey: "img")
        movie.setValue(Int16(releaseYear), forKey: "releaseYear")
        
        saveContext(managedContext: managedContext)
        return movie as! Movie
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
}
