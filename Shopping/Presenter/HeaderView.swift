//
//  HeaderView.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import SwiftUI


enum HOME_HEADER_NAVI: String, CaseIterable {
    case Recommend
    case Brand
    case Publish
    case Ranking
    case Sale
    case Festa
}

struct HeaderView: View {
    @Binding var selectedSubTab: HOME_HEADER_NAVI

    var body: some View {
            VStack {
                HStack {
                    Text("SuperShopping")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Image(systemName: "square.and.arrow.down.on.square")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "bell.badge")
                        .foregroundColor(.white)
                    Image(systemName: "bag")
                        .foregroundColor(.white)
                    
                }
              
                NavigationLink(destination: SearchView()) {
                    SearchActionButtonView()
                }
                 
                
                HStack(spacing: 0) {
                    ForEach(HOME_HEADER_NAVI.allCases.indices, id: \.self) { index in
                        let navItem = HOME_HEADER_NAVI.allCases[index]

                        HeadNaviTextView(text: navItem.rawValue, textColor: selectedSubTab == navItem ? .white : .gray)
                            .padding(.trailing, 8)
                            .onTapGesture {
                                selectedSubTab = navItem

                            }
                        
                        }
                }
            }.padding()

        .background(Color.black)
    }
}

private struct HeadNaviTextView: View {
    let text: String
    let textColor: Color
    
    @State private var selected: Bool = false

    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(Font.system(size: 13, design: .serif))
    }
}

private struct SearchActionButtonView: View {
    var body: some View {
        HStack {
            Text("Standard WorkWay")
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
        .padding(10)
        .frame(height: 40)
        .background(Color.white)
        .cornerRadius(10)
    }
}
//    
//struct HeaderView_Previews: PreviewProvider {
//    let onSearchTapped: () -> Void
//    
//    static var previews: some View {
//     
//        HeaderView()
//    }
//}
