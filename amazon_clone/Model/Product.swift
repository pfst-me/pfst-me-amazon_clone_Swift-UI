//
//  Product.swift
//  amazon_clone
//
//  Created by pavan naik on 01/02/25.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let imageUrl: String
//    let details: String
//    let price: Double
//    let discount: Double
//    let rating: Double
//    let availableCount: Int
//    let creditcardOffer: String
//    let deliveryInfo: String
//    let service: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageUrl
//        case details
//        case price
//        case discount
//        case rating
//        case availableCount
//        case creditcardOffer
//        case deliveryInfo
//        case service
    }
}

struct ProductResponse: Codable {
    let data: [Product]
}
