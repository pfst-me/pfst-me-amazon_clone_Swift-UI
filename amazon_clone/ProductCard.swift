//
//  ProductCard.swift
//  amazon_clone
//
//  Created by pavan naik on 24/01/25.
//

//
//  ProductCard.swift
//  amazon_clone
//
//  Created by Pavan Naik on 23/01/25.
//

import SwiftUI

struct ProductCard: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(imageName) // Replace with your product images in Assets
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(10)
            
            Text(title)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Preview
struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(imageName: "example_image", title: "Example Product")
    }
}
