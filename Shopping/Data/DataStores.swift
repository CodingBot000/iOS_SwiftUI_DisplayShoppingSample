//
//  DataStores.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import Foundation

final class DataStores {
    private static var productDatas: [ProductData] = []  // 배열을 var로 변경
    
    static func getProductDatas() -> [ProductData] {
        return buidProductDatas()
    }
    
    private static func buidProductDatas() -> [ProductData] {
        if !productDatas.isEmpty {
            return productDatas
        }
        
        let loadedData: [ProductData] = loadJson("productDataJson.json")
        productDatas = loadedData
        return productDatas
    }
    
    static func getBannerDatas() -> BannerData {
        return loadJson("bannerDataJson.json")
    }
    
    static func getChipDatas() -> [ChipData] {
        return loadJson("chipDataJson.json")
    }
    
    static func getDisplayItemDatas(limit :Int = 0) -> [ProductData] {
        let displayItems = buidProductDatas().shuffled()
        return limit > 0 ? Array(displayItems.prefix(limit)) : displayItems
    }
}



