//
//  Tag.swift
//  bhive
//
//  Created by Tarek Adam Mustafa on 23/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import Foundation

// Tag model to work with json data
struct Tag: Decodable, Identifiable {
    var id: Int {
        return post_id
    }
    let post_id: Int
    let author: String
    let title: String
    let created: String
    let body: String
}
