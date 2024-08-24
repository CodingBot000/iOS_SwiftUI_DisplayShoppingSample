//
//  BannerSliderView.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import Foundation


import SwiftUI

struct BannerSliderView: View {
    @ObservedObject private var viewModel: BannerViewModel = BannerViewModel()
    @State private var currentPage = 0
    
    init() {
        viewModel.getBannerDatas()
    }
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<viewModel.banners.count, id: \.self) { index in
                        NavigationLink(
                            destination:
                                WebViewScreen(url: URL(string: viewModel.banners[index].infoUrl)!, title: viewModel.banners[index].name),
                            label: {
                                BannerItem(banner: viewModel.banners[index])
                            })
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 290)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPage = (currentPage + 1) % viewModel.banners.count
                    }
                }
            }

            Text("\(currentPage + 1) / \(viewModel.banners.count)")
                   .foregroundColor(.white)
                   .padding(8)
                   .background(Color.black.opacity(0.5))
                   .cornerRadius(10)
                   .padding(.trailing, 8)
                   .padding(.bottom, 18)
                   .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
    }
 
    @State private var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    private func resetTimer() {
        timer.upstream.connect().cancel()
        timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    }
    
    private func selectBanner(_ banner: ProductData) {
        print(banner)
    }
}

private struct BannerItem: View {
    let banner: ProductData

    var body: some View {
        ZStack() { 
            Image(banner.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 350)
                .clipped()


                Text(banner.name)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.5))
                    .fontSize(size: 20, color: .white)
                    .fontWeight(.bold)
             
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview {
    BannerSliderView()
}
