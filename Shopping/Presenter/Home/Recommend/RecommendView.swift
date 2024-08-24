//
//  RecommendView.swift
//  Shopping
//
//  Created by switchMac on 8/25/24.
//

import SwiftUI

struct RecommendView: View {
    var body: some View {

            BannerSliderView()
            Spacer(minLength: 10)
            ChipSectionView()
            Spacer(minLength: 20)
            DisplaySectionView(title: "Recommend")
            Spacer(minLength: 20)
            DisplaySectionView(title: "Street Style")
            Spacer(minLength: 20)
            DisplaySectionView(title: "Popular")
            Spacer(minLength: 20)
            DisplaySectionView(title: "Hello World")

    }
}

#Preview {
    RecommendView()
}
