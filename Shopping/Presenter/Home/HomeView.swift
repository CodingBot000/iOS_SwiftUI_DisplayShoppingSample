//
//  HomeView.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

enum HomeSubTabItem {
    case HOME
    case CATEGORY
    case MY_PAGE
}

struct HomeView: View {
    @State private var selectedSubTab: HOME_HEADER_NAVI = .Recommend
    
    var body: some View {
        LazyVStack(spacing: 0) {
   
            HeaderView(selectedSubTab: $selectedSubTab)
     
            switch selectedSubTab {
            case .Recommend:
                RecommendView()
//                SearchView()
            case .Brand:
                BrandView()
            case .Publish:
                PublishView()
            case .Ranking:
                RankingView()
            case .Sale:
                SaleView()
            case .Festa:
                FestaView()
            }

        }
        .background(baseBackground)
        .padding(.bottom, 50)
    }
}


#Preview {
    HomeView()
}
