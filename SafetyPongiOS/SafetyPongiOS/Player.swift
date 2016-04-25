//
//  Player.swift
//  SafetyPongiOS
//
//  Created by Dom on 24/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation

class Player
{
    static var NAME = "name"
    static var RATING = "rating"
    
    var name : String
    var rating : Int
    
    init(name : String, rating : Int)
    {
        self.name = name
        self.rating = rating
    }
    
    func getDictionary() -> [String : AnyObject]
    {
        return [Player.NAME : name, Player.RATING : rating]
    }
}