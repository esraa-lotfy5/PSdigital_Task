//
//  Constants.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import Foundation
struct Constants {
    
    static let baseUrl = "http://txsrv_v5.psdigital.me/api/V5/Order/en/6/Menu/"
    
    
//    // endpoints
//    static let endPointLogin = "customers.json"
//    static let endPointCreateCustomer = "customers.json"
//    static let endPointOrders = "orders.json"
//    static let endpointCurrency = ""
    
}

struct ErrorMessages {
    static let genericError = "Something went wrong!"
    static let statusCode422 = "Error while creating request!"
    static let emailAndPhoneError = "You need to provide untaken email and phone!"
}
