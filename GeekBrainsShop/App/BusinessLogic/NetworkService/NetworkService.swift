//
//  NetworkService.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 25.04.2022.
//
import Foundation
import Alamofire

/// Входящий протокол нетворк сервиса
protocol NetworkServiceInput {
    
    /// Авторизация
    ///  - Parameter complition: Блок обрабатывающий резултат
    func authorisation(completion: @escaping (Result<LoginResult, RequestError>) -> Void)
    
    /// Регистрация
    ///  - Parameter complition: Блок обрабатывающий резултат
    func registration(completion: @escaping (Result<RegistrationResult, RequestError>) -> Void)
    
    /// Выход
    ///  - Parameter complition: Блок обрабатывающий резултат
    func logout(completion: @escaping (Result<LogoutResult, RequestError>) -> Void)
    
    /// Изменение данных пользователя
    ///  - Parameter complition: Блок обрабатывающий резултат
    func changeUserData(completion: @escaping (Result<ChangeUserDataResult, RequestError>) -> Void)
    
    /// Получение списка продуктов
    ///  - Parameter complition: Блок обрабатывающий резултат
    func getArrayProducts(completion: @escaping (Result<[Catalog], RequestError>) -> Void)
    
    /// Получение данных товара
    ///  - Parameter complition: Блок обрабатывающий резултат
    func getDataProduct(completion: @escaping (Result<Product, RequestError>) -> Void)
    
    /// Добавление коментария
    ///  - Parameter complition: Блок обрабатывающий резултат
    func removeReview(completion: @escaping (Result<RemoveReviewResult, RequestError>) -> Void)
    
    /// Удаление коментария
    ///  - Parameter complition: Блок обрабатывающий резултат
    func addReview(completion: @escaping (Result<AddReviewResult, RequestError>) -> Void)
    
    /// Добавление товара в корзину
    ///  - Parameter complition: Блок обрабатывающий резултат
    func addToBasket(completion: @escaping (Result<AddToBasketResult, RequestError>) -> Void)
    
    /// Удаление товара в корзину
    ///  - Parameter complition: Блок обрабатывающий резултат
    func deleteFromBasket(completion: @escaping (Result<DeletFromBasket, RequestError>) -> Void)
    
    /// Покупка товаров в корзине
    ///  - Parameter complition: Блок обрабатывающий резултат
    func payBasket(completion: @escaping (Result<PayBasketResult, RequestError>) -> Void)
}

/// Метод
fileprivate enum Methods: String {
    case login = "/GeekBrainsTutorial/online-store-api/master/responses/login.json"
    case logout = "/GeekBrainsTutorial/online-store-api/master/responses/logout.json"
    case registration = "/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json"
    case changeUserData = "/GeekBrainsTutorial/online-store-api/master/responses/changeUserData.json"
    case catalog = "/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"
    case product = "/getProduct"
    case removeReview = "/removeReview"
    case addReview = "/addReview"
    case addToBasket = "/addToBasket"
    case deleteFromBasket = "/deleteFromBasket"
    case payBasket = "/payBasket"

}

/// Тип запроса
fileprivate enum TypeRequest: String {
    case get = "GET"
    case post = "POST"
}

/// Список ошибок
enum RequestError: Error {
    case parseError
    case taskError
}

// MARK: - NetworkService
final class NetworkService {
    
    /// Сессия
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    /// Протокол запроса
    private let scheme = "https"
    
    /// Адресс сервера
    private let host = "raw.githubusercontent.com"
    
    /// Адресс облака
    private let hostOnline = "gbshop-foux.herokuapp.com"
    
    /// Декодер
    private let decoder = JSONDecoder()
}

// MARK: - Extension NetworkService on the NetworkServiceInput
extension NetworkService: NetworkServiceInput {
        
    /// Регистрация
    func registration(completion: @escaping (Result<RegistrationResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrl(method: .registration, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(RegistrationResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Выход
    func logout(completion: @escaping (Result<LogoutResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrl(method: .logout, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(LogoutResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    

    /// Авторизация
    func authorisation(completion: @escaping (Result<LoginResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrl(method: .login, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(LoginResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Изменение данных пользователя
    func changeUserData(completion: @escaping (Result<ChangeUserDataResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrl(method: .changeUserData, httpMethod: .post)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(ChangeUserDataResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Получение списка продуктов
    func getArrayProducts(completion: @escaping (Result<[Catalog], RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrl(method: .catalog, httpMethod: .post)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode([Catalog].self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Получение данных товара
    func getDataProduct(completion: @escaping (Result<Product, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrlOnline(method: .product, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(Product.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Добавление коментария
    func removeReview(completion: @escaping (Result<RemoveReviewResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrlOnline(method: .removeReview, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(RemoveReviewResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Удаление коментария
    func addReview(completion: @escaping (Result<AddReviewResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrlOnline(method: .addReview, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(AddReviewResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Добавление товара в корзину
    func addToBasket(completion: @escaping (Result<AddToBasketResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrlOnline(method: .addReview, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(AddToBasketResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Удаление товара в корзину
    func deleteFromBasket(completion: @escaping (Result<DeletFromBasket, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrlOnline(method: .addReview, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(DeletFromBasket.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
    
    /// Покупка товаров в корзине
    func payBasket(completion: @escaping (Result<PayBasketResult, RequestError>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [self] in
            let url = configureUrlOnline(method: .payBasket, httpMethod: .get)
            AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
                guard let data = response.data else { return }
                do {
                    guard let result = try self?.decoder.decode(PayBasketResult.self, from: data) else {return}
                    DispatchQueue.main.async {
                        return completion(.success(result))
                    }
                } catch {
                    return completion(.failure(.parseError))
                }
            }
        }
    }
}

// MARK: - Private
private extension NetworkService {
    func configureUrl(method: Methods, httpMethod: TypeRequest) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = method.rawValue
        guard let url = urlComponents.url else {
            fatalError("URL is invalid")
        }
        return url
    }
    
    func configureUrlOnline(method: Methods, httpMethod: TypeRequest) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = hostOnline
        urlComponents.path = method.rawValue
        guard let url = urlComponents.url else {
            fatalError("URL is invalid")
        }
        return url
    }
}
