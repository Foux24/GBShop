//
//  LogoutBuilder.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 25.04.2022.
//

import UIKit

// MARK: - LogoutBuilder
final class LogoutBuilder {
    
    /// Builder
    static func build() -> Logout {
        let network = NetworkService()
        let logout = Logout(service: network)
        return logout
    }
}
