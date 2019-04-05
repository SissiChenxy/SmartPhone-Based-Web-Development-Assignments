//
//  MovieTableViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
import CoreData

class MovieTableViewController: UITableViewController, UISearchResultsUpdating,NSFetchedResultsControllerDelegate {

    var filtedObjs:[Movie] = [Movie]()
    let searchController = UISearchController(searchResultsController: nil) //if nil, use same tableview controller to show the result
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var managedContext : NSManagedObjectContext!
    var movieEntity: NSEntityDescription!
    let movieService = MovieService()
    var movies:[MovieModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let editButton = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItems = [editButton,addButton]
        self.definesPresentationContext = true

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type Movie's name here to search"
        navigationItem.searchController = searchController
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        movieEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        
        initMovieList()
        movieService.getMovies(managedContext: managedContext)
    }
    
    func initMovieList(){
        let movieNames:[String] = ["aquaman","bumblebee","avengers"]
        
        let result = self.movieService.isMovieCoreDataEmpty(entity: "Movie", managedContext: self.managedContext)
        if(result == 0){
            for name in movieNames{
                let urlString = "http://www.omdbapi.com/?apikey=9e62984a&t="+name
                guard let url = URL(string: urlString) else { return }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                    guard let data = data else { return }
                    //Implement JSON decoding and parsing
                    do {
                        //Decode retrived data with JSONDecoder and assing type of MovieModel object
                        let movieData = try JSONDecoder().decode(MovieModel.self, from: data)
                        
                        //Get back to the main queue
                        DispatchQueue.main.async {
                            self.movies.append(movieData)
                            if let url = URL.init(string: movieData.Poster){
                                do {
                                    let imageData = try Data(contentsOf: url)
                                    print("imageData")
                                    print(imageData)
                                    self.movieService.saveMovie(name: movieData.Title, type: movieData.Genre, quantity: Int16(7), img: imageData, releaseYear: Int16(movieData.Year)!, managedContext: self.managedContext)
                                }catch{
                                    print(error)
                                }
                            }
                            self.tableView?.reloadData()
                        }
                    }catch let parsingError {
                        print(parsingError)
                    }
                    }.resume()
            }
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    //decide how many rows table view has
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(isFiltering()){
            return filtedObjs.count
        }else{
            return movieService.getMovies(managedContext: managedContext).count
        }
    }
    //what will be shown inside the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        var object = ""
        var subtitle = ""
        var image = UIImage()
        if(isFiltering()){
            object = filtedObjs[indexPath.row].name!
            subtitle = String(filtedObjs[indexPath.row].releaseYear)
            image = UIImage(data:filtedObjs[indexPath.row].img!)!
        }else{
            object = movieService.movieList[indexPath.row].name!
            subtitle = String(movieService.movieList[indexPath.row].releaseYear)
            image = UIImage(data: movieService.movieList[indexPath.row].img!)!
        }
        
        cell.textLabel?.text = object
        cell.detailTextLabel?.text = subtitle
        cell.imageView?.image = image
        
        return cell
    }
    
    //search functionality
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        //create a method to ilter the objects
        filterContentForSearchText(text)
    }
    
    func filterContentForSearchText(_ searchText: String){
        
        filtedObjs = movieService.movieList.filter({ (Movie:Movie) -> Bool in
            if (searchController.searchBar.text?.isEmpty)! {
                return true
            }else {
                return Movie.name!.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return (searchController.isActive && !(searchController.searchBar.text?.isEmpty)!)
    }

    // MARK: - Table view data source
    
    @objc func insertNewObject(_ sender:Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
        vc.title = "Create New Movie"
        vc.btnTitle = "Create Movie"
        self.navigationController?.show(vc, sender: self)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            if(isFiltering()){
                filtedObjs.remove(at: indexPath.row)
                movieService.movieList = movieService.getMovies(managedContext: managedContext)
            }else{
                movieService.movieList.remove(at: indexPath.row)
                let movie = movieService.getMovies(managedContext: managedContext)[indexPath.row]
                managedContext.delete(movie)
            }
            movieService.saveContext(managedContext: managedContext)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMovieDetailSegue"{
//            let indexPath = tableView.indexPathForSelectedRow
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let vc = segue.destination as! MovieDetailViewController
            vc.title = "Edit Movie Details"
            vc.btnTitle = "Save Changes"
            vc.movie = movieService.movieList[indexPath!.row].self
        }
    }
    
}
