//
//  PokeCellCollectionViewCell.swift
//  My pokidex
//
//  Created by Shinto Joseph on 21/09/17.
//  Copyright © 2017 Shinto Joseph. All rights reserved.
//

import UIKit

class PokeCellCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var thumbImg:UIImageView!
    @IBOutlet weak var nameLbl:UILabel!
    
    var pokemon:Pokemon!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 7.0
        
    }
    func configureCell(_ pokemon:Pokemon){
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named:"\(self.pokemon.pokedexId)")
    }
    
}
