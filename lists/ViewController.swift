//
//  ViewController.swift
//  lists
//
//  Created by Dominic Gallo on 5/8/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // data variable start
    private var data : [String] = []
    //tableView outlet connection from storyboard to view controller
    
    
    private var customerData : [Customer] = [newCustomer,secondCustomer,thirdCustomer];
    
    
    @IBOutlet weak var tablieview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Allow the view controller to become the datasource for the table view
        tablieview.dataSource = self;
        tablieview.delegate = self
        self.navigationItem.title = "Pickle Me Pete's Rewards Program"
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = nil
        
        if (segue.identifier == "toEditFromMaster"){
            let s = segue.destination as! EditViewController
            s.presentCustomer = customerData[sender as! Int]
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    // Number of different sections.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablieview.dequeueReusableCell(withIdentifier: "cellRI") as! CustomTableViewCell
        // Set labels
        cell.setLabels(data: customerData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45 as CGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toEditFromMaster", sender: indexPath.row)
    }
}
