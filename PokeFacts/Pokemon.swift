//
//  Pokemon.swift
//  PokeFacts
//
//  Created by Roydon Jeffrey on 1/12/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    //Private properties
    fileprivate var _name: String!
    fileprivate var _pokemonId: Int!
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _defense: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    fileprivate var _evolution: String!
    fileprivate var _pokemonURL: String!
    
    
    //Getters
    var name: String {
        if _name == nil {
            _name = ""
        }
        
        return _name
    }
    
    var pokemonId: Int {
        if _pokemonId == nil {
            _pokemonId = 0
        }
        
        return _pokemonId
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        
        return _attack
    }
    
    var evolution: String {
        if _evolution == nil {
            _evolution = ""
        }
        
        return _evolution
    }
    
    var pokemonURL: String {
        if _pokemonURL == nil {
            _pokemonURL = ""
        }
        
        return _pokemonURL
    }
    
    //Initializer
    init(name: String, pokemonId: Int) {
        self._name = name
        self._pokemonId = pokemonId
        
        //API URL based on the pokemon's ID number
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokemonId)"
    }
    
    //To make the network call to the api
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        //GET request to the pokemonURL
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            //To store the json object being returned
            if let dict = response.result.value! as? [String: Any] {
                
                //To ge the weight of the pokemon
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                //To ge the height of the pokemon
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                //To ge the attack of the pokemon
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                //To ge the weight of the pokemon
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._weight, self._height, self._attack, self._defense)
                
            }
            //Call the closure to complete
            completed()
        }
    }
}





