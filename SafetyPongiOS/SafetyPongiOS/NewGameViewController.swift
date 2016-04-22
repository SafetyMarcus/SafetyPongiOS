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
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 40/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
}