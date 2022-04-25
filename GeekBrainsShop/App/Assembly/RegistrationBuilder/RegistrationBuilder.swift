//
//  RegistrationBuilder.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 25.04.2022.
//

import UIKit

// MARK: - RegistrationBuilder
final class RegistrationBuilder {
    
    /// Builder
    static func build() -> Registration {
        let network = NetworkService()
        let regist = Registration(service: network)
        return regist
    }
}
