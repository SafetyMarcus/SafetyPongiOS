//
//  FirebaseHelpers.swift
//  SafetyPongiOS
//
//  Created by Dom on 17/04/2016.
//  Copyright © 2016 HoopRay. All rights reserved.
//

import Foundation

class FirebaseHelpers
{
    static func getFirebaseRef() -> Firebase
    {
        return Firebase(url: FirebaseConstants.FIREBASE_PATH)
    }
    
    static func savePlayer(_ leagueKey : String, key : String, player : Player)
    {
        let safetyPong = Firebase(url: FirebaseConstants.FIREBASE_PATH + "/" + FirebaseConstants.PLAYERS).child(byAppendingPath: leagueKey).child(byAppendingPath: key)
        safetyPong?.setValue(player.getDictionary())
    }
    
    static func saveGame(_ leagueKey : String, key : String, game : Game)
    {
        let safetyPong = Firebase(url: FirebaseConstants.FIREBASE_PATH + "/" + FirebaseConstants.GAMES).child(byAppendingPath: leagueKey).child(byAppendingPath: key)
        safetyPong?.setValue(game.getDictionary())
    }
    
    static func createLeague(_ key : String, leagueName : String, password : String)
    {
        let leagueRef = Firebase(url: FirebaseConstants.FIREBASE_PATH + "/" + FirebaseConstants.LEAGUES).child(byAppendingPath: key)
        
//        if leagueRef.authData == nil
//        {
//            return
//        }
        
        let league = League(name: leagueName, password: password)
        leagueRef?.setValue(league.getDictionary())
    
        // Set owner role
//        let firebase = Firebase(url: FirebaseConstants.FIREBASE_PATH)
//        let authId = firebase.authData.uid
//        leagueRef.childByAppendingPath(FirebaseConstants.ROLES).childByAppendingPath(authId).setValue(FirebaseConstants.OWNER)
        
        // Set add league to users leagues
//        firebase.childByAppendingPath(FirebaseConstants.USERS).childByAppendingPath(authId).childByAppendingPath(FirebaseConstants.LEAGUES).childByAppendingPath(key).setValue(leagueName)
    }
    
    static func addUserToLeague(_ leagueKey : String, leagueName : String, role : String)
    {
        let firebase = Firebase(url: FirebaseConstants.FIREBASE_PATH)
        
        if firebase?.authData == nil
        {
            return
        }
        
        let authId = firebase?.authData.uid
        Firebase(url: FirebaseConstants.FIREBASE_PATH).child(byAppendingPath: FirebaseConstants.LEAGUES).child(byAppendingPath: leagueKey).child(byAppendingPath: FirebaseConstants.ROLES).child(byAppendingPath: authId).setValue(role)
    
        firebase?.child(byAppendingPath: FirebaseConstants.USERS).child(byAppendingPath: authId).child(byAppendingPath: FirebaseConstants.LEAGUES).child(byAppendingPath: leagueKey).setValue(leagueName)
    }
    
    static func updateUsersDetails(_ authData : FAuthData!)
    {
        if authData == nil
        {
            return
        }
        
        let firebase = Firebase(url: FirebaseConstants.FIREBASE_PATH).child(byAppendingPath: FirebaseConstants.USERS).child(byAppendingPath: authData.uid)
        firebase?.child(byAppendingPath: FirebaseConstants.NAME).setValue(authData.providerData["displayName"])
        firebase?.child(byAppendingPath: FirebaseConstants.IMAGE).setValue(authData.providerData["profileImageURL"])
    }
    
    static func getPlayerReferences(_ leagueKey : String) -> Firebase
    {
        return Firebase(url: FirebaseConstants.FIREBASE_PATH + "/" + FirebaseConstants.PLAYERS + "/" + leagueKey)
    }
    
    static func getGamesReferences(_ leagueKey : String) -> Firebase
    {
        return Firebase(url: FirebaseConstants.FIREBASE_PATH + "/" + FirebaseConstants.GAMES + "/" + leagueKey)
    }
    
    static func getPlayerLeaguesListReference() -> Firebase
    {
        let ref = Firebase(url: FirebaseConstants.FIREBASE_PATH)
        
        if ref?.authData == nil
        {
            return ref!
        }
        
        return ref!.child(byAppendingPath: FirebaseConstants.USERS).child(byAppendingPath: ref!.authData.uid).child(byAppendingPath: FirebaseConstants.LEAGUES)
    }
    
    static func getAppRef() -> Firebase
    {
        return Firebase(url: FirebaseConstants.FIREBASE_PATH)
    }
    
    static func getAuthDisplayName() -> String
    {
        let ref = getAppRef()
        
        if ref.authData == nil
        {
            return "No Name"
        }
        
        return ref.authData.providerData["displayName"] as! String
    }
}
