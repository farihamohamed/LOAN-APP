//
//  Loanee.swift
//  loaner
//
//  Created by Thomas Vandegriff on 3/13/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit

public class Loanee: NSObject, NSCoding {

        var name: String
        var contactNumber: String?
    
    
    enum Keys: String {
        case name = "name"
        case contactNumber = "contactNumber"
    }
    
    
        
        init(name: String, contactNumber: String?) {
            self.name = name
            self.contactNumber = contactNumber
        }

   public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(contactNumber, forKey: "contactNumber")
    }

    required public init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObject(forKey: "name") as! String
        contactNumber = aDecoder.decodeObject(forKey: "contactNumber") as? String
        super.init()
    }
}
