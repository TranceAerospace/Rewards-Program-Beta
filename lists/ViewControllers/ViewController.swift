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
    private var customerData : [Customer] = [newCustomer,secondCustomer,thirdCustomer];
    @IBOutlet weak var tablieview: UITableView!
    
    
    var coreCustomers : [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Allow the view controller to become the datasource for the table view
        tablieview.dataSource = self;
        tablieview.delegate = self

        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = nil
        
        if (segue.identifier == "toEditFromMaster"){
            let s = segue.destination as! EditViewController
            s.selectedIndex = sender as! Int
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
        self.navigationItem.title = "Pickle Me Pete's Rewards Program"
        coreCustomers = PersistenceService.getCustomers()
        tablieview.reloadData()
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    // Number of different sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreCustomers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablieview.dequeueReusableCell(withIdentifier: "cellRI") as! CustomTableViewCell
        // Since cell is a CustomerTableViewCell it inherits the setLabels(data: Customer) method. 
        cell.setLabels(data: coreCustomers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45 as CGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toEditFromMaster", sender: indexPath.row)
        
        //Removes highlighting. 
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            print("Delete Selected")
            PersistenceService.context.delete(coreCustomers[indexPath.row])
            PersistenceService.saveContext()
            coreCustomers = PersistenceService.getCustomers()
            tableView.reloadData()
        }
    }
}

