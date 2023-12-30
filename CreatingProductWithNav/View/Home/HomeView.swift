//
//  ContentView.swift
//  CreatingProductWithNav
//
//  Created by Альберт Асадов on 30.12.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    var body: some View {
        NavigationStack{
                ScrollView{
                    LazyVStack(alignment:.center){
                        ForEach(vm.allProducts){value in
                            NavigationLink {
                                ProductDetailView(product: value)
                            } label: {
                                VStack(alignment:.center){
                                    ProductImageView(product: value)
                                    Text(value.title)
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                        .padding(.top, 5)
                                    Text(value.brand)
                                        .foregroundStyle(.gray)
                                        .padding(.top,5)
                                    Divider()
                                }
                                .padding()
                            }
                        }
                 
                    }
            }.task{
               try? await vm.getFromService()
            }
        }
    }
}



#Preview {
    HomeView()
}
