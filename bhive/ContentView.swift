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
                    TextField("Search Tag", text: $searchTag, onCommit: passSearchTag)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                        .autocapitalization(.none)
                    
                    if searchTag.count >= 2 {
                        Button(action: {
                            self.searchTag = ""
                        }) {
                            Image(systemName: "clear")
                                .font(.system(size: 32, weight: .light))
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        }
                        .alert(isPresented: $networkManager.showAlert) {
                            Alert(title: Text("Ooops"), message: Text("No matching tag found"), dismissButton: .default(Text("Try Again")))
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
                Image("bApp")
                    .buttonStyle(PlainButtonStyle()),
                                trailing:
                Button(action: { self.beeLogo.toggle() }) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.7154165564, green: 0.5843211527, blue: 0.36176448, alpha: 1)))
                }.sheet(isPresented: $beeLogo) {
                    AboutView()
                }
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


