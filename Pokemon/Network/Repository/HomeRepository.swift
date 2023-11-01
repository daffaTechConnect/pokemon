//
//  HomeRepository.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation

protocol HomeRepository {
    func getPokemons() async throws -> ListPokemonResponse
    func getPokemonImage(url: String) async throws -> (Data, Int)
    func getPokemonColor(index: Int) async throws -> String
}
