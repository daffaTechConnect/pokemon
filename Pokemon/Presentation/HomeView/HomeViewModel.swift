//
//  HomeViewModel.swift
//  Pokemon
//
//  Created by Fajriharish on 22/09/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var homeUseCase: HomeUseCase
    private var cancellables = Set<AnyCancellable>()
    
    @Published var listPokemon: [ListPokemon] = []
    
    init(homeUseCase: HomeUseCase = HomeUseCaseDefault()) {
        self.homeUseCase = homeUseCase
    }
    
    func fetchPokemon() {
        let _ = self.homeUseCase.fetchPokemons()
            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .failure(let error):
                print("error fetch pokemon: \(error.localizedDescription)")
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] newList in
            self?.listPokemon.append(contentsOf: newList)
        }.store(in: &self.cancellables)

    }
    
    func shouldLoadNextPage(index: UUID) -> Bool {
        index == self.listPokemon.last?.id
    }
    
}
