//
//  SearchViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var products = [ProductData]()
    @Published var searchText: String = ""
    
    init() {
        products = DataStores.getProductDatas()
    }
    
    var filteredMeals: [ProductData] {
        guard !searchText.isEmpty else { return [] }
        return products.filter { item in
            item.name.lowercased().contains(searchText.lowercased())
            || item.manufacturer.lowercased().contains(searchText.lowercased())
            || item.subName.lowercased().contains(searchText.lowercased())
        }
    }
}
