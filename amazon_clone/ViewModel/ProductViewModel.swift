//
//  ProductViewModel.swift
//  amazon_clone
//
//  Created by pavan naik on 01/02/25.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() async {
        guard let url = URL(string: "http://localhost:8001/api/v1/products/getProducts") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Debugging: Check the raw response data
            if let rawString = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawString)")
            }
            
            // Check the response status code
            if let httpResponse = response as? HTTPURLResponse {
                print("Response Status Code: \(httpResponse.statusCode)")
            }

            // Decode the products
            let decodedProducts = try JSONDecoder().decode([Product].self, from: data)
            
            // Update the products array
            DispatchQueue.main.async {
                self.products = decodedProducts
            }
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
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
