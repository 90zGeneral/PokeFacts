//
//  ViewController.swift
//  PokeFacts
//
//  Created by Roydon Jeffrey on 1/12/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    //Array of Pokemons
    var pokemons = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collection.delegate = self
        collection.dataSource = self
        
        //Call function
        parsePokemonCSV()
        

    }
    
    //Parsing the pokemon csv file
    func parsePokemonCSV() {
        
        //Path to the pokemon.csv file
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        //Error handling
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            //Loop over the array of dictionaries returned from rows
            for row in rows {
                
                //Grab the name and id of each pokemon in the rows array
                let pokeId = Int(row["id"]!)!
                let pokeName = row["identifier"]!
                
                //Pass the name and id into a new instance of the Pokemon class
                let eachPoke = Pokemon(name: pokeName, pokemonId: pokeId)
                
                //Append each new instance of Pokemon class to the pokemons array
                pokemons.append(eachPoke)
            }
            
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            let cellPokemon = pokemons[indexPath.row]
            cell.configureCell(cellPokemon)
            return cell
            
        }else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
}

