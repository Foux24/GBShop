//
//  LoginBuilder.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 27.04.2022.
//

import UIKit

// MARK: - LoginBuilder
final class LoginBuilder {
    
    /// Build
    static func build() -> LoginInteracotr {
        let networkService = NetworkService()
        let interactor = LoginInteracotr(service: networkService)
        return interactor
    }
}
