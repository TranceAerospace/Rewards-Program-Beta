//
//  Customer.swift
//  lists
//
//  Created by Dominic Gallo on 5/8/19.
//  Copyright © 2019 Dominic Gallo. All rights reserved.
//

import UIKit

class Customer{
    
    var name : String
    var phoneNumberOne: String
    var phoneNumberTwo : String?
    var numOfPoints : Int
    var emailAddress : String?
    
    init(customerFullName name:String, customerFirstPhoneNumber phoneNumberOne: String, customerSecondPhoneNumber phoneNumberTwo : String?, currentNumberOfPoints numOfPoints:Int, customerEmailAddress emailAddress : String?) {
        self.name = name
        self.phoneNumberOne = phoneNumberOne
        self.phoneNumberTwo = phoneNumberTwo
        self.numOfPoints = numOfPoints
        self.emailAddress = emailAddress
    }
    
    func resetPoints(){
        let prevPoints = self.numOfPoints
        self.numOfPoints = 0
        print("Reset customer rewards points from \(prevPoints) to \(self.numOfPoints)")
    }
}
var newCustomer = Customer(customerFullName: "Dom Gallo", customerFirstPhoneNumber: "6316721260", customerSecondPhoneNumber: nil, currentNumberOfPoints: 420, customerEmailAddress: "dgallo519@gmail.com")
var secondCustomer = Customer(customerFullName: "Andrew Novello", customerFirstPhoneNumber: "631-666-6642", customerSecondPhoneNumber: nil, currentNumberOfPoints: 42069, customerEmailAddress: "anovello@gmail.com")
var thirdCustomer = Customer(customerFullName: "Juliana Marko-Gallo", customerFirstPhoneNumber: "850-532-4845", customerSecondPhoneNumber: nil, currentNumberOfPoints: 420, customerEmailAddress: "markojuliana@yahoo.com")
