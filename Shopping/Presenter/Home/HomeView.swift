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
        ScrollView {
            LazyVStack(spacing: 0) {
                
                HeaderView(selectedSubTab: $selectedSubTab)                
                MainContentView(selectedSubTab: $selectedSubTab)

                Text("Hello World .Corp")
                    .frame(maxWidth: .infinity, minHeight: 70 )
                    .foregroundColor(gray10)
                    .background(.gray)
            }
            .background(baseBackground)
        }
    }
}

struct MainContentView: View {
    @Binding var selectedSubTab: HOME_HEADER_NAVI
    
    var body: some View {
 
        switch selectedSubTab {
            case .Recommend:
                RecommendView()
            case .Brand:
                BrandView()
            case .Publish:
                PublishView()
            case .Ranking:
                RankingView()
            case .Sale:
                SaleView()
            
        }


    }
    
}


#Preview {
    HomeView()
}
