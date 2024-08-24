//
//  DisplayItemRepository.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import Foundation

class DisplayItemRepository {
    func getDisplayItemDatas(limit: Int = 0) -> [ProductData] {
        return DataStores.getDisplayItemDatas(limit: limit)
    }
}
