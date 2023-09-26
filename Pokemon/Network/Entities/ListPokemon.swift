//
//  ListPokemon.swift
//  Pokemon
//
//  Created by Fajriharish on 22/09/23.
//

import Foundation

struct ListPokemon: Identifiable {
    let id = UUID()
    let name: String
    let image: Data
    let color: String
}
