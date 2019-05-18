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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // This function sets the custom cells labels based off of the customer object that is passed in
    func setLabels(data:NSManagedObject){
        //Email
        
        guard let email = data.value(forKey: "emailAddress"), let name = data.value(forKey: "name"), let points = data.value(forKey: "numOfPoints")
            else {
                print("value is nil")
                return
        }
        self.customCellLabel.text = email as? String
        self.nameLabel.text = name as? String
        self.pointsLabel.text = "\(points)"

    }

}
