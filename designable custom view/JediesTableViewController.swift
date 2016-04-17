//
//  LightsabersTableViewController.swift
//  designable custom view
//
//  Created by Andrey Moskvin on 4/17/16.
//  Copyright © 2016 Berk0ld. All rights reserved.
//

import UIKit

class JediesTableViewController: UITableViewController {
    
    struct Lightsaber {
        let owner: String
        let color: UIColor
    }
    
    let lightsabers: [Lightsaber] = [
        Lightsaber(owner: "Obi Wan Kenobi",
            color: UIColor.blueColor()),
        Lightsaber(owner: "Yoda",
            color: UIColor.greenColor()),
        Lightsaber(owner: "Meys Windu",
            color: UIColor.magentaColor())]
    
    override func loadView() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let array = bundle.loadNibNamed(
            "JediesTableViewController",
            owner: self,
            options: nil)
        guard let jediesView = array.first as? UIView else {
            fatalError("Unable to load jedies view!") }
        view = jediesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(
            UITableViewCell.self,
            forCellReuseIdentifier: "reuseIdentifier")
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lightsabers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        cell.textLabel?.text = lightsabers[indexPath.row].owner
        cell.textLabel?.textColor = lightsabers[indexPath.row].color

        return cell
    }
}
