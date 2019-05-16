//
//  EditViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/11/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var presentCustomer = Customer(customerFullName: "", customerFirstPhoneNumber: "", customerSecondPhoneNumber: "", currentNumberOfPoints: 0, customerEmailAddress: "")
    
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var phoneOneField: UITextField!
    @IBOutlet weak var phoneTwoField: UITextField!
    @IBOutlet weak var currentPointsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateFields()
        
    }
    func updateFields(){
        fullNameField.text = presentCustomer.name
        emailAddressField.text = presentCustomer.emailAddress
        phoneOneField.text = presentCustomer.phoneNumberOne
        phoneTwoField.text = presentCustomer.phoneNumberTwo
        currentPointsField.text = String(presentCustomer.numOfPoints)
    }
    @IBAction func minusOneTapped(_ sender: Any) {
        presentCustomer.numOfPoints -= 1
        updateFields()
    }
    @IBAction func minusFiveTapped(_ sender: Any) {
        presentCustomer.numOfPoints -= 4
        updateFields()
    }
    
    @IBAction func minusTenTapped(_ sender: Any) {
        presentCustomer.numOfPoints -= 9
        updateFields()
    }
    @IBAction func plusOneTapped(_ sender: Any) {
        presentCustomer.numOfPoints += 1
        updateFields()
    }
    @IBAction func plusFiveTapped(_ sender: Any) {
        presentCustomer.numOfPoints += 4
        updateFields()
    }
    @IBAction func plusTenTapped(_ sender: Any) {
        presentCustomer.numOfPoints += 9
        updateFields()
    }
    @IBAction func resetPointsTapped(_ sender: Any) {
        print("Reset Points : Reward Issued ")
        presentCustomer.numOfPoints = 0
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
