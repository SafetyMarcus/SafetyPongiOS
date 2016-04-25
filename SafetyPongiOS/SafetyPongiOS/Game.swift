//
//  Game.swift
//  SafetyPongiOS
//
//  Created by Dom on 24/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation

class Game
{
    static var PLAYER_ONE_ID = "playerOneId"
    static var PLAYER_TWO_ID = "playerTwoId"
    static var PLAYER_ONE_NAME = "playerOneName"
    static var PLAYER_TWO_NAME = "playerTwoName"
    static var PLAYER_ONE_SCORE = "playerOneScore"
    static var PLAYER_TWO_SCORE = "playerTwoScore"
    static var PLAYER_ONE_RATING_BEFORE = "playerOneRatingBefore"
    static var PLAYER_TWO_RATING_BEFORE = "playerTwoRatingBefore"
    static var DATE_IN_MILLISECONDS = "dateInMilliseconds"
    
    var playerOneId : String
    var playerTwoId : String
    var playerOneName : String
    var playerTwoName : String
    var playerOneScore : Int
    var playerTwoScore : Int
    var playerOneRatingBefore : Int
    var playerTwoRatingBefore : Int
    var dateInMilliseconds : Double
    
    init(playerOneId : String, playerTwoId : String, playerOneName : String, playerTwoName : String, playerOneScore : Int, playerTwoScore : Int, playerOneRatingBefore : Int, playerTwoRatingBefore : Int, dateInMilliseconds : Double)
    {
        self.playerOneId = playerOneId
        self.playerTwoId = playerTwoId
        self.playerOneName = playerOneName
        self.playerTwoName = playerTwoName
        self.playerOneScore = playerOneScore
        self.playerTwoScore = playerTwoScore
        self.playerOneRatingBefore = playerOneRatingBefore
        self.playerTwoRatingBefore = playerTwoRatingBefore
        self.dateInMilliseconds = dateInMilliseconds
    }
    
    func getDictionary() -> [String : AnyObject]
    {
        return [Game.PLAYER_ONE_ID : playerOneId, Game.PLAYER_TWO_ID : playerTwoId, Game.PLAYER_ONE_NAME : playerOneName, Game.PLAYER_TWO_NAME : playerTwoName, Game.PLAYER_ONE_SCORE : playerOneScore, Game.PLAYER_TWO_SCORE : playerTwoScore, Game.PLAYER_ONE_RATING_BEFORE : playerOneRatingBefore, Game.PLAYER_TWO_RATING_BEFORE : playerTwoRatingBefore, Game.DATE_IN_MILLISECONDS : dateInMilliseconds]
    }
}