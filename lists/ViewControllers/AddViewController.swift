//
//  AddViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/16/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    
    // Testing to see if prepareForSegue from master is properly sending over information
    var segueString : String = ""
    
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var phoneNumberOneField: UITextField!
    @IBOutlet weak var phoneNumberTwoField: UITextField!
    @IBOutlet weak var currentPointsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(segueString)
    }
    override func viewDidAppear(_ animated: Bool) {
        emailAddressField.keyboardType = .emailAddress
        phoneNumberOneField.keyboardType = .numberPad
        phoneNumberTwoField.keyboardType = .numberPad
        currentPointsField.keyboardType = .numberPad
        fullNameField.keyboardType = .default
    }
    
    
    func createNewCustomer(){
        /*
         Create a new customer object
        */
        guard let entityFromContext = NSEntityDescription.entity(forEntityName: "Customers", in: PersistenceService.persistentContainer.viewContext)
            else {
                print("Error unwrapping")
                return
        }
        
        let name = fullNameField.text
        let emailAddress = emailAddressField.text
        let phoneOne = phoneNumberOneField.text
        let phoneTwo = phoneNumberTwoField.text
        let points = Int(currentPointsField.text!)

        let person = NSManagedObject(entity: entityFromContext, insertInto: PersistenceService.persistentContainer.viewContext)
        person.setValue(name, forKey: "name")
        person.setValue(emailAddress, forKey: "emailAddress")
        person.setValue(phoneOne, forKey: "phoneNumberOne")
        person.setValue(phoneTwo, forKey: "phoneNumberTwo")
        person.setValue(points, forKey: "numOfPoints")
        PersistenceService.saveContext()
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        
        //Save to core data
        createNewCustomer()
        //return to root controller
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
