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
    
    override func viewWillAppear(_ animated: Bool)
    {
        let blue = UIColor(red: 40/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = blue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        fight.backgroundColor = blue
        
        displacement = self.view.bounds.width/90
        
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
        fight.addTarget(nil, action: #selector(fightClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        animatePlayer(self.playerOneLabel, playerText: self.playerOneText, delay: 0)
        animateVS()
        animatePlayer(self.playerTwoLabel, playerText: self.playerTwoText, delay: 1)
        animateFight()
    }
    
    func animatePlayer(_ playerLabel: UILabel, playerText: UITextField, delay: TimeInterval)
    {
        UIView.animate(withDuration: 0.6, delay: delay, options: .curveEaseOut, animations: {
            playerLabel.alpha = 1
            playerLabel.frame.origin.x -= self.displacement
            playerText.alpha = 1
            playerText.frame.origin.x -= self.displacement
            }, completion: nil)
    }
    
    func animateVS()
    {
        UIView.animate(withDuration: 0.4, delay: 0.6, options: .curveEaseOut, animations: {
            self.v.alpha = 1
            self.v.frame.origin.x += self.displacement
            self.s.alpha = 1
            self.s.frame.origin.x -= self.displacement
            }, completion: nil)
    }
    
    func animateFight()
    {
        UIView.animate(withDuration: 0, delay: 1.6, options: .curveLinear, animations: {
            self.fight.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.6, delay: 1.6, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            let bounds = self.fight.bounds
            self.fight.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
        }, completion: nil)
    }
    
    func fightClicked()
    {
        //Testing
    }
}
