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
    
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundView()
                
                VStack(spacing: 20) {
                    // Search Bar
                    HStack {
                        TextField("Search Amazon", text: $searchText)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
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
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            // Categories Section
                            CategoriesView()
                            
                            // Banner Section
                            Image("amazon_banner") // Replace with your banner image in Assets
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
                                        ProductCard(imageName: "product\(index)", title: "Deal \(index)")
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            // Product Grid Section
                            Text("Recommended for You")
                                .font(.headline)
                                .padding(.leading, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                ForEach(1...10, id: \.self) { index in
                                    ProductCard(imageName: "product\(index)", title: "Product \(index)")
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .navigationTitle("Amazon")
                .navigationBarHidden(true)
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
            gradient: Gradient(colors: [Color.orange.opacity(0.6), Color.orange.opacity(0.3)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}
