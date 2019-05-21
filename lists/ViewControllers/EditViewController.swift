//
//  EditViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/11/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    //    var selectedIndex : Int = 0
    //    var currentCustomers : [Customers] = []
    var selectedCustomer: Customers!
    
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var phoneOneField: UITextField!
    @IBOutlet weak var phoneTwoField: UITextField!
    @IBOutlet weak var currentPointsField: UITextField!
    @IBOutlet weak var addAmountField: UITextField!
        @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var purchaseTableView: UITableView!
    
    
    func createAlert() -> UIAlertController{
        let alert = UIAlertController(title: "Upgrade To Paid For This Feature", message: "Enjoy the perks of being a premium client", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nah I'm good", style: .cancel, handler: { (action) in
            print("Scumbag")
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Yes, I want to Grow", style: .default, handler: { (action) in
            print("Send to App store")
            alert.dismiss(animated: true, completion: nil)
            
        }))
        return alert
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseTableView.delegate = self
        purchaseTableView.dataSource = self
        //currentCustomers = PersistenceService.getCustomers()
        // Do any additional setup after loading the view.
        updateFields()
        purchaseTableView.rowHeight = 100
        purchaseTableView.layer.borderWidth = 1
    }
    override func viewWillAppear(_ animated: Bool) {
        emailAddressField.keyboardType = .emailAddress
        phoneOneField.keyboardType = .numberPad
        phoneTwoField.keyboardType = .numberPad
        currentPointsField.keyboardType = .numberPad
        fullNameField.keyboardType = .default
        addAmountField.keyboardType = .numberPad
        purchaseTableView.layer.borderWidth = 2
//        addButtonOutlet.layer.borderWidth = 1
        
    }
    func updateFields(){
        PersistenceService.saveContext()
        
        fullNameField.text = selectedCustomer.name
        emailAddressField.text = selectedCustomer.emailAddress
        phoneOneField.text = selectedCustomer.phoneNumberOne
        phoneTwoField.text = selectedCustomer.phoneNumberTwo
        currentPointsField.text = "\(selectedCustomer.numOfPoints)"
    }
    
    @IBAction func resetPointsTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = 0
        updateFields()
    }
    @IBAction func saveTapped(_ sender: Any) {
        let points = Int64(currentPointsField.text!) ?? 0
        
        selectedCustomer.name = fullNameField.text
        selectedCustomer.emailAddress = emailAddressField.text
        selectedCustomer.phoneNumberOne = phoneOneField.text
        selectedCustomer.phoneNumberTwo = phoneTwoField.text
        selectedCustomer.numOfPoints = points
        
        PersistenceService.saveContext()
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addReceiptTapped(_ sender: Any) {
        
        guard let tempAmmount = Int64(addAmountField.text!) else {
            print("add amount is nil")
            return
        }
        selectedCustomer.numOfPoints += tempAmmount
        updateFields()
        addAmountField.text = ""
    }
    
    @IBAction func addNewTransactionTapped(_ sender: Any) {
        // Present a modal where the user can input a transaction.
        present(createAlert(), animated: true
            , completion: nil)
        
    }
    
}


extension EditViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = purchaseTableView.dequeueReusableCell(withIdentifier: "purchaseCell") as! PurchaseTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.present(createAlert(), animated: true, completion: nil)
        purchaseTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
