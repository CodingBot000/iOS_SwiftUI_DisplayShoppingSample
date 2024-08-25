//
//  CategoryView.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import SwiftUI

struct CategoryView: View {
    private let urlStr = "https://www.kia.com/us/en/vehicles"

    var body: some View {
        if let url = URL(string: urlStr) {
            WebViewScreen(url: url, title: "Category")
        } else {
            Text("Invalid URL")
                .foregroundColor(.red)
        }
    }
}


#Preview {
    CategoryView()
}
