//
//  HomeUseCase.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation

protocol HomeUseCase {
    
    func fetchPokemons() async throws -> [ListPokemon]
}
