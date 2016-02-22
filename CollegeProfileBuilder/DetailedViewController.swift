//
//  DetailedViewController.swift
//  CollegeProfileBuilder
//
//  Created by pazar on 1/28/16.
//  Copyright © 2016 Patrick Azar. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var numberOfStudentsTF: UITextField!
    //TableView variable?
    
    var university : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTF.text = university.name
        locationTF.text = university.location
        numberOfStudentsTF.text = String(university.numberOfStudents)
        myImageView.image = university.image
        


    }

}
