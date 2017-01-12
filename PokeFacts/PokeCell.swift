//
//  PokeCell.swift
//  PokeFacts
//
//  Created by Roydon Jeffrey on 1/12/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeImg: UIImageView!
    @IBOutlet weak var pokeLbl: UILabel!
    
    //To configure each cell
    func configureCell(pokemon: Pokemon) {
        
        //Update the views in each cell
        pokeLbl.text = pokemon.name.capitalized
        pokeImg.image = UIImage(named: "\(pokemon.pokemonId)")
    }
    
}
