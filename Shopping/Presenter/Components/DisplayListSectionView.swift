//
//  DisplayListSectionView.swift
//  Shopping
//
//  Created by switchMac on 8/25/24.
//

import SwiftUI

struct DisplayListSectionView: View {

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
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)

            
            DisplayListView(itemDatas: viewModel.displayItemDatas)
        }
    }
}


struct DisplayListView: View {
    let itemDatas: [ProductData]

    var body: some View {
        LazyVStack(spacing: 5) {
            ForEach(0..<itemDatas.count, id: \.self) { index in
                let data = itemDatas[index]
                NavigationLink(destination: DetailView(data:  data))
                {
                    DisplayListCell(
                        imageName: data.imageName,
                        name: data.name,
                        subName: data.subName,
                        manufacturer: data.manufacturer
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(10)
                }
            }
        }
    }
}


private struct DisplayListCell: View {
    let imageName: String
    let name: String
    let subName: String
    let manufacturer: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200)
                .cornerRadius(5)
            VStack(alignment: .trailing) {
                Text(name)
                    .font(.headline)
                Text(subName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(manufacturer)
                    .fontSize(size: 10, color: .indigo)
            }.frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}


#Preview {
    DisplayListSectionView(title: "Preview")
}
