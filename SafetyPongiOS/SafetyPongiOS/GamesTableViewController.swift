//
//  GamesTableViewController.swift
//  SafetyPongiOS
//
//  Created by Marcus Hooper on 12/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation
import UIKit

class GamesTableViewController: UITableViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GameTableViewCell
        cell.playerOne.text = "Player One"
        cell.playerOneScore.text = "21"
        cell.playerTwo.text = "Player Two"
        cell.playerTwoScore.text = "15"
        
        return cell
    }
}