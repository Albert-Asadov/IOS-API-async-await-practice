//
//  ProductModel.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import Foundation


struct ProductModels: Codable {
    let products: [Product]
}

struct Product: Identifiable, Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double?
    let stock: Int
    let thumbnail: String
    let brand, category: String
    let images: [String]    
}

extension Product{
    static let example = Product(id: 1, title: "Iphone", description: "jsosjoajdjshdisdjisjds", price: 300, discountPercentage: 17, rating: 4.5, stock: 10, thumbnail: "https://i.dummyjson.com/data/products/1/1.jpg", brand: "apple", category: "Phone", images: [
                                                                                    "https://i.dummyjson.com/data/products/1/1.jpg",
                                                                                    "https://i.dummyjson.com/data/products/1/2.jpg",
                                                                                    "https://i.dummyjson.com/data/products/1/3.jpg",
                                                                                    "https://i.dummyjson.com/data/products/1/4.jpg",
                                                                                    "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
                                                                                                                                    ])
}
