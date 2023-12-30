//
//  ProductImageDetailView.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import SwiftUI

struct ProductImageDetailView: View {
    @StateObject var ProductViewModel = ProductImageViewModel()
    let product: Product
    var body: some View {
        TabView{
            ForEach(ProductViewModel.productDetailPhotos, id: \.self){photo in
                    Image(uiImage: photo)
                        .resizable()
                        //.aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
            }
        }
        .task {
            await ProductViewModel.getImageArrayFromService(product: product)
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ProductImageDetailView( product: Product(id: 1, title: "apple", description: "sdsdsd", price: 3, discountPercentage: 23.2, rating: 2.4, stock: 4, thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg", brand: "apple", category: "phone", images: [
        "https://i.dummyjson.com/data/products/2/1.jpg",
      "https://i.dummyjson.com/data/products/2/2.jpg",
      "https://i.dummyjson.com/data/products/2/3.jpg",
      "https://i.dummyjson.com/data/products/2/thumbnail.jpg"

]))
}
