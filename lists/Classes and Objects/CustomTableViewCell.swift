//
//  CustomTableViewCell.swift
//  lists
//
//  Created by Dominic Gallo on 5/8/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit
import CoreData
class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customCellLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // This function sets the custom cells labels based off of the customer object that is passed in
    func setLabels(data:Customers){
        //Email
        
        guard let email = data.emailAddress, let name = data.name, let phone = data.phoneNumberOne
            else {
                print("value is nil")
                return
        }
        let points = data.numOfPoints
        
        self.customCellLabel.text = email as? String ?? "Empty Email Address"
        self.nameLabel.text = name as? String ?? "Empty Name"
        self.pointsLabel.text = "\(points)"
        self.phoneNumberLabel.text = phone
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 0.3
    }

}
