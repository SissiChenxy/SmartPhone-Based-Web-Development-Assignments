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
    while(true){
        var name:String = ""
        var releaseYear:Int = 0
        var quantity:Int = 0
        while(true){
            print("Movie Name: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Movie name cannot be empty! \n")
                continue
            }
            name = nameStr
            break
        }
        
        while(true){
            print("Release Year: ")
            guard let year:String = readLine(), !year.isEmpty,Int(year) != nil else{
                print("Release Year cannot be empty or Sting! \n")
                continue
            }
            releaseYear = Int(year)!
            break
        }
        
        while(true){
            print("Quantity: ")
            guard let quantityStr:String = readLine(), !quantityStr.isEmpty, Int(quantityStr) != nil else{
                print("Movie Quantity cannot be empty! \n")
                continue
            }
            quantity = Int(quantityStr)!
            break
        }
        let m = Movie(Name: name, ReleaseYear: releaseYear, Type: chooseType(), Quantity: quantity)
        MovieList.append(m)
        print("Movie created successfully! \n")
        ViewAllMovies()
        break
    }
}

func chooseType() -> MovieType {
    var type:MovieType = MovieType.None
    while(true){
        print("Movie Type: 1. Action 2. Adventure 3. Animation 4.Comedy 5. Crime 6. Documentary 7. Drama 8. Historical 9. Musical 10. Fiction 11. War")
        guard let typeStr:String = readLine(), typeStr=="1" || typeStr=="2" || typeStr=="3" || typeStr=="4" || typeStr=="5" || typeStr=="6" || typeStr=="7" || typeStr=="8" || typeStr=="9" || typeStr=="10" || typeStr=="11" else{
            print("Movie Type cannot be empty! \n")
            continue
        }
        if(typeStr=="1"){
            type = MovieType.Action
        }else if(typeStr == "2"){
            type = MovieType.Adventure
        }else if(typeStr == "3"){
            type = MovieType.Animation
        }else if(typeStr == "4"){
            type = MovieType.Comedy
        }else if(typeStr == "5"){
            type = MovieType.Crime
        }else if(typeStr == "6"){
            type = MovieType.Documentary
        }else if(typeStr == "7"){
            type = MovieType.Drama
        }else if(typeStr == "8"){
            type = MovieType.Historical
        }else if(typeStr == "9"){
            type = MovieType.Musical
        }else if(typeStr == "10"){
            type = MovieType.Fiction
        }else if(typeStr == "11"){
            type = MovieType.War
        }
        break
    }
    return type
}

func UpdateMovieDetails(){
    ViewAllMovies()
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
                print("Year cannot be empty or String! \n")
                continue
            }
            targetMovie.releaseYear = Int(yearStr)!
            print("Movie's Release Year changed to \(targetMovie.releaseYear) successfully! \n")
        case "3":
            targetMovie.type = chooseType()
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
        break
    }
}

func ViewAllMovies(){
    if(MovieList.isEmpty){
        print("No movie in the system now! \n")
        while(true){
            print("Do you want to add one movie now? (yes or no)")
            guard let option:String = readLine(), !option.isEmpty else{
                print("Please select one option! \n")
                continue
            }
            if (option == "yes"){
                AddMovie()
            }else{
                break
            }
        }
    }else{
        print("-------------------- All Movies are here --------------------")
        for Movie in MovieList{
            print("Id: \(Movie.id), Name: \(Movie.name), Release Year: \(Movie.releaseYear), Type: \(Movie.type), Quantity: \(Movie.quantity) \n")
        }
        print("-------------------------------------------------------------")
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
