//
//  API.swift
//  rxPractice
//
//  Created by 김기영 on 2021/09/17.
//

import Foundation
import Alamofire

public enum Api {
    case login(_ id: String, _ password: String)
    case signUp(_ id: String, _ password: String, _ name: String)
    
    func path() -> String {
        switch self {
        case .login:
            return "/admin/login"
        case .signUp:
            return "/admin/signUp"
        }
    }
    
    func method() -> HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        }
    }
    
    func header() -> HTTPHeaders? {
        
    }
    
}
