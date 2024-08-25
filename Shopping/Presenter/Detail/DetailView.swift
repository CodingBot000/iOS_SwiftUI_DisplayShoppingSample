//
//  DetailView.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

struct DetailView: View {
    let data: ProductData
    @ObservedObject private var viewModel: DetailViewViewModel = DetailViewViewModel()
 
    var body: some View {
      
           VStack {
               Image(data.imageName)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(maxWidth: .infinity)
               
               ScrollView(.vertical, showsIndicators: false) {
               VStack {
                   HStack {
                       Text(data.name)
                           .font(.largeTitle)
                       Image(systemName: data.isHybrid ? "drop.degreesign.slash" : "drop.degreesign.fill")
                           .resizable()
                           .frame(width: 24, height: 24)
                           .foregroundColor(.green)
                   }
                   
                   Spacer().frame(height: 5)
                   
                   Text(data.subName)
                       .font(.headline)
                       .foregroundColor(.gray)
                   
                   Spacer().frame(height: 5)
                   
                   HStack {
                       Spacer()
                       NavigationLink(
                           destination: WebViewScreen(url: URL(string: data.infoUrl)!, title: data.name),
                           label: {
                               Text("More Info")
                                   .font(.footnote)
                                   .foregroundColor(.blue)
                                   .underline()
                           }
                       )
                   }
                   
                   Spacer().frame(height: 10)
                   
                   Text("\(data.description)\n\n\(data.description)\n\n\(data.description)")
                       .fontSize(size: 20)
                       .padding(.bottom, 10)
               }
               .padding(.horizontal, 10) 
           }
       }
       .navigationTitle(data.name)
       .navigationBarItems(trailing:
            Button(action: {
                viewModel.onClickFavoriteItem(id: data.id)
                }) {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .padding(.trailing, 8)
                    .padding(.bottom, 18)
                    .frame(width: 34, height: 34)
            }
        )
       .onAppear {
           viewModel.getIsFavorite(id: data.id)
       }
   }

}


//#Preview {
//    let previewData = ProductData(
//        id: "1",
//        name: "Car A",
//        subName: "Model X",
//        manufacturer: "Tesla",
//        description: "Electric car",
//        isHybrid: false,
//        infoUrl: "http://tesla.com",
//        imageName: "tesla_model_x"
//    )
//    
//    DetailView(data: previewData)
//}
