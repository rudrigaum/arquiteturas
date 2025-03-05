//
//  UserModel.swift
//  arquiteturas
//
//  Created by Rodrigo Cerqueira Reis on 14/11/24.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        
    }
}
