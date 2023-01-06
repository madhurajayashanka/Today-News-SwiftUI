//
//  WebView.swift
//  HackerNews
//
//  Created by Madhura on 2023-01-06.
//

import Foundation
import WebKit
import SwiftUI


struct WebView: UIViewRepresentable {
 
    var urlString: String?
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}
