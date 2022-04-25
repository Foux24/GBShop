//
//  Logout.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 25.04.2022.
//

import UIKit

// MARK: - Login
final class Logout {
    
    /// Сервис по загрузке данных
    let service: NetworkServiceInput
    
    /// Инициализтор
    ///  - Parameter service: Сервис по загрузке данных
    init(service: NetworkServiceInput) {
        self.service = service
    }
}
