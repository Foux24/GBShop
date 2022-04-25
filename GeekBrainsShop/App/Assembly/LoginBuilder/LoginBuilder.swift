//
//  LoginBuilder.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 25.04.2022.
//

import UIKit

// MARK: - LoginBuilder
final class LoginBuilder {
    
    /// Builder
    static func build() -> Login {
        let network = NetworkService()
        let login = Login(service: network)
        return login
    }
}
