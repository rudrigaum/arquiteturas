//
//  arquiteturasTests.swift
//  arquiteturasTests
//
//  Created by Rodrigo Cerqueira Reis on 28/10/24.
//

import XCTest
@testable import arquiteturas

final class arquiteturasTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() throws {
        var userModel = UserModel()
        
        let exp = expectation(description: "Check Loing is oK")
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: "teste@teste.com", password: "a12345") { user in
            print(user)
            userModel = user
        } failureHandler: { error in
            print(error)
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("Error Timeout: \(error)")
            }
            XCTAssertEqual(userModel != nil, true)
        }
    }
    
    func testLogin() throws {
        let manager = UserManager(business: UserBusiness())

        manager.login(email: "teste@teste.com", password: "a12345") { usermodel in
            print(usermodel)
        } failureHandler: { error in
            print(error)
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
