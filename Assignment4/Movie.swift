//
//  Movie.swift
//  try
//
//  Created by Xinyun Chen on 2/14/19.
//  Copyright © 2019 Xinyun Chen. All rights reserved.
//

import Foundation
enum MovieType{
    case Action
    case Adventure
    case Animation
    case Comedy
    case Crime
    case Documentary
    case Drama
    case Historical
    case Musical
    case Fiction
    case War
    case None
}

class Movie{
    var id: Int = movieId
    var name: String = ""
    var releaseYear: Int = 0
    var type: MovieType = MovieType.None
    var quantity: Int = 0
    static var movieId:Int = 1
    
    init(){}
    init(Name:String, ReleaseYear: Int, Type:MovieType, Quantity:Int){
        Movie.movieId += 1
        self.name = Name
        self.releaseYear = ReleaseYear
        self.type = Type
        self.quantity = Quantity
    }
}

var MovieList: Array<Movie> = Array()

func AddMovie(){
    let m = Movie()
    while(true){
        print("Movie Name: ")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Movie name cannot be empty! \n")
            continue
        }
        m.name = name
        
        print("Release Year: ")
        guard let year:String = readLine(), !year.isEmpty,Int(year) != nil else{
            print("Release Year cannot be empty! \n")
            continue
        }
        m.releaseYear = Int(year)!
        
        print("Quantity: ")
        guard let quantity:String = readLine(), !quantity.isEmpty, Int(quantity) != nil else{
            print("Movie Quantity cannot be empty! \n")
            continue
        }
        m.quantity = Int(quantity)!
        chooseType(movie: m)
        MovieList.append(m)
        print("Movie created successfully! \n")
        ViewAllMovies()
        break
    }
}

func chooseType(movie:Movie){
    while(true){
        print("Movie Type: 1. Action 2. Adventure 3. Animation 4.Comedy 5. Crime 6. Documentary 7. Drama 8. Historical 9. Musical 10. Fiction 11. War")
        guard let type:String = readLine(), type=="1" || type=="2" || type=="3" || type=="4" || type=="5" || type=="6" || type=="7" || type=="8" || type=="9" || type=="10" || type=="11" else{
            print("Movie Type cannot be empty! \n")
            continue
        }
        if(type=="1"){
            movie.type = MovieType.Action
        }else if(type == "2"){
            movie.type = MovieType.Adventure
        }else if(type == "3"){
            movie.type = MovieType.Animation
        }else if(type == "4"){
            movie.type = MovieType.Comedy
        }else if(type == "5"){
            movie.type = MovieType.Crime
        }else if(type == "6"){
            movie.type = MovieType.Documentary
        }else if(type == "7"){
            movie.type = MovieType.Drama
        }else if(type == "8"){
            movie.type = MovieType.Historical
        }else if(type == "9"){
            movie.type = MovieType.Musical
        }else if(type == "10"){
            movie.type = MovieType.Fiction
        }else if(type == "11"){
            movie.type = MovieType.War
        }
    }
}

func UpdateMovieDetails(){
    var targetMovie = Movie()
    while(true){
        print("Please input the name of the movie you want to update: ")
        guard let nameStr:String = readLine(),!nameStr.isEmpty else{
            print("Name cannot be empty! \n")
            continue
        }
        if ExistedMovie(name: nameStr) == nil {
            print("This Movie doesn't exist in system \n")
            continue
        }
        targetMovie = ExistedMovie(name: nameStr)!
        break
    }
    while(true){
        print("Please choose the number of which value you want to change: ")
        print("1. Name 2. Release Year 3. Type 4. Quantity")
        guard let option:String = readLine(), !option.isEmpty else{
            print("You need to choose a number \n")
            continue
        }
        switch option{
        case "1":
            print("Name: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Name cannot be empty! \n")
                continue
            }
            targetMovie.name = nameStr
            print("Movie's name changed to \(targetMovie.name) successfully! \n")
        case "2":
            print("Release Year: ")
            guard let yearStr:String = readLine(), !yearStr.isEmpty,Int(yearStr) != nil else{
                print("Year cannot be empty! \n")
                continue
            }
            targetMovie.releaseYear = Int(yearStr)!
            print("Movie's Release Year changed to \(targetMovie.releaseYear) successfully! \n")
        case "3":
            chooseType(movie:targetMovie)
            print("Movie's type changed to \(targetMovie.type) successfully! \n")
        case "4":
            print("Quantity: ")
            guard let quantityStr:String = readLine(), !quantityStr.isEmpty, Int(quantityStr) != nil else{
                print("Quantity cannot be empty! \n")
                continue
            }
            targetMovie.quantity = Int(quantityStr)!
            print("Movie's quantity changed to \(targetMovie.quantity) successfully! \n")
        default:
            print("Please follow the instructions below \n")
            continue
        }
        
    }
}

func ViewAllMovies(){
    if(MovieList.isEmpty){
        print("No movie in the system now! \n")
    }else{
        print("All Movies are here: ")
        for Movie in MovieList{
            print("Id: \(Movie.id), Name: \(Movie.name), Release Year: \(Movie.releaseYear), Type: \(Movie.type), Quantity: \(Movie.quantity) \n")
        }
    }
}

func ExistedMovie(name:String) -> Movie?{
    for Movie in MovieList{
        if(Movie.name==name){
            return Movie
        }
    }
    return nil
}
