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
    
    //Initializer
    init(name: String, pokemonId: Int) {
        self._name = name
        self._pokemonId = pokemonId
        
        //API URL based on the pokemon's ID number
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokemonId)"
    }
    
    //To make the network call to the api
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            print(response.result.value!)
        }
    }
}
