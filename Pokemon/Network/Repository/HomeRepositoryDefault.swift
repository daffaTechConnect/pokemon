//
//  HomeRepositoryDefault.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import Foundation

struct HomeRepositoryDefault: HomeRepository {
    
    private var page = "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0"
    
    mutating func getPokemons() async throws -> ListPokemonResponse {
        let url = URL(string: self.page)
        let urlRequest = URLRequest(url: url!)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decodedData = try JSONDecoder().decode(ListPokemonResponse.self, from: data)
        if let nextPage = decodedData.next {
            self.page = nextPage
        }
        return decodedData
    }
    
    func getPokemonImage(url: String) async throws -> (Data, Int) {
        
        let pokeIndex = proccessUrl(url: url)
        let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokeIndex).png"
        let request = URLRequest(url: URL(string: imageUrl)!)
        let (data, _) = try await URLSession.shared.data(for: request)
        return (data, pokeIndex)
    }
    
    func getPokemonColor(index: Int) async throws -> String {
        
        let colorUrl = "https://pokeapi.co/api/v2/pokemon-species/\(index)/"
        let request = URLRequest(url: URL(string: colorUrl)!)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedData = try JSONDecoder().decode(ColorPokemonResponse.self, from: data)
        return decodedData.color.name
    }
    
    private func proccessUrl(url: String) -> Int {
        
        var components = url.components(separatedBy: "/")
        components.removeLast()
        if let lastComponent = components.last, let pokemonID = Int(lastComponent) {
            return pokemonID
        } else {
            return 1
        }
    }
}
