//
//  Movie.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/2/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import Foundation

class Movie{
    var id: Int = movieId
    var name: String = ""
    var releaseYear: Int = 0
    var type: String = ""
    var quantity: Int = 0
    static var movieId:Int = 1
    
    init(){}
    init(Name:String, ReleaseYear: Int, Type:String, Quantity:Int){
        Movie.movieId += 1
        self.name = Name
        self.releaseYear = ReleaseYear
        self.type = Type
        self.quantity = Quantity
    }
    
    static func FindMovie(name:String) -> Movie?{
        for Movie in AppDelegate.MovieList{
            if(Movie.name==name){
                return Movie
            }
        }
        return nil
    }
    
    static func ExistedMovie(name:String,year:Int,type:String,quantity:Int) -> Movie?{
        for Movie in AppDelegate.MovieList{
            if(Movie.name==name&&Movie.releaseYear==year&&Movie.type==type&&Movie.quantity==quantity){
                return Movie
            }
        }
        return nil
    }
}



