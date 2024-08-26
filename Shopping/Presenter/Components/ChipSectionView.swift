//
//  ChipSectionView.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import SwiftUI

struct ChipSectionView: View {

    @ObservedObject private var viewModel: ChipSectionViewModel = ChipSectionViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 3) {
                ForEach(0..<viewModel.chipDatas.count, id: \.self) { rowIndex in
                    
                    HStack {
                        ForEach(0..<self.viewModel.chipDatas[rowIndex].count, id: \.self) { colIndex in
                            let data = viewModel.chipDatas[rowIndex][colIndex]
                           
                            ChipItemView(
                                imageName: data.imageName,
                                text: data.name
                            )
                            .background(baseBackground)
                        }
                        Spacer()
                    }
                    .frame(height: 30)
                    .padding(.horizontal, 10)
                    
                }
            }
        
        }
        .onAppear {
            viewModel.getChipDatas()
        }
    }
    
    func handleItemTapped(text: String) {
        print("Tapped on item with text: \(text)")
    }
}


struct ChipItemView: View {
    let imageName: String
    let text: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
            Text(text)
                .font(.caption)
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        .background(.white)
        .cornerRadius(3)
        .overlay(
            RoundedRectangle(cornerRadius: 3)
                .stroke(chipBorder, lineWidth: 1)

        )
        .frame(height: 20)
    }
}

#Preview {
    ChipSectionView()
//    ChipItemView(imageName: "eraser.fill",
//                 text: "Toyota Prius")
}
