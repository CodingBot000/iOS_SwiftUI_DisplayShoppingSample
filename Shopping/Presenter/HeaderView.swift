//
//  HeaderView.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import SwiftUI




struct HeaderView: View {
    private let headerNavi = ["Recommend", "Brand", "Pusblished", "Ranking", "Sale", "BeautyFesta"]
    @State var searchText: String
    @State private var selectedTab: Int = 0
    
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
                
                SearchView()
                
                HStack(spacing: 10) {
                    ForEach(0..<headerNavi.count, id: \.self) { i in
                        HeadNaviTextView(text: headerNavi[i], textColor: selectedTab == i ? .white : .gray)
                            .onTapGesture {
                                selectedTab = i
                            }
                        
                    }
                    
                }
            }.padding()

        .background(Color.black) // VStack의 배경색을 검은색으로 설정
        .edgesIgnoringSafeArea(.all)
    }
}

struct HeadNaviTextView: View {
    let text: String
    let textColor: Color
    
    @State private var selected: Bool = false

    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .frame(width: 40) // 텍textColor스트 박스의 너비를 40으로 제한
            .lineLimit(nil) // 텍스트가 여러 줄에 걸쳐 표시되도록 설정
            .multilineTextAlignment(.leading)
    }
}

struct SearchView: View {
    var body: some View {
        HStack {
            Text("Standard WorkWay")
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
        .background(Color.white)

    }
}
    
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(searchText: "aaa")
    }
}
