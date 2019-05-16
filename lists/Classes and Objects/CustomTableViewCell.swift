//
//  CustomTableViewCell.swift
//  lists
//
//  Created by Dominic Gallo on 5/8/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

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
    
    func setLabels(data:Customer){
        //Email
        self.customCellLabel.text = data.emailAddress
        self.nameLabel.text = data.name
        self.pointsLabel.text = String(data.numOfPoints)
    }

}
