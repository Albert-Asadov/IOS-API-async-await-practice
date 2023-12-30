//
//  ProductImageViewModel.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import Foundation
import SwiftUI

class ProductImageViewModel:ObservableObject{
    
    @Published var previewPhoto: UIImage? = nil
    
    @Published var productDetailPhotos: [UIImage] = []
    
    private let service = ProductImagesService()
    
    
    func getPreviewFromService(product:Product) async{
        if let photo = try? await service.getPreviewImage(product: product ){
            await MainActor.run {
                self.previewPhoto = photo
            }
        }
    }
    
    func getImageArrayFromService(product:Product) async{
        if let images = try? await service.getImageWithTaskGroup(product: product){
            await MainActor.run {
                self.productDetailPhotos.append(contentsOf: images)
            }
        }
    }
    
    
    
    
}
