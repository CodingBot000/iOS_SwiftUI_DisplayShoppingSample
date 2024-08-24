//
//  WebViewScreen.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//


import SwiftUI
import WebKit


struct WKWebViewBuilder: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {

        let webView = WKWebView()

        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: UIViewRepresentableContext<WKWebViewBuilder>) {
        webView.load(URLRequest(url: url))
    }
}

struct WebViewScreen: View {
    let url: URL
    let title: String
    
    @State var showWK = false

    var body: some View {
        WKWebViewBuilder(url: url)

    }
}


