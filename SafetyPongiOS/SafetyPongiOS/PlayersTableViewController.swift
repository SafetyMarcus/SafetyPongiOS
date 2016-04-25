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
    let sandpitKey = "da550478-0119-4e0c-b892-29f60e932293"
    var players = [Player]()
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        let height = UIApplication.sharedApplication().statusBarFrame.height
        self.tableView.contentInset = UIEdgeInsetsMake(height, 0, 0, 0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 40/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let playersRef = FirebaseHelpers.getPlayerReferences(sandpitKey)
        playersRef.observeEventType(.Value, withBlock:
            { snapshot in
                var tempItems = [Player]()
                
                for player in snapshot.children
                {
                    tempItems.append(Player(snapshot: player as! FDataSnapshot))
                }
                
                self.players = tempItems
                self.tableView.reloadData()
        })
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
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PlayerTableViewCell
        let player = players[indexPath.row]
        cell.position.text = "1."
        cell.name.text = player.name
        cell.rank.text = "\(player.rating)"
        
        return cell
    }
}


