//
//  Item+CoreDataClass.swift
//  loaner
//
//  Created by Fariha Mohamed on 8/22/22.
//  Copyright © 2022 LinnierGames. All rights reserved.
//
//

import Foundation
import UIKit.UIImage
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()

        // Give properties initial values
        itemTitle = "Untitled Item"
        notes = ""
        itemImage = UIImage(named: "no item image")!
        loanee = Loanee(name: "", contactNumber: "")
    }
    
    
    
    func assignLoanee(name: String?, phoneNumber: String?) {
           
           //validate contact has at least one number
           guard let contactNumber = phoneNumber else {
               return print("this contact needed to have at least one number")
           }
           
           if let contactName = name {
               
               //update loanee var
               let newLoanee = Loanee(
                   name: contactName,
                   contactNumber: contactNumber
               )
               loanee = newLoanee
           } else {
               loanee = Loanee.init(name: "no name", contactNumber: "no contact number")
              }
           }
    
  
    
}



