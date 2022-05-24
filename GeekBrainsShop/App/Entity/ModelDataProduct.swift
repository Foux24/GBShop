//
//  ModelDataProduct.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 27.04.2022.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let result: ItemProduct
}

// MARK: - Result
struct ItemProduct: Codable {
    let productName, productDescription: String
    let result, productPrice: Int
    let reviews: [ReviewProduct]
}

// MARK: - Review
struct ReviewProduct: Codable {
    let massageReview, nameUserReview: String
    let idUserReview: Int
}
