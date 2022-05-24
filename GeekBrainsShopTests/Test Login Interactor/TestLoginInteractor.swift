//
//  TestLoginInteractor.swift
//  GeekBrainsShopTests
//
//  Created by Vitalii Sukhoroslov on 27.04.2022.
//

import XCTest
import Alamofire

@testable import GeekBrainsShop

class TestLoginInteractor: XCTestCase {
    
    let interactor = LoginBuilder.build()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Test логина
    func testLogin() {
        let expectation = XCTestExpectation(description: "Login")
        self.interactor.login() { result in
            switch result {
            case .success(let resultLogin):
                XCTAssertEqual(resultLogin.result, 1)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    /// Test Registration
    func testRegistration() {
        let expectation = XCTestExpectation(description: "Registration")
        self.interactor.registration() { result in
            switch result {
            case .success(let resultRegistration):
                XCTAssertEqual(resultRegistration.result, 1)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    /// Test Logout
    func testLogout() {
        let expectation = XCTestExpectation(description: "Logout")
        self.interactor.logout() { result in
            switch result {
            case .success(let resultLogout):
                XCTAssertEqual(resultLogout.result, 1)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
   
    /// TestChangeUserData
    func testChangeUserData() {
        let expectation = XCTestExpectation(description: "ChangeUserData")
        self.interactor.changeUserData() { result in
            switch result {
            case .success(let resultChange):
                XCTAssertEqual(resultChange.result, 1)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    /// Test ArrayProducts
    func testGetArrayProduct() {
        let expectation = XCTestExpectation(description: "ArrayProduct")
        self.interactor.getArrayProduct() { result in
            switch result {
            case .success(let array):
                XCTAssertEqual(array.isEmpty, false)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    /// Test get product
    func testGetProduct() {
        let expectation = XCTestExpectation(description: "product")
        self.interactor.getDataProduct() { result in
            switch result {
            case .success(let product):
                XCTAssertEqual(product.result.result, 1)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    /// TestPayBasket
    func testPayBasket() {
        let expectation = XCTestExpectation(description: "payBasket")
        self.interactor.payPasket { result in
            switch result {
            case .success(let answer):
                XCTAssertEqual(answer.result, 1)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
