//
//  DetailViewViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/25/24.
//

import Foundation
import Combine

class DetailViewViewModel: ObservableObject {
    private var favoriteRepository = FavoriteRepository.shared
    @Published var isFavorite: Bool = false

    func getIsFavorite(id: String) {
        isFavorite = favoriteRepository.getFavorite(id: id) != nil
    }
    
    func fetchAllFavorites() -> [FavoriteEntity]
    {
        return favoriteRepository.fetchAllFavorites()
    }
    
    func removeFavoriteData(id: String) {
        favoriteRepository.removeFavorite(id: id)
    }
    
    func onClickFavoriteItem(id: String) {
        if (favoriteRepository.getFavorite(id: id) != nil) {
            favoriteRepository.removeFavorite(id: id)
        } else {
            favoriteRepository.addFavorite(id: id)
        }
        getIsFavorite(id: id)
    }
    
}
