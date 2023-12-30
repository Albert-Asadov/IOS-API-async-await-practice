//
//  ProductDetailView.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    var body: some View {
        VStack{
            ProductImageDetailView(product: product)
            VStack{
                HStack{
                    Text(product.title)
                        .font(.headline)
                    Spacer()
                    Text("Brand:\(product.brand)")
                        .font(.headline)
                }
                Text(product.description)
                    .lineLimit(4)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                HStack{
                    Text("Price: \(product.price)")
                    Spacer()
                    Text("Discount: \(product.discountPercentage ?? 0)%")
                }
                
                HStack{
                    Text("Rating: \(product.rating ?? 0)")
                    Spacer()
                    Text("In Sotck: \(product.stock)")
                }
                Spacer()
                
            }.padding()
        }
    }
}

#Preview {
    ProductDetailView(product:  Product(id: 1, title: "apple", description: "sdsdswdwdwdwdwdwdwdwdwdwdwdwdwdwdwdwdwdwdwdwsdsdsdsdjdjdjdjjdjdjdjdjdjdjdjdkdkdkddkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkkddkdkdkdkddwdwdd", price: 3, discountPercentage: 23.2, rating: 2.4, stock: 4, thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg", brand: "apple", category: "phone", images: [
        "https://i.dummyjson.com/data/products/2/1.jpg",
      "https://i.dummyjson.com/data/products/2/2.jpg",
      "https://i.dummyjson.com/data/products/2/3.jpg",
      "https://i.dummyjson.com/data/products/2/thumbnail.jpg"

]))
}
