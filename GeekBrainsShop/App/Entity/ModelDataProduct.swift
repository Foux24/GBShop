//
//  ModelDataProduct.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 27.04.2022.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String

    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
