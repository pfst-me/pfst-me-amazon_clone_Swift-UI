//
//  CategoriesView.swift
//  amazon_clone
//
//  Created by pavan naik on 24/01/25.
//

import SwiftUI

struct CategoriesView: View {
    let categories = [
        (name: "Mobiles", imageName: "mobiles_icon"),
        (name: "Electronics", imageName: "electronics_icon"),
        (name: "Fashion", imageName: "fashion_icon"),
        (name: "Books", imageName: "books_icon"),
        (name: "Home", imageName: "home_icon"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.name) { category in
                    VStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.gray.opacity(0.2))
                            .overlay(
                                Image(category.imageName) // Replace with your image names
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40) // Adjust size as needed
                            )
                        
                        Text(category.name)
                            .font(.caption)
                            .frame(width: 80)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CategoriesView()
}
