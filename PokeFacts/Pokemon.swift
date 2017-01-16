//
//  Pokemon.swift
//  PokeFacts
//
//  Created by Roydon Jeffrey on 1/12/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import Foundation

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
    
    //Initializer
    init(name: String, pokemonId: Int) {
        self._name = name
        self._pokemonId = pokemonId
    }
}
