//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by pazar on 1/25/16.
//  Copyright © 2016 Patrick Azar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var myTableView: UITableView!
    var colleges : [College] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        colleges.append(College(Name: "Beloit College", Location: "Beloit, WI", NumberOfStudents: 1261, Image: UIImage(named: "beloit")!))
        colleges.append(College(Name: "Centre College", Location: "Danville, KY", NumberOfStudents: 1343, Image: UIImage(named: "centre")!))
        colleges.append(College(Name: "Knox College", Location: "Galesburg, IL", NumberOfStudents: 1392, Image: UIImage(named: "knox")!))
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!.text = colleges[indexPath.row].name
        myCell.detailTextLabel!.text = colleges[indexPath.row].location
        //Location needs to be set to subtitle
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailedViewController
        let selectedRow = myTableView.indexPathForSelectedRow!.row
        detailView.university = colleges[selectedRow]
        
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{(nameTextfield) -> Void in
            nameTextfield.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler{(locationTextfield) -> Void in
            locationTextfield.placeholder = "Add College Location"
        }
        myAlert.addTextFieldWithConfigurationHandler{(numberOfStudentsTextfield) -> Void in
            numberOfStudentsTextfield.placeholder = "Add Number of Students"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let numberOfStudentsTF = myAlert.textFields![2] as UITextField
            self.colleges.append(College(Name: collegeTF.text!, Location: locationTF.text!, NumberOfStudents: Int(numberOfStudentsTF.text!)!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    

}

