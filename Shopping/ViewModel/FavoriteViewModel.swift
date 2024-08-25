//
//  FavoriteViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/26/24.
//

import SwiftUI

class FavoriteViewModel: ObservableObject {
    private var favoriteRepository = FavoriteRepository.shared
    @Published var favoriteDatas: [ProductData] = []

    func fetchAllFavorites()
    {
        favoriteDatas = favoriteRepository.getAllFavoriteData()
    }
}

