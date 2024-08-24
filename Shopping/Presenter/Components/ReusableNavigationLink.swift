//
//  ReusableNavigationLink.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

struct ReusableNavigationLink<Destination: View, Content: View>: View {
    let destination: Destination
    let content: () -> Content

    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                content()
            }
        )
    }
}


#Preview {
    ReusableNavigationLink(destination: Text("Detail View")) {
        Text("Click Me")
    }
}
