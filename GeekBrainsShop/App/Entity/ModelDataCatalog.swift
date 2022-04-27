//
//  ModelDataCatalog.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 27.04.2022.
//

import Foundation

// MARK: - ModelDataProduct
struct ModelDataCatalog: Codable {
    let response: [Catalog]
}

// MARK: - Product
struct Catalog: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}
