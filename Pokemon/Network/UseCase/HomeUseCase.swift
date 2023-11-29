//
//  HomeUseCase.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation
import Combine

protocol HomeUseCase {
    
    func fetchPokemons() -> Future<[ListPokemon], Error>
}
