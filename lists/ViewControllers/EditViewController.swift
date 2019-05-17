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
    func updateFields(){
        
        fullNameField.text = currentCustomers[selectedIndex].value(forKey: "name") as? String
        emailAddressField.text = currentCustomers[selectedIndex].value(forKey: "emailAddress") as? String
        phoneOneField.text = currentCustomers[selectedIndex].value(forKey: "phoneNumberOne") as? String
        phoneTwoField.text = currentCustomers[selectedIndex].value(forKey: "phoneNumberTwo") as? String
        currentPointsField.text = currentCustomers[selectedIndex].value(forKey: "numOfPoints") as? String
    }
    @IBAction func minusOneTapped(_ sender: Any) {
//        currentCustomers[selectedIndex].numOfPoints -= 1
        updateFields()
    }
    @IBAction func minusFiveTapped(_ sender: Any) {
//        currentCustomers[selectedIndex].numOfPoints -= 4
        updateFields()
    }
    
    @IBAction func minusTenTapped(_ sender: Any) {
//        currentCustomers[selectedIndex].numOfPoints -= 9
        updateFields()
    }
    @IBAction func plusOneTapped(_ sender: Any) {
//        currentCustomers[selectedIndex].numOfPoints += 1
        updateFields()
    }
    @IBAction func plusFiveTapped(_ sender: Any) {
//        currentCustomers[selectedIndex].numOfPoints += 4
        updateFields()
    }
    @IBAction func plusTenTapped(_ sender: Any) {
//        currentCustomers[selectedIndex].numOfPoints += 9
        updateFields()
    }
    @IBAction func resetPointsTapped(_ sender: Any) {
        print("Reset Points : Reward Issued ")
//        currentCustomers[selectedIndex].numOfPoints = 0
        updateFields()
    }
    @IBAction func saveTapped(_ sender: Any) {
        
        
    navigationController?.popToRootViewController(animated: true)
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
