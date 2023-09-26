//
//  ContentView.swift
//  Pokemon
//
//  Created by Fajriharish on 20/09/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: CGFloat.infinity)),
        GridItem(.flexible(minimum: 0, maximum: CGFloat.infinity))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.listPokemon) { pokemon in
                    VStack {
                        if let image = UIImage(data: pokemon.image) {
                            Image(uiImage: image)
                        }
                        Text(pokemon.name)
                    }
                    .frame(maxWidth: .infinity, minHeight: UIScreen.screenWidth / 2 - 30)
                    .background(Color[pokemon.color])
                    .cornerRadius(10)
                    .onAppear {
                        if viewModel.shouldLoadNextPage(index: pokemon.id) {
                            viewModel.fetchPokemon()

                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchPokemon()
            }
        }
        .padding(10)
    }
}

#Preview {
    HomeView()
}
