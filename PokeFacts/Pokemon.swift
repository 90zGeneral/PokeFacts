//
//  Pokemon.swift
//  PokeFacts
//
//  Created by Roydon Jeffrey on 1/12/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokemonId: Int!
    
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
    
    init(name: String, pokemonId: Int) {
        self._name = name
        self._pokemonId = pokemonId
    }
}
