//
//  testWebView.swift
//  b.
//
//  Created by Tarek Adam Mustafa on 30/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct TagWebView: UIViewRepresentable {
    
    var tag: Tag
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: "https://hive.blog\(tag.url)") else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<TagWebView>) {
        
    }
}
