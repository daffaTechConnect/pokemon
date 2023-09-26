//
//  HomeUseCaseDefault.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation

struct HomeUseCaseDefault: HomeUseCase {
    
    var repository: HomeRepository
    
    init(repository: HomeRepository = HomeRepositoryDefault()) {
        self.repository = repository
    }
    
    mutating func fetchPokemons() async throws -> [ListPokemon] {
        var listPokemonWithImage: [ListPokemon] = []
        
        let fetchDataPokemon = try await repository.getPokemons()
        
        try await fetchDataPokemon.results.asyncForEach { pokemon in
            let (image, index) = try await self.repository.getPokemonImage(url: pokemon.url)
            let color = try await self.repository.getPokemonColor(index: index)
            let newPokemon = ListPokemon(name: pokemon.name, image: image, color: color)
            listPokemonWithImage.append(newPokemon)
        }
        
        return listPokemonWithImage
    }
}
