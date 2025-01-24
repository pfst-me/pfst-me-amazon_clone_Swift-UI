//
//  CategoriesView.swift
//  amazon_clone
//
//  Created by pavan naik on 24/01/25.
//

import SwiftUI

struct CategoriesView: View {
    let categories = ["Mobiles", "Electronics", "Fashion", "Books", "Home", "Toys"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    VStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.gray.opacity(0.2))
                            .overlay(
                                Text(category.prefix(1))
                                    .font(.title)
                                    .foregroundColor(.gray)
                            )
                        
                        Text(category)
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
