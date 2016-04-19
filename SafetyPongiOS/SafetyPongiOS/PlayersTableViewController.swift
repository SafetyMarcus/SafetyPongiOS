//
//  PlayersTableViewController.swift
//  SafetyPongiOS
//
//  Created by Marcus Hooper on 12/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation
import UIKit

class PlayersTableViewController: UITableViewController
{
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        let height = UIApplication.sharedApplication().statusBarFrame.height
        self.tableView.contentInset = UIEdgeInsetsMake(height, 0, 0, 0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 40/255.0, green: 159/255.0, blue: 215/255.0, alpha: 1)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.edgesForExtendedLayout = UIRectEdge.None
        self.extendedLayoutIncludesOpaqueBars = false
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PlayerTableViewCell
        cell.position.text = "1."
        cell.name.text = "This is a player"
        cell.rank.text = "1500"
        
        return cell
    }
}


