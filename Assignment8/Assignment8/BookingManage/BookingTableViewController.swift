//
//  BookingTableViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class BookingTableViewController: UITableViewController, UISearchResultsUpdating {

    var filtedObjs:[Booking] = [Booking]()
    let searchController = UISearchController(searchResultsController: nil) //if nil, use same tableview controller to show the result
    
    
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
            return AppDelegate.BookingList.count
        }
    }
    //what will be shown inside the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var object = ""
        var subtitle = ""
        if(isFiltering()){
            object = (filtedObjs[indexPath.row].movie?.name)! + " " + String(filtedObjs[indexPath.row].quantity!)
            subtitle = (filtedObjs[indexPath.row].customer?.name)!
        }else{
            object = (AppDelegate.BookingList[indexPath.row].movie?.name)! + " " +  String(AppDelegate.BookingList[indexPath.row].quantity!)
            subtitle = (AppDelegate.BookingList[indexPath.row].customer?.name)!
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
        
        filtedObjs = AppDelegate.BookingList.filter({ (Booking:Booking) -> Bool in
            if (searchController.searchBar.text?.isEmpty)! {
                return true
            }else {
                return Booking.movie!.name.lowercased().contains(searchText.lowercased()) || (Booking.customer!.name).lowercased().contains(searchText.lowercased())
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
            AppDelegate.BookingList.remove(at: indexPath.row)
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
            vc.booking = Booking.FindBooking(id: AppDelegate.MovieList[indexPath!.row].id)!
        }
    }
}
