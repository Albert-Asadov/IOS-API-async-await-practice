//
//  ProductImageService.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import Foundation
import SwiftUI

class ProductImagesService{
    
    
    func getPreviewImage(product:Product) async throws -> UIImage?{
        
        guard let url = URL(string: product.thumbnail) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else{
                throw URLError(.badServerResponse)
            }
            
            let image = UIImage(data: data)
            if let image = image{
                return image
            }else{
                throw URLError(.badURL)
            }
        } catch let error {
            throw error
        }
    }
    
    
 
    func getImageWithTaskGroup(product: Product) async throws -> [UIImage]{
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images: [UIImage] = []
            for imageUrl in product.images{
                group.addTask{
                    try? await self.getImageUrl(url: imageUrl)
                }
            }
            for try await result in group{
                if let image = result{
                    images.append(image)
                }
            }
            return images
        }
    }
    
    private func getImageUrl(url: String) async throws -> UIImage{
        
        guard let url = URL(string: url) else{
            throw URLError(.badURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else{
                throw URLError(.badServerResponse)
            }
            let image = UIImage(data: data)
            if let image = image{
                return image
            }else{
                throw URLError(.badURL)
            }
            
        }catch {
            throw URLError(.badServerResponse)
        }
        
    }
    
}
