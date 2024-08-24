//
//  SearchResultItemView.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

struct SearchResultItemView: View {
    let id: String
    let imageName: String
    let name: String
    let subName: String
  
    var body: some View {
        GroupBox {
            HStack {
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 100)
                    .clipped()
                VStack {
                    Text(name)
                        .font(.headline)
                    Text(subName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(id)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.frame(maxWidth: .infinity, alignment: .trailing)

        }.padding(0)
    }
}
