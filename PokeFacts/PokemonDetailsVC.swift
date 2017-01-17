//
//  PokemonDetailsVC.swift
//  PokeFacts
//
//  Created by Roydon Jeffrey on 1/15/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeFactsIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvolutionImg: UIImageView!
    @IBOutlet weak var nextEvolutionImg: UIImageView!
    @IBOutlet weak var evolutionLbl: UILabel!
    @IBOutlet weak var nowLbl: UILabel!
    @IBOutlet weak var laterLbl: UILabel!
    @IBOutlet weak var evolStackView: UIStackView!
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Update name and ID
        name.text = pokemon.name.capitalized
        pokeFactsIDLbl.text = "\(pokemon.pokemonId)"
        
        //Update the current pokemon images
        let img = UIImage(named: "\(pokemon.pokemonId)")
        mainImg.image = img
        currentEvolutionImg.image = img
        
        
        //Call the download function before the UI updates
        pokemon.downloadPokemonDetails {
            
            self.updateUI()
        }
        
    }
    
    //Update the UI
    func updateUI() {
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.evolutionID == "" {
            evolutionLbl.text = "NO POKEMON EVOLUTION"
            evolutionLbl.textColor = UIColor.black
            nextEvolutionImg.isHidden = true
            laterLbl.isHidden = true
            evolStackView.isHidden = true
            
        }else {
            evolStackView.isHidden = false
            laterLbl.isHidden = false
            nextEvolutionImg.isHidden = false
            nextEvolutionImg.image = UIImage(named: pokemon.evolutionID)
            evolutionLbl.text = "Next Evolution: \(pokemon.evolutionName) - LVL: \(pokemon.evolutionLvl)"
        }
    }

    //To go back to the MainVC
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
