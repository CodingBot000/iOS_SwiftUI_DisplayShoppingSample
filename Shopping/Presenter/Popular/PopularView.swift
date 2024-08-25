//
//  PopularView.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import SwiftUI


struct PopularView: View {
    private let urlStr = "https://www.caranddriver.com/news/"
    
    var body: some View {
        if let url = URL(string: urlStr) {
            WebViewScreen(url: url, title: "News")
        } else {
            Text("Invalid URL")
                .foregroundColor(.red)
        }
    }
}


#Preview {
    PopularView()
}
