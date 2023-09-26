//
//  HomeUseCase.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation

protocol HomeUseCase {
    
    mutating func fetchPokemons() async throws -> [ListPokemon]
}
