//
//  ViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/8/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    /*
     newCustomer, secondCustomer and thirdCustomer are defined in Customer.Swift
     Ideally this data would be the return of a core data fetch request.
     Something like,
     private var customerData = fetchCustomerData()
     where,
     func fetchCustomerData() -> [Customer]
     */
//    private var customerData : [Customer] = [newCustomer,secondCustomer,thirdCustomer];
    @IBOutlet weak var tablieview: UITableView!
    
    
    var coreCustomers : [Customers] = []
    var filteredData : [Customers] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Allow the view controller to become the datasource for the table view
        tablieview.dataSource = self
        tablieview.delegate = self
        searchBar.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = nil
        
        if (segue.identifier == "toEditFromMaster"){
            let s = segue.destination as! EditViewController
            s.selectedCustomer = sender as? Customers
            s.navigationItem.title = "Edit Customer Data"
        }
        
        if (segue.identifier == "toAddFromMaster"){
            let s = segue.destination as! AddViewController
            s.navigationItem.title = "Add A New Customer!"
            s.segueString = "Add View Controller"
        }
    }
    @IBAction func logOutTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
 // Core Data
extension ViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tablieview.reloadData()
        self.navigationItem.title = "Pickle Me Pete's Rewards Program"
        coreCustomers = PersistenceService.getCustomers()
        filteredData = coreCustomers
        filteredData.sort { (customerOne, customerTwo) -> Bool in
            return (customerOne.numOfPoints) > (customerTwo.numOfPoints)
        }
        tablieview.reloadData()
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    // Number of different sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablieview.dequeueReusableCell(withIdentifier: "cellRI") as! CustomTableViewCell
        // Since cell is a CustomerTableViewCell it inherits the setLabels(data: Customer) method. 
        cell.setLabels(data: filteredData[indexPath.row])
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 45 as CGFloat
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toEditFromMaster", sender: filteredData[indexPath.row])
//        self.performSegue(withIdentifier: "toEditFromMaster", sender: indexPath.row)
        
        //Removes highlighting. 
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            print("Delete Selected")
            PersistenceService.context.delete(filteredData[indexPath.row])
            PersistenceService.saveContext()
            coreCustomers = PersistenceService.getCustomers()
            filteredData = coreCustomers
            tableView.reloadData()
        }
    }
}
// Search Bar

extension ViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true;
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        // Filters based on name
//        filteredData = searchText.isEmpty ? coreCustomers : coreCustomers.filter({ (customer:Customers) -> Bool in
//            return (customer.name?.range(of: searchText, options: .caseInsensitive) != nil)
//        })
        
        filteredData = searchText.isEmpty ? coreCustomers : coreCustomers.filter({ (customer:Customers) -> Bool in
            return (customer.name?.range(of: searchText, options: .caseInsensitive) != nil || customer.emailAddress?.range(of: searchText, options: .caseInsensitive) != nil || customer.phoneNumberOne?.range(of: searchText) != nil)
        })
        //Sorts the filtered data based on purchase amount.
//
        filteredData.sort { (customerOne, customerTwo) -> Bool in
            return (customerOne.numOfPoints) > (customerTwo.numOfPoints)
        }

        tablieview.reloadData()
    }
}

