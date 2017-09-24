//
//  ViewController.swift
//  My pokidex
//
//  Created by Shinto Joseph on 20/09/17.
//  Copyright © 2017 Shinto Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    
    @IBOutlet weak var collection:UICollectionView!
    @IBOutlet weak var pokeSearch: UISearchBar!
    var inSearchMode = false
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        pokeSearch.delegate = self
        parsePokemonCSV()
    }
    
    func parsePokemonCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        
        
        do{
            let csv = try CSV.init(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            for row in rows{
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
        }
        catch let err as NSError{
            print(err.description)
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokecell", for: indexPath) as? PokeCellCollectionViewCell{
            let poke:Pokemon!
            print(inSearchMode)
            if inSearchMode{
                print("hai")
                poke = filteredPokemon[indexPath.row]
                print(poke)
                cell.configureCell(poke)
                return cell
            }else{
                poke = pokemon[indexPath.row]
                print(poke)
                cell.configureCell(poke)
                return cell
                
            }
            
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode{
            return filteredPokemon.count
        }
        else{
        return pokemon.count
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:125,height:150)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
        }
        else{
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemon = pokemon.filter({ $0.name.localizedCaseInsensitiveContains(searchBar.text!)})
            print(filteredPokemon)
            
        }
    }
    
    


}

