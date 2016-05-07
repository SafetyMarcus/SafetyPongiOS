//
//  KeyboardExtension.swift
//  DeliveryDocket
//
//  Created by Marcus Hooper on 7/05/2016.
//  Copyright © 2016 Vatsonic. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func hideKeyboardWhenTappedAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}