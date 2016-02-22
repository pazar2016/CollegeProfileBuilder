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
        //Location needs to be set to subtitle
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailedViewController
        let selectedRow = myTableView.indexPathForSelectedRow!.row
        detailView.university = colleges[selectedRow]
        
    }

}

