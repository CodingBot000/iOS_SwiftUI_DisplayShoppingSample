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
        viewModel.getDisplayItemDatas(limit: 8)
    }
    
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)

            
            DisplayHorizontalView(itemDatas: viewModel.displayItemDatas)
            

        }
    }
    
}


private struct DisplayHorizontalView: View {
    let itemDatas: [ProductData]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 0) {
                ForEach(0..<itemDatas.count, id: \.self) { index in
                    let data = itemDatas[index]
                    NavigationLink(destination: DetailView(data:  data))
                    {
                        DisplayHorizontalCell(
                            imageName: data.imageName,
                            name: data.name,
                            subName: data.subName
                        )
                    }
                }
            }.padding(.horizontal, 10)
        }
    }
}

private struct DisplayHorizontalCell: View {
    let imageName: String
    let name: String
    let subName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 100)
                .clipped()

            Text(name)
                .font(.headline)
            Text(subName)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}


