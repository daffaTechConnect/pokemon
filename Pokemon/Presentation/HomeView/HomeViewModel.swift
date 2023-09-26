//
//  HomeViewModel.swift
//  Pokemon
//
//  Created by Fajriharish on 22/09/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    private var homeUseCase: HomeUseCase
    
    @Published var listPokemon: [ListPokemon] = []
    
    init(homeUseCase: HomeUseCase = HomeUseCaseDefault()) {
        self.homeUseCase = homeUseCase
    }
    
    func fetchPokemon() {
        DispatchQueue.main.async {
            Task {
                let newListPokemon = try await self.homeUseCase.fetchPokemons()
                self.listPokemon.append(contentsOf: newListPokemon)
            }
        }
    }
    
    func shouldLoadNextPage(index: UUID) -> Bool {
        index == self.listPokemon.last?.id
    }
    
}
