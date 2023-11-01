//
//  HomeUseCaseSpec.swift
//  PokemonTests
//
//  Created by Fajriharish on 31/10/23.
//

import Foundation
import Quick
import Nimble

@testable import Pokemon

final class HomeUseCaseSpec: QuickSpec {

    override class func spec() {
        
        describe("Fetch Pokemon") {

            it("should return with ListPokemon") {
                Task {
                    let expectedCount = 1
                    let expectedValue = ListPokemon(name: "PokemonExample", image: Data(count: 1), color: "color")
                    
                    let mockHomeRepository = MockHomeRepository(happyCase: true, happyImage: true, happyColor: true)
                    let homeUseCase = HomeUseCaseDefault(repository: mockHomeRepository)
                    
                    await expect { try await homeUseCase.fetchPokemons().count }.to(equal(expectedCount))
                    await expect { try await homeUseCase.fetchPokemons()[0].name }.to(equal(expectedValue.name))
                    await expect { try await homeUseCase.fetchPokemons()[0].image }.to(equal(expectedValue.image))
                    await expect { try await homeUseCase.fetchPokemons()[0].color }.to(equal(expectedValue.color))
                }
            }
            
            it("should throw Failed Get Pokemon") {
                Task {
                    let expectedCount = 0
                    let expectedValue = ListPokemon(name: "", image: Data(count: 1), color: "color")
                    
                    let mockHomeRepository = MockHomeRepository(happyCase: false, happyImage: true, happyColor: true)
                    let homeUseCase = HomeUseCaseDefault(repository: mockHomeRepository)
                        
                    await expect { try await homeUseCase.fetchPokemons().count }.to(equal(expectedCount))
                }
            }
                        
            it("should throw Failed Get Pokemon Image") {
                Task {
                    let expectedCount = 1
                    let expectedValue = ListPokemon(name: "PokemonExample", image: Data(count: 0), color: "color")
                    
                    let mockHomeRepository = MockHomeRepository(happyCase: true, happyImage: false, happyColor: true)
                    let homeUseCase = HomeUseCaseDefault(repository: mockHomeRepository)
                        
                    await expect { try await homeUseCase.fetchPokemons().count }.to(equal(expectedCount))
                    await expect { try await homeUseCase.fetchPokemons()[0].name }.to(equal(expectedValue.name))
                    await expect { try await homeUseCase.fetchPokemons()[0].image }.to(equal(expectedValue.image))
                    await expect { try await homeUseCase.fetchPokemons()[0].color }.to(equal(expectedValue.color))
                }
            }
            
            it("should throw Failed Get Pokemon Color") {
                Task {
                    let expectedCount = 1
                    let expectedValue = ListPokemon(name: "PokemonExample", image: Data(count: 1), color: "")
                    
                    let mockHomeRepository = MockHomeRepository(happyCase: true, happyImage: true, happyColor: false)
                    let homeUseCase = HomeUseCaseDefault(repository: mockHomeRepository)
                        
                    await expect { try await homeUseCase.fetchPokemons().count }.to(equal(expectedCount))
                    await expect { try await homeUseCase.fetchPokemons()[0].name }.to(equal(expectedValue.name))
                    await expect { try await homeUseCase.fetchPokemons()[0].image }.to(equal(expectedValue.image))
                    await expect { try await homeUseCase.fetchPokemons()[0].color }.to(equal(expectedValue.color))
                }
            }
        }
    }
}

class MockHomeRepository: HomeRepository {
    
    var happyCase: Bool
    var happyImage: Bool
    var happyColor: Bool
    
    init(happyCase: Bool, happyImage: Bool, happyColor: Bool) {
        self.happyCase = happyCase
        self.happyImage = happyImage
        self.happyColor = happyColor
    }
    
    func getPokemons() async throws -> Pokemon.ListPokemonResponse {
        if happyCase {
            return ListPokemonResponse(count: 1, next: "next.com", previous: "prev.com", results: [PokemonData(name: "PokemonExample", url: "PokemonExample.com")])
        }
        return ListPokemonResponse(count: 0, next: "", previous: "", results: [])
    }
    
    func getPokemonImage(url: String) async throws -> (Data, Int) {
        if happyImage {
            return (Data(count: 1),1)
        }
        return (Data(count: 0),0)
    }
    
    func getPokemonColor(index: Int) async throws -> String {
        if happyColor {
            return "color"
        }
        return ""
    }
    
}

enum PokemonError: Error {
    case FailedGetPokemon, FailedGetPokemonImage, FailedGetPokemonColor
}
