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
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
        
    }
    
    //
    func updateUI() {
        
    }

    //To go back to the MainVC
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
