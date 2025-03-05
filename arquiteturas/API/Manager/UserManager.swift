//
//  UserManager.swift
//  arquiteturas
//
//  Created by Rodrigo Cerqueira Reis on 12/02/25.
//

import Foundation

protocol UserManagerProtocol {
    func login(email: String, password: String, sucessHandler: @escaping(UserModel) -> Void, failureHandler: @escaping(Error?) -> Void)
    func register(email: String, password: String, sucessHandler: @escaping(UserModel) -> Void, failureHandler: @escaping(Error?) -> Void)
}

class UserManager: UserManagerProtocol {
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func login(email: String, password: String, sucessHandler: @escaping (UserModel) -> Void, failureHandler: @escaping ((any Error)?) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                sucessHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(email: String, password: String, sucessHandler: @escaping (UserModel) -> Void, failureHandler: @escaping ((any Error)?) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                sucessHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
            
        }
    }
}
