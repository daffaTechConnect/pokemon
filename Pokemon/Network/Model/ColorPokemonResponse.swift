//
//  ColorPokemonResponse.swift
//  Pokemon
//
//  Created by Fajriharish on 26/09/23.
//

import Foundation

struct ColorPokemonResponse: Codable {
    let color: PokemonColor
}

struct PokemonColor: Codable {
    let name: String
    let url: String
}
