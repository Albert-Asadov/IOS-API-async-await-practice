//
//  ProductImageView.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import SwiftUI

struct ProductImageView: View {
    @StateObject var PhotoViewModel = ProductImageViewModel()
    let product:Product
    var body: some View {
        VStack{
            if let image = PhotoViewModel.previewPhoto{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
        }.task {
            await PhotoViewModel.getPreviewFromService(product: product)
        }
    }
}

#Preview {
    ProductImageView( product: Product(id: 1, title: "apple", description: "sdsdsd", price: 3, discountPercentage: 23.2, rating: 2.4, stock: 4, thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg", brand: "apple", category: "phone", images: [
                        "https://i.dummyjson.com/data/products/2/1.jpg",
                      "https://i.dummyjson.com/data/products/2/2.jpg",
                      "https://i.dummyjson.com/data/products/2/3.jpg",
                      "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
    
    ]))
}
