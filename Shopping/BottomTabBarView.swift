//
//  BottomTabBarView.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI

enum BottomTabItem {
    case HOME
    case POPULAR
    case CATEGORY
    case FAVORITE
    case MY_PAGE
}

struct BottomTabBarView: View {
    @Binding var selectedBottomTab: BottomTabItem
 
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selectedBottomTab = .CATEGORY
            }) {
                Image(systemName: selectedBottomTab == .CATEGORY ? "menucard.fill" : "menucard")
                    .foregroundColor(selectedBottomTab == .CATEGORY ? .black : .gray)
            }
     
            Spacer()

            Button(action: {
                selectedBottomTab = .POPULAR
            }) {
                Image(systemName: selectedBottomTab == .POPULAR ? "star.circle.fill" : "star.circle")
                    .foregroundColor(selectedBottomTab == .POPULAR ? .black : .gray)
            }
            Spacer()
            Button(action: {
                selectedBottomTab = .HOME
            }) {
                Image(systemName: selectedBottomTab == .HOME ? "house.fill" : "house")
                    .foregroundColor(selectedBottomTab == .HOME ? .black : .gray)
            }
            Spacer()
            


            Button(action: {
                selectedBottomTab = .FAVORITE
            }) {
                Image(systemName: selectedBottomTab == .FAVORITE ? "heart.fill" : "heart")
                    .foregroundColor(selectedBottomTab == .FAVORITE ? .black : .gray)
            }
            Spacer()

            Button(action: {
                selectedBottomTab = .MY_PAGE
            }) {
                Image(systemName: selectedBottomTab == .MY_PAGE ? "person.fill" : "person")
                    .foregroundColor(selectedBottomTab == .MY_PAGE ? .black : .gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
}
