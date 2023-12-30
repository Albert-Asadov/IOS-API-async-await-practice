//
//  ProductService.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import Foundation

class ProductService{
    
    
    func getProductFromAPI() async throws -> [Product]{
        
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
            let decode = JSONDecoder()
            decode.keyDecodingStrategy = .convertFromSnakeCase
            let dataProduct = try decode.decode(ProductModels.self, from: data)
            return dataProduct.products
        } catch {
            throw URLError(.badServerResponse)
        }
    }
}
