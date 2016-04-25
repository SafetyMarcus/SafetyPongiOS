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
    let sandpitKey = "da550478-0119-4e0c-b892-29f60e932293"
    var games = [Game]()
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        let height = UIApplication.sharedApplication().statusBarFrame.height
        self.tableView.contentInset = UIEdgeInsetsMake(height, 0, 0, 0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 40/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let gamesRef = FirebaseHelpers.getGamesReferences(sandpitKey)
        
        gamesRef.observeEventType(.Value, withBlock:
            { snapshot in
                var tempItems = [Game]()
                
                for game in snapshot.children
                {
                    tempItems.append(Game(snapshot: game as! FDataSnapshot))
                }
                
                self.games = tempItems
                self.tableView.reloadData()
        })
    }
    
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
        return games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GameTableViewCell
        let game = games[indexPath.row]
        cell.playerOne.text = game.playerOneName
        cell.playerTwo.text = game.playerTwoName
        cell.scores.text = "\(game.playerOneScore) - \(game.playerTwoScore)"
        
        return cell
    }
}