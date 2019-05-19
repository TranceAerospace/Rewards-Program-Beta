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
    
    var selectedIndex : Int = 0
    var currentCustomers : [NSManagedObject] = []
    
//    var tempCust : Customer = Customer(customerFullName: "", customerFirstPhoneNumber: "", customerSecondPhoneNumber: "", currentNumberOfPoints: 0, customerEmailAddress: "")

    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var phoneOneField: UITextField!
    @IBOutlet weak var phoneTwoField: UITextField!
    @IBOutlet weak var currentPointsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCustomers = PersistenceService.getCustomers()
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
        currentCustomers = PersistenceService.getCustomers()
        
        
        guard let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") else {
            print("Error unwrapping points")
            return
        }
        fullNameField.text = currentCustomers[selectedIndex].value(forKey: "name") as? String
        emailAddressField.text = currentCustomers[selectedIndex].value(forKey: "emailAddress") as? String
        phoneOneField.text = currentCustomers[selectedIndex].value(forKey: "phoneNumberOne") as? String
        phoneTwoField.text = currentCustomers[selectedIndex].value(forKey: "phoneNumberTwo") as? String
        currentPointsField.text = "\(currentPoints)"
    }
    
    @IBAction func minusOneTapped(_ sender: Any) {
        
        let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as! Int
        let nextPoints = currentPoints - 1
        currentCustomers[selectedIndex].setValue(nextPoints, forKey: "numOfPoints")
        updateFields()
        
    }
    @IBAction func minusFiveTapped(_ sender: Any) {
        let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as! Int
        let nextPoints = currentPoints - 5
        currentCustomers[selectedIndex].setValue(nextPoints, forKey: "numOfPoints")
        updateFields()
    }
    
    @IBAction func minusTenTapped(_ sender: Any) {
        let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as! Int
        let nextPoints = currentPoints - 10
        currentCustomers[selectedIndex].setValue(nextPoints, forKey: "numOfPoints")
        updateFields()
    }
    @IBAction func plusOneTapped(_ sender: Any) {
        let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as! Int
        let nextPoints = currentPoints + 1
        currentCustomers[selectedIndex].setValue(nextPoints, forKey: "numOfPoints")
        updateFields()
    }
    @IBAction func plusFiveTapped(_ sender: Any) {
        let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as! Int
        let nextPoints = currentPoints + 5
        currentCustomers[selectedIndex].setValue(nextPoints, forKey: "numOfPoints")
        updateFields()
    }
    @IBAction func plusTenTapped(_ sender: Any) {
        let currentPoints = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as! Int
        let nextPoints = currentPoints + 10
        currentCustomers[selectedIndex].setValue(nextPoints, forKey: "numOfPoints")
        updateFields()
    }
    @IBAction func resetPointsTapped(_ sender: Any) {
        currentCustomers[selectedIndex].setValue(0, forKey: "numOfPoints")
        updateFields()
    }
    @IBAction func saveTapped(_ sender: Any) {
        currentCustomers[selectedIndex].setValue(fullNameField.text, forKey: "name")
        currentCustomers[selectedIndex].setValue(emailAddressField.text, forKey: "emailAddress")
        currentCustomers[selectedIndex].setValue(phoneOneField.text, forKey: "phoneNumberOne")
        currentCustomers[selectedIndex].setValue(phoneTwoField.text, forKey: "phoneNumberTwo")
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
