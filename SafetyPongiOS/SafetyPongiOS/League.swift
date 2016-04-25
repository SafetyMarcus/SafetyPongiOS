//
//  League.swift
//  SafetyPongiOS
//
//  Created by Dom on 24/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation

class League
{
    static var NAME = "name"
    static var PASSWORD = "password"
    
    var name : String
    var password : String
    
    init(name : String, password : String)
    {
        self.name = name
        self.password = name
    }
    
    func getDictionary() -> [String : String]
    {
        return [League.NAME : name, League.PASSWORD : password]
    }
}