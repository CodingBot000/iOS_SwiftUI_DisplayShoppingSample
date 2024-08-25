//
//  SwiftUIView.swift
//  Shopping
//
//  Created by switchMac on 8/25/24.
//

import SwiftUI

class ChipDataRepository {
    static let shared = ChipDataRepository()
    
    private init() {}
    
    func getChipDatas() -> [ChipData] {
        return DataStores.getChipDatas()
    }
}

