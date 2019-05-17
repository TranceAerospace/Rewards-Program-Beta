//
//  AddViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/16/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

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
    
    func createNewCustomer(custName : String){
        /*
         Create a new customer object
        */
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        
        //Save to core data
        
        //return to root controller
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
