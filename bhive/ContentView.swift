//
//  ContentView.swift
//  bhive
//
//  Created by Tarek Adam Mustafa on 21/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()
    @State var searchTag = ""
    @State var buttonVisible = false
    @State var beeLogo = false

    var body: some View {
        NavigationView {
            Form {
                HStack {
                    TextField("Search", text: $searchTag, onCommit: passSearchTag)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)

                    if searchTag.count >= 2 {
                        Button(action: {
                            self.searchTag = ""
                        }) {
                            Image(systemName: "clear")
                                .font(.system(size: 32, weight: .light))
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        }
                    }
                }

                List {
                    ForEach(networkManager.result) { tag in
                        TagCardView(tag: tag)
                    }
                }
            }
            .navigationBarTitle(searchTag.isEmpty ? "" : searchTag)
            .navigationBarItems(leading:
                Button(action: { self.beeLogo.toggle() }) {
                    Image("BeezApp")
                }.sheet(isPresented: $beeLogo) {
                    AboutView()
                }
                .buttonStyle(PlainButtonStyle())
            )
        }
    }
    
// Function
    func passSearchTag() {
        networkManager.fetchTag(selectedURL: "https://steemapi.esteem.app/get_discussions_by_trending?query=%7B%22tag%22%3A%22\(searchTag)%22%2C%20%22limit%22%3A%20%22100%22%7D")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


