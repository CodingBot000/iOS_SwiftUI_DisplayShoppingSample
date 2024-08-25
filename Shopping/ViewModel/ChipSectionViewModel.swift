//
//  ChipSectionViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import Foundation
import Combine

class ChipSectionViewModel: ObservableObject {
    @Published var chipDatas: [[ChipData]] = []
    private var chipDataRepository = ChipDataRepository.shared
    
    func getChipDatas() {
        let tmpChipDatas = chipDataRepository.getChipDatas()
        let halfSize = tmpChipDatas.count / 2

        self.chipDatas = [
            Array(tmpChipDatas[..<halfSize]),
            Array(tmpChipDatas[halfSize...])
        ]
    }
    
}
