//
//  BannerViewModel.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import Foundation
import Combine

class BannerViewModel: ObservableObject {
    @Published var banners: [ProductData] = []
    var bannerRepository = BannersRepository()
        
    func getBannerDatas() {
        self.banners = bannerRepository.getBanners()
    }

}
