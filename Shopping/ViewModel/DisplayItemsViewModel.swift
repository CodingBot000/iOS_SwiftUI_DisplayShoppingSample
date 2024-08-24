//
//  DisplayItemsViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//


import Foundation
import Combine

class DisplayItemsViewModel: ObservableObject {
    @Published var displayItemDatas: [ProductData] = []
    private var displayItemRepository = DisplayItemRepository()
    
    func getDisplayItemDatas(limit: Int = 0) {
        self.displayItemDatas = displayItemRepository.getDisplayItemDatas(limit: 0)
    }

}
