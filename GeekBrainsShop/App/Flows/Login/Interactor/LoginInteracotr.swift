//
//  LoginInteracotr.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 27.04.2022.
//

import UIKit

/// Входящий протокол интерактор
protocol LoginInteractorInput {
    
    /// Вход
    ///  - Parameter complition: Блок обрабатывающий резултат
    func login(completion: @escaping (Result<LoginResult, Error>) -> Void)
    
    /// Регистрация
    ///  - Parameter complition: Блок обрабатывающий резултат
    func registration(completion: @escaping (Result<RegistrationResult, Error>) -> Void)
    
    /// Выход
    ///  - Parameter complition: Блок обрабатывающий резултат
    func logout(completion: @escaping (Result<LogoutResult, Error>) -> Void)
   
    /// Изменение данных пользователя
    ///  - Parameter complition: Блок обрабатывающий резултат
    func changeUserData(completion: @escaping (Result<ChangeUserDataResult, Error>) -> Void)
    
    /// Получение списка продуктов
    ///  - Parameter complition: Блок обрабатывающий резултат
    func getArrayProduct(completion: @escaping (Result<[Catalog], Error>) -> Void)
    
    /// Получение данных товара
    ///  - Parameter complition: Блок обрабатывающий резултат
    func getDataProduct(completion: @escaping (Result<Product, Error>) -> Void)
    
    /// Добавление коментария
    ///  - Parameter complition: Блок обрабатывающий резултат
    func removeReview(completion: @escaping (Result<RemoveReviewResult, Error>) -> Void)
    
    /// Добавление коментария
    ///  - Parameter complition: Блок обрабатывающий резултат
    func addReview(completion: @escaping (Result<AddReviewResult, Error>) -> Void)
    
    /// Добавление товара в корзину
    ///  - Parameter complition: Блок обрабатывающий резултат
    func addToBasket(completion: @escaping (Result<AddToBasketResult, Error>) -> Void)
    
    /// Удаление товара из корзины
    ///  - Parameter complition: Блок обрабатывающий резултат
    func deleteFromBasket(completion: @escaping (Result<DeletFromBasket, Error>) -> Void)
}

// MARK: - LoginInteracotr
final class LoginInteracotr {
    
    /// Network service
    private let service: NetworkServiceInput?
    
    /// Инициализтор
    init(service: NetworkServiceInput) {
        self.service = service
    }
}

// MARK: - Extension LoginInteracotr on the LoginInteractorInput
extension LoginInteracotr: LoginInteractorInput {

    /// Вход
    func login(completion: @escaping (Result<LoginResult, Error>) -> Void) {
        service?.authorisation { result in
            switch result {
            case .success(let resultLogin):
                completion(.success(resultLogin))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Регистрация
    func registration(completion: @escaping (Result<RegistrationResult, Error>) -> Void) {
        service?.registration { result in
            switch result {
            case .success(let resultRegistration):
                completion(.success(resultRegistration))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Выход
    func logout(completion: @escaping (Result<LogoutResult, Error>) -> Void) {
        service?.logout { result in
            switch result {
            case .success(let resultLogout):
                completion(.success(resultLogout))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Изменение данных пользователя
    func changeUserData(completion: @escaping (Result<ChangeUserDataResult, Error>) -> Void) {
        service?.changeUserData { result in
            switch result {
            case .success(let resultChangeData):
                completion(.success(resultChangeData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Получение списка продуктов
    func getArrayProduct(completion: @escaping (Result<[Catalog], Error>) -> Void) {
        service?.getArrayProducts { result in
            switch result {
            case .success(let array):
                completion(.success(array))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Получение данных товара
    func getDataProduct(completion: @escaping (Result<Product, Error>) -> Void) {
        service?.getDataProduct { result in
            switch result {
            case .success(let product):
                completion(.success(product))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Удаление коментария
    func removeReview(completion: @escaping (Result<RemoveReviewResult, Error>) -> Void) {
        service?.removeReview { result in
            switch result {
            case .success(let reviewAnswer):
                completion(.success(reviewAnswer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Добавление коментария
    func addReview(completion: @escaping (Result<AddReviewResult, Error>) -> Void) {
        service?.addReview { result in
            switch result {
            case .success(let reviewAnswer):
                completion(.success(reviewAnswer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Добавление товара в корзину
    func addToBasket(completion: @escaping (Result<AddToBasketResult, Error>) -> Void) {
        service?.addToBasket { result in
            switch result {
            case .success(let basketAnswer):
                completion(.success(basketAnswer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    /// Удаление товара из корзины
    func deleteFromBasket(completion: @escaping (Result<DeletFromBasket, Error>) -> Void) {
        service?.deleteFromBasket { result in
            switch result {
            case .success(let basketAnswer):
                completion(.success(basketAnswer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Покупка товаров в корзине
    func payPasket(completion: @escaping (Result<PayBasketResult, Error>) -> Void) {
        service?.payBasket { result in
            switch result {
            case .success(let basketAnswer):
                completion(.success(basketAnswer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
