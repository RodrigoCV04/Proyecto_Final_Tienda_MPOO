//
//  Shop.swift
//  Custom_Table
//
//  Created by Usuario on 11/11/23.
//  Copyright © 2023 Satyendra  Singh. All rights reserved.
//

import Foundation


class Shop {
    var name: String
    var description: String
    var category: String
    var img: String
    var products: [Product]

    init(name: String, description: String, category: String, img: String, products: [Product]) {
        self.name = name
        self.description = description
        self.category = category
        self.img = img
        self.products = products
    }
}
