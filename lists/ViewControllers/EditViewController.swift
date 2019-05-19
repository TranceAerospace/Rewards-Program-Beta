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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //currentCustomers = PersistenceService.getCustomers()
        // Do any additional setup after loading the view.
        updateFields()
    }
    override func viewWillAppear(_ animated: Bool) {
        emailAddressField.keyboardType = .emailAddress
        phoneOneField.keyboardType = .numberPad
        phoneTwoField.keyboardType = .numberPad
        currentPointsField.keyboardType = .numberPad
        fullNameField.keyboardType = .default
    }
    func updateFields(){
        PersistenceService.saveContext()
        
        fullNameField.text = selectedCustomer.name
        emailAddressField.text = selectedCustomer.emailAddress
        phoneOneField.text = selectedCustomer.phoneNumberOne
        phoneTwoField.text = selectedCustomer.phoneNumberTwo
        currentPointsField.text = "\(selectedCustomer.numOfPoints)"
    }
    
    @IBAction func minusOneTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = selectedCustomer.numOfPoints - 1
        updateFields()
        
    }
    @IBAction func minusFiveTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = selectedCustomer.numOfPoints - 5
        updateFields()
    }
    
    @IBAction func minusTenTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = selectedCustomer.numOfPoints - 10
        updateFields()
    }
    @IBAction func plusOneTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = selectedCustomer.numOfPoints + 1
        updateFields()
    }
    @IBAction func plusFiveTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = selectedCustomer.numOfPoints + 5
        updateFields()
    }
    @IBAction func plusTenTapped(_ sender: Any) {
        selectedCustomer.numOfPoints = selectedCustomer.numOfPoints + 10
        updateFields()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
