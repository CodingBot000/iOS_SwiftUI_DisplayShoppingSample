//
//  DisplayItemRepository.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import Foundation

class DisplayItemRepository {
    static let shared = DisplayItemRepository()
    
    private init() {}
    
    func getDisplayItemDatas(limit: Int = 0) -> [ProductData] {
        return DataStores.getDisplayItemDatas(limit: limit)
    }
}
