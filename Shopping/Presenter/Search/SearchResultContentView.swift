//
//  SearchResultContentView.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

struct SearchResultContentView: View {
    
    @Binding var selectedItem: ProductData?
    let products: [ProductData]
    
    var body: some View {
        
        LazyVStack {
            ForEach(0..<products.count, id: \.self) { index in
                let data = products[index]
                NavigationLink(
                    destination: DetailView(data: data) ,
                    label: {
                        SearchResultItemView(
                            id: data.id,
                            imageName: data.imageName,
                            name: data.name,
                            subName: data.subName

                        )
                    }
                )
            }
            
            .listRowSeparator(.hidden, edges: .all)
            .listRowInsets(.init(top: 10, leading: 10,
                                 bottom: 10, trailing: 10))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .listStyle(.plain)
        .navigationTitle("Search Result")
    }
}


