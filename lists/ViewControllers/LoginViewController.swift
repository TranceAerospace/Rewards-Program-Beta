//
//  LoginViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/18/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var continueGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var continueView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        continueGesture = UITapGestureRecognizer(target: self, action:#selector(LoginViewController.continueTapped(_:)))
        continueGesture.numberOfTapsRequired = 1
        continueGesture.numberOfTouchesRequired = 1
        continueView.addGestureRecognizer(continueGesture)
        continueView.isUserInteractionEnabled = true
    }
    
    @objc @IBAction func continueTapped(_ sender: UITapGestureRecognizer) {
        
        print("Button pressed")
        self.performSegue(withIdentifier: "toMasterFromLogin", sender: nil)
    }
    
}
