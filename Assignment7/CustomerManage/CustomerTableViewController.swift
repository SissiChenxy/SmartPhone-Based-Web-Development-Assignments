//
//  CustomerTableViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class CustomerTableViewController: UITableViewController, UISearchResultsUpdating {

    var filtedObjs:[Customer] = [Customer]()
    let searchController = UISearchController(searchResultsController: nil) //if nil, use same tableview controller to show the result
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backToPrevious))
        let editButton = self.editButtonItem
        
        self.navigationItem.leftBarButtonItem = backButton
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItems = [editButton,addButton]
        self.navigationController?.isNavigationBarHidden = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = true

        searchController.searchResultsUpdater = self
        //tableView.tableHeaderView = searchController.searchBar
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type Customer's name here to search"
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
            return AppDelegate.CustomerList.count
        }
    }
    //what will be shown inside the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var object = ""
        if(isFiltering()){
            object = filtedObjs[indexPath.row].name
        }else{
            object = AppDelegate.CustomerList[indexPath.row].name
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath)
        
        cell.textLabel?.text = object
        
        return cell
    }
    
    @objc func backToPrevious(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainMenuVC")
        self.navigationController?.show(vc, sender: self)
    }
    
    //search functionality
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        //create a method to ilter the objects
        filterContentForSearchText(text)
    }
    
    func filterContentForSearchText(_ searchText: String){
        
        filtedObjs = AppDelegate.CustomerList.filter({ (customer:Customer) -> Bool in
            if (searchController.searchBar.text?.isEmpty)! {
                return true
            }else {
                return customer.name.lowercased().contains(searchText.lowercased())
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
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailViewController
        vc.title = "Create New Customer"
        vc.btnTitle = "Create Customer"
        self.navigationController?.show(vc, sender: self)
        //customerNameList.insert(NSDate().description, at: 0)
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
            AppDelegate.CustomerList.remove(at: indexPath.row)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = ViewController()
//        vc.title = "Detailed View Controller"
//        vc.view.backgroundColor = .red
//        self.navigationController?.show(vc, sender: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailViewController
        vc.title = "Edit Customer Details"
        vc.btnTitle = "Save Changes"
        vc.customer = Customer.FindCustomer(name: AppDelegate.CustomerList[indexPath.row].name)!
        
        //solve the missing of back button after search controller
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.show(vc, sender: self)
        searchController.searchBar.text = ""
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        _ = AppDelegate.CustomerList[indexPath.row].name
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailViewController
        self.navigationController?.show(vc, sender: self)
        vc.title = "Edit Customer Details"
        vc.btnTitle = "Save Changes"
        searchController.searchBar.text = ""
    }
    
    

}
