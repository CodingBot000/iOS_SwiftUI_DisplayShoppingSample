//
//  DisplaySectionView.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import SwiftUI

struct DisplaySectionView: View {

    @ObservedObject private var viewModel: DisplayItemsViewModel = DisplayItemsViewModel()
    var title: String
    
    init(title: String) {
        self.title = title
        viewModel.getDisplayItemDatas()
    }
    
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)

            
            DisplayView(itemDatas: viewModel.displayItemDatas)
            

        }
    }
    
}


struct DisplayView: View {
    let itemDatas: [ProductData]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 0) {
                ForEach(0..<itemDatas.count, id: \.self) { index in
                    let data = itemDatas[index]
                    NavigationLink(destination: DetailView(data:  data))
                    {
                        DisplayItemView(
                            imageName: data.imageName,
                            name: data.name,
                            subName: data.subName,
                            selectedIdx: index
                        )
                    }
                }
            }.padding(.horizontal, 10)
        }
    }
}
