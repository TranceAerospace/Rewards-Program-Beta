//
//  Customers+CoreDataProperties.swift
//  lists
//
//  Created by Dominic Gallo on 5/16/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//
//

import Foundation
import CoreData


extension Customers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customers> {
        return NSFetchRequest<Customers>(entityName: "Customers")
    }

    @NSManaged public var emailAddress: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var numOfPoints: Int64
    @NSManaged public var phoneNumberOne: String?
    @NSManaged public var phoneNumberTwo: String?

}
