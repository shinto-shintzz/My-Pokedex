//
//  File.swift
//  My pokidex
//
//  Created by Shinto Joseph on 20/09/17.
//  Copyright © 2017 Shinto Joseph. All rights reserved.
//

import Foundation

class Pokemon{
    fileprivate var _name:String!
    fileprivate var _pokedexId:Int!
    
    var name:String{
        return _name
    }
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name:String,pokedexId:Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
