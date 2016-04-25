//
//  NewGameViewController.swift
//  SafetyPongiOS
//
//  Created by Marcus Hooper on 23/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation
import UIKit

class NewGameViewController: UIViewController
{
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var playerOneText: UITextField!
    @IBOutlet weak var playerTwoText: UITextField!
    
    @IBOutlet weak var v: UILabel!
    @IBOutlet weak var s: UILabel!
    
    @IBOutlet weak var fight: UIButton!
    
    var displacement: CGFloat!
    
    override func viewWillAppear(animated: Bool)
    {
        let blue = UIColor(red: 40/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = blue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        fight.backgroundColor = blue
        
        displacement = self.view.bounds.width/10
        
        playerOneLabel.alpha = 0
        playerOneLabel.frame.origin.x += displacement
        playerTwoLabel.alpha = 0
        playerTwoLabel.frame.origin.x += displacement
        
        playerOneText.alpha = 0
        playerOneText.frame.origin.x += displacement
        playerTwoText.alpha = 0
        playerTwoText.frame.origin.x += displacement
        
        v.alpha = 0
        v.frame.origin.x -= displacement
        s.alpha = 0
        s.frame.origin.x += displacement
        
        fight.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool)
    {
        animatePlayer(self.playerOneLabel, playerText: self.playerOneText, delay: 0)
        animateVS()
        animatePlayer(self.playerTwoLabel, playerText: self.playerTwoText, delay: 1.2)
        animateFight()
    }
    
    func animatePlayer(playerLabel: UILabel, playerText: UITextField, delay: NSTimeInterval)
    {
        UIView.animateWithDuration(0.8, delay: delay, options: .CurveEaseOut, animations: {
            playerLabel.alpha = 1
            playerLabel.frame.origin.x -= self.displacement
            playerText.alpha = 1
            playerText.frame.origin.x -= self.displacement
            }, completion: nil)
    }
    
    func animateVS()
    {
        UIView.animateWithDuration(0.4, delay: 0.8, options: .CurveEaseOut, animations: {
            self.v.alpha = 1
            self.v.frame.origin.x += self.displacement
            self.s.alpha = 1
            self.s.frame.origin.x -= self.displacement
            }, completion: nil)
    }
    
    func animateFight()
    {
        UIView.animateWithDuration(0.6, delay: 1.6, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: .CurveEaseOut, animations: {
            self.fight.alpha = 1
            let bounds = self.fight.bounds
            self.fight.bounds = CGRectMake(bounds.origin.x - 20, bounds.origin.y, bounds.size.width + 60, bounds.size.height)
        }, completion: nil)
    }
}