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
    
    @State private var searchTag = ""
    @State private var navTitle = ""
    @State private var buttonVisible = false
    @State private var beeLogo = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    HStack {
                        TextField("Search Tag", text: $searchTag, onCommit: passSearchTag)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                            .autocapitalization(.none)
                            .alert(isPresented: $networkManager.showAlert) {
                                Alert(title: Text("Ooops"), message: Text("No matching tag found"), dismissButton: .default(Text("Try Again")))
                        }
                    }
                    
                    List {
                        ForEach(networkManager.result) { tag in
                            TagCardView(tag: tag)
                        }
                    }
                }
                .navigationBarTitle(navTitle)
                .navigationBarItems(leading:
                    Image("bNav")
                        .buttonStyle(PlainButtonStyle()),
                                    trailing:
                    Button(action: { self.beeLogo.toggle() }) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 22, weight: .light))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3415772839, blue: 0.4060478497, alpha: 1)))
                    }.sheet(isPresented: $beeLogo) {
                        AboutView()
                    }
                )
            }
        }
    }
    
    // MARK: - Function to feed searchTag into URL
    func passSearchTag() {
        navTitle = searchTag
        networkManager.fetchTag(selectedURL: "https://steemapi.esteem.app/get_discussions_by_trending?query=%7B%22tag%22%3A%22\(searchTag)%22%2C%20%22limit%22%3A%20%22100%22%7D")
        searchTag = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


