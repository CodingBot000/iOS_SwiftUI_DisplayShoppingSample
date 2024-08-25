//
//  SearchView.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var selectedItem: ProductData? = nil
 
    var body: some View {
        VStack {
            CustomTextField(icon: "plus.magnifyingglass", placeHolder: "Insert For Search", inputText: $viewModel.searchText)
            
            ScrollView(showsIndicators: false) {
                if !viewModel.filteredMeals.isEmpty {
                    SearchResultContentView(
                        selectedItem: $selectedItem,
                        products: viewModel.filteredMeals
                    )
                } else {
                    if viewModel.searchText.isEmpty {
                        Text("Please Insert Search Text")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                     } else {
                         Text("No Data")
                             .fontWeight(.bold)
                             .font(.largeTitle)
                             .foregroundColor(.red.opacity(0.3))
                             .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                    
                }
            }
        }.padding()
    }
}

//#Preview {
//    SearchView()
//}
