//
//  HomeViewModel.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import Foundation

class HomeViewModel:ObservableObject{
    
    @Published var allProducts:[Product] = []
    private let service = ProductService()
    
    func getFromService() async throws{
        if let productFrom = try? await service.getProductFromAPI(){
            await MainActor.run {
                allProducts.append(contentsOf: productFrom)
            }
        }
    }
    
}
