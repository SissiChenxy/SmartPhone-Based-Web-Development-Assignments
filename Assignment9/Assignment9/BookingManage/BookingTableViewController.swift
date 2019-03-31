//
//  BookingTableViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
import CoreData

class BookingTableViewController: UITableViewController, UISearchResultsUpdating,NSFetchedResultsControllerDelegate {

    var filtedObjs:[Booking] = [Booking]()
    var managedContext : NSManagedObjectContext!
    let searchController = UISearchController(searchResultsController: nil) //if nil, use same tableview controller to show the result
    var searchResultsController: NSFetchedResultsController<Booking>!
    let bookingService = BookingService()
    
    
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
        //tableView.tableHeaderView = searchController.searchBar
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type Movie's or Customer's name here"
        navigationItem.searchController = searchController
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        searchResultsController = bookingService.getBookings(managedContext: managedContext)
        searchResultsController.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    //decide how many rows table view has
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(isFiltering()){
            return searchResultsController.fetchedObjects!.count
        }else{
            guard let bookings = bookingService.getBookings(managedContext: managedContext).fetchedObjects else {return 0}
            return bookings.count
        }
    }
    //what will be shown inside the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var object = ""
        var subtitle = ""
        if(isFiltering()){
            object = searchResultsController.object(at: indexPath).movie!.name!
            subtitle = searchResultsController.object(at: indexPath).customer!.name!
        }else{
            let booking = bookingService.getBookings(managedContext: managedContext).object(at: indexPath)
            object = booking.movie!.name!
            subtitle = booking.customer!.name!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath)
        
        cell.textLabel?.text = object
        cell.detailTextLabel?.text = subtitle
        
        return cell
    }
    
    //search functionality
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        //create a method to ilter the objects
        filterContentForSearchText(text)
    }
    
    func filterContentForSearchText(_ searchText: String){
        
        let namePredicate = NSPredicate(format: "movie CONTAINS[cd] %@ OR customer CONTAINS[cd] %@ ", searchText.lowercased())
        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate])
        
        searchResultsController!.fetchRequest.predicate = predicate
        do {
            try searchResultsController!.performFetch()
        }
        catch {
            fatalError("Error in fetching records")
        }
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return (searchController.isActive && !(searchController.searchBar.text?.isEmpty)!)
    }

    // MARK: - Table view data source
    
    @objc func insertNewObject(_ sender:Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookingDetailVC") as! BookingDetailViewController
        vc.title = "Create New Booking"
        vc.btnTitle = "Create Booking"
        self.navigationController?.show(vc, sender: self)
        //BookingNameList.insert(NSDate().description, at: 0)
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
                let booking = searchResultsController.object(at: indexPath)
                managedContext.delete(booking)
                do{
                    try managedContext.save()
                }catch {
                    print("Some thing went wrong \(error.localizedDescription)")
                }
                do{
                    try searchResultsController.performFetch()
                }catch {
                    fatalError("Error in fetching records")
                }
            }else{
                // Delete the row from the data source
                let booking = bookingService.getBookings(managedContext: managedContext).object(at: indexPath)
                managedContext.delete(booking)
                do{
                    try managedContext.save()
                }catch {
                    print("Some thing went wrong \(error.localizedDescription)")
                }
            }
            
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
        if segue.identifier == "showBookingDetailSegue"{
            //            let indexPath = tableView.indexPathForSelectedRow
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let vc = segue.destination as! BookingDetailViewController
            vc.title = "Edit Booking Details"
            vc.btnTitle = "Save Changes"
            let booking = bookingService.getBookings(managedContext: managedContext).object(at: indexPath!) as! Booking
            vc.booking = booking
        }
    }
}
