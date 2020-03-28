//
//  NetworkManager.swift
//  bhive
//
//  Created by Tarek Adam Mustafa on 23/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {

    @Published var result = [Tag]()
    @Published var showAlert = false

    func fetchTag(selectedURL: String) {

        guard let url = URL(string: selectedURL) else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let decodedData = try decoder.decode([Tag].self, from: safeData)

                        DispatchQueue.main.async {
                            self.result = decodedData
                            
                            if self.result.isEmpty {
                                self.showAlert.toggle()
                            }
                        }
                        return

                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
}
