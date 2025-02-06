//
//  HomeView.swift
//  amazon_clone
//
//  Created by pavan naik on 23/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var productViewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundView()
                
                VStack(spacing: 20) {
                    // Search Bar
                    HStack {
                        TextField("Search Amazon", text: $searchText)
                            .padding(10)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(8)
                        
                        Button(action: {
                            print("Searching for: \(searchText)")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.orange)
                                .cornerRadius(8)
                        }
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            // Categories Section
                            CategoriesView()
                            
                            // Banner Section
                            Image("amazon_banner")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding(.horizontal)
                            
                            // Deals Carousel
                            Text("Today's Deals")
                                .font(.headline)
                                .padding(.leading, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(1...5, id: \.self) { index in
                                        ProductCard(imageUrl: "product\(index)", title: "Deal \(index)")
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            // Product Grid Section
                            Text("Recommended for You")
                                .font(.headline)
                                .padding(.leading, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if productViewModel.products.isEmpty {
                                ProgressView("Loading products...")
                            }
                            else {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                    ForEach(productViewModel.products, id: \.id) { product in
                                        ProductCard(imageUrl: product.imageUrl, title: product.name)
                                    }
                                }
                                .padding(.horizontal)
                                if productViewModel.isLoading {
                                    ProgressView("Loading more products...")
                                        .padding()
                                }
                                
                                VStack {
                                    GeometryReader { geometry in
                                        Color.clear.onAppear {
                                            if geometry.frame(in: .global).maxY < UIScreen.main.bounds.height {
                                                productViewModel.loadMoreProducts()
                                            }
                                        }
                                    }
                                    .frame(height: 1)  // Invisible view to trigger load more on scroll
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Amazon")
                .navigationBarHidden(true)
                .task {
                    await productViewModel.fetchProducts(page: 1, limit: 6)
                }
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.homeBgDark, Color.homeBgLight]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}
