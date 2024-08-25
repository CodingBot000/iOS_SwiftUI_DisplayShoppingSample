//
//  FavoriteView.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import SwiftUI


struct FavoriteView: View {
    @ObservedObject private var viewModel: FavoriteViewModel = FavoriteViewModel()
    
    var body: some View {
        VStack {
            
            Text("FavoriteView")
                .font(.largeTitle)
                .padding()
            if viewModel.favoriteDatas.isEmpty {
                Text("No Data\nAdd your favorite!")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.indigo.opacity(0.3))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else {
                ScrollView {
                    LazyVStack(spacing: 5) {
                        ForEach(0..<viewModel.favoriteDatas.count, id: \.self) { index in
                            let data = viewModel.favoriteDatas[index]
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
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
         
        }
            
        .onAppear {
            viewModel.fetchAllFavorites()
        }
    }
}


#Preview {
    FavoriteView()
}
