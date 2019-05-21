//
//  SendEmailViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/20/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

class SendEmailViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var emailSubjectField: UITextField!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    var actionMessage : String?
    @IBOutlet weak var textContentViewOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 10
        if(segmentedControlOutlet.selectedSegmentIndex == 0){
            actionMessage = "Email Sent"
        } else {
            actionMessage = "Text Message Sent"
        }
        emailSubjectField.layer.cornerRadius = 10
        textContentViewOutlet.layer.cornerRadius = 10
        emailSubjectField.layer.cornerRadius = 10 
    }
    
   
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            emailSubjectField.layer.isHidden = false
            actionLabel.text = "Draft New Email"
            actionMessage = "Email Sent"
        case 1:
            actionLabel.text = "Draft New Text Message"
            emailSubjectField.layer.isHidden = true
            actionMessage = "Text Sent"
        default:
            break
        }
    }

    @IBAction func sendEmailTapped(_ sender: Any) {
        // Make API Call to send emall and dismiss
        
        let alert = UIAlertController(title: "Upgrade To Paid For This Feature", message: "Enjoy the perks of being a premium client", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nah I'm good", style: .cancel, handler: { (action) in
            print("Scumbag")
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Yes, I want to Grow", style: .default, handler: { (action) in
            print("Send to App store")
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
        print(actionMessage)
//        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        // Dismiss
        dismiss(animated: true, completion: nil)
    }
}
