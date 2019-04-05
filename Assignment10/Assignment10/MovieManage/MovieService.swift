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

    var movieList : [Movie] = [Movie]()
    
    func getMovies(managedContext:NSManagedObjectContext) -> [Movie]{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortName]
        
        do{
            movieList = try managedContext.fetch(fetchRequest) as! [Movie]
        }catch let error as NSError{
            print("Error :\(error.userInfo)")
        }
        
        return movieList
    }
    
    func saveMovie(name:String,type:String,quantity:Int16,img:Data,releaseYear:Int16,managedContext:NSManagedObjectContext) -> Movie{
        
        //let movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: managedContext) as! Movie
        let movieEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        let movie = NSManagedObject.init(entity: movieEntity!, insertInto: managedContext)
        movie.setValue(name, forKey: "name")
        movie.setValue(type, forKey: "type")
        movie.setValue(quantity, forKey: "quantity")
        movie.setValue(img, forKey: "img")
        movie.setValue(releaseYear, forKey: "releaseYear")
        
        saveContext(managedContext: managedContext)
        return movie as! Movie
    }
    
    func FindMovie(movie:Movie) -> Movie?{
        for Movie in movieList{
            if(Movie == movie){
                return Movie
            }
        }
        return nil
    }
    
    func isMovieCoreDataEmpty(entity: String,managedContext:NSManagedObjectContext)-> Int
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
}
