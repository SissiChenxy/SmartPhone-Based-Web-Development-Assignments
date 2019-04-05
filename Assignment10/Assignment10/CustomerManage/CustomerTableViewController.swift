//
//  CustomerTableViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
import CoreData

class CustomerTableViewController: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {
    
    let searchController = UISearchController(searchResultsController: nil) //if nil, use same tableview controller to show the result
    let customerService = CustomerService()
    var searchResultsController: NSFetchedResultsController<Customer>!
    var managedContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        // Uncomment the following line to preserve selection between presentations

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let editButton = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItems = [editButton,addButton]
        self.definesPresentationContext = true

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type Customer's name here to search"
        navigationItem.searchController = searchController
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        
        searchResultsController = customerService.getCustomers(managedContext: managedContext)
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
            guard let customers = customerService.getCustomers(managedContext: managedContext).fetchedObjects else {return 0}
            return customers.count
        }
    }
    //what will be shown inside the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var object = ""
        if(isFiltering()){
            object = searchResultsController.object(at: indexPath).name!
        }else{
            let customers = customerService.getCustomers(managedContext: managedContext)
            object = customers.object(at: indexPath).name!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath)
        
        cell.textLabel?.text = object
        
        return cell
    }
    
    //search functionality
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        //create a method to ilter the objects
        filterContentForSearchText(text)
    }
    
    func filterContentForSearchText(_ searchText: String){
    
        let namePredicate = NSPredicate(format: "name CONTAINS[cd] %@", searchText.lowercased())
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
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailViewController
        vc.title = "Create New Customer"
        vc.btnTitle = "Create Customer"
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
            if(isFiltering()){
                let customer = searchResultsController.object(at: indexPath)
                managedContext.delete(customer)
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
                let customer = customerService.getCustomers(managedContext: managedContext).object(at: indexPath)
                managedContext.delete(customer)
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
        if segue.identifier == "showCustomerDetailSegue"{
            let indexPath = tableView.indexPathForSelectedRow!
            let cus = customerService.getCustomers(managedContext: managedContext).object(at: indexPath) as! Customer
            
            let vc = segue.destination as! CustomerDetailViewController
            vc.title = "Edit Customer Details"
            vc.btnTitle = "Save Changes"
            vc.navigationController?.isNavigationBarHidden = false
            vc.customer = cus
        }
    }

}
