//
//  ListPokemon.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation

struct ListPokemonResponse: Codable {
    let count: Int?
    let next, previous: String?
    let results: [PokemonData]
}

struct PokemonData: Codable {
    let name: String
    let url: String
}
