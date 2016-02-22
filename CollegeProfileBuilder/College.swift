//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by pazar on 1/28/16.
//  Copyright © 2016 Patrick Azar. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    
    init(Name: String, Location: String, NumberOfStudents: Int, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
    }
    
    init(Name: String, Location: String)
    {
        super.init()
        name = Name
        location = Location
    }
}
