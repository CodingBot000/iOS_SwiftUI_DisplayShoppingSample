//
//  BannersRepository.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import Foundation

class BannersRepository {
    
    func getBanners() -> [ProductData]
    {
        let bannerDatas = DataStores.getBannerDatas().ids
        let productDatas = DataStores.getProductDatas()

        let filteredProducts = productDatas.filter { bannerDatas.contains($0.id) }

        return filteredProducts.shuffled()
    }

}
