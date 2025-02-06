//
//  ProductViewModel.swift
//  amazon_clone
//
//  Created by pavan naik on 01/02/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    
    private var currentPage = 1
    private let limit = 4
    
    // Fetch products with pagination
    func fetchProducts(page: Int = 1, limit: Int = 4) async {
        guard let url = URL(string: "http://localhost:8001/api/v1/products/getProducts?page=\(page)&limit=\(limit)") else {
            return
        }
        
        isLoading = true
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode the response using ProductResponse which contains the 'data' key
            let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
            
            DispatchQueue.main.async {
                if page == 1 {
                    self.products = productResponse.data  // For first page, replace the list
                } else {
                    self.products.append(contentsOf: productResponse.data)  // Append new products on subsequent pages
                }
                self.isLoading = false
            }
        } catch {
            print("Error fetching products: \(error)")
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    // Load more products when user reaches the bottom
    func loadMoreProducts() {
        currentPage += 1
        Task {
            await fetchProducts(page: currentPage, limit: limit)
        }
    }
}



//
//import SwiftUI
//
//class ProductViewModel: ObservableObject {
//    @Published var products: [Product] = []
//    
//    func fetchProducts() async {
//        guard let url = URL(string: "http://localhost:8001/api/v1/products/getProducts") else {
//            print("invalid url")
//            return
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decodeProducts = try JSONDecoder().decode([Product].self, from: data)
//            
//            DispatchQueue.main.async {
//                self.products = decodeProducts
//            }
//        }
//        catch {
//            print("Error fetching products: \(error)")
//        }
//    }
//}
