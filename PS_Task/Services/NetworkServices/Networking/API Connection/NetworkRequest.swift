//
//  NetworkRequest.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import Foundation
import Alamofire

enum NetworkRequest{
    case getCategory(parameters : Parameters)
    case getCategoryItems(parameters : Parameters)
    case getProduct(parameters : Parameters)
    case getCombo(parameters : Parameters)
}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
            default :
                return Constants.baseUrl
        }
    }
    
    var path: String {
        switch self {
        case .getCategory:
            return "Category"
        case .getCategoryItems:
            return "Category/Items"
        case .getProduct:
            return "Product"
        case .getCombo:
            return "Combo"
        }
    }
    
var method: HTTPMethod {
    switch self {
        case .getCategory:
            return .get
        case .getCategoryItems:
            return .get
        case .getProduct:
            return .get
        case .getCombo:
            return .get
    }
}
    
var task: Task {
    switch self {
    case .getCategory(let parameters):
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    case .getCategoryItems(let parameters):
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    case .getProduct(let parameters):
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    case .getCombo(let parameters):
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
}
    
var headers: [String : String]? {
    switch self {
    default:
        return [
            "AccessToken":"02111C42A8CC4BF0ACF016AE3E0DEA6C035FBF8A1AAD41BCBE312B1363393A3774511FB8BD6B487BABDF70C9C91A93E1D0A43D499A4E49D4B23226812B2589C19BBF2AF4D81C45E5A2FD3A1319AE676532ABDEDEED9C41FF844A6960FC09CF189E25A0BD1CEA419FA5188E666F89516D9C04C0548DF145E59A64E788991CC765",
            "RequestSource":"IOS"
        ]
    }
}
    
}
