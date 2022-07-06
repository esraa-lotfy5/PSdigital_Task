//
//  ProductDetailsViewModel.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 04/07/2022.
//

import Foundation

class ProductDetailsViewModel: ObservableObject{
    var api :NetworkAPIProtocol = NetworkAPI()
//    var productID : Int
    @Published var product : ProductResults?
    @Published var comboItem : ComboResults?
    
//    init(){
//        getProduct(productID: <#T##Int#>)
//    }
    
    func getProduct(productID: Int){
            api.getCombo(comboID: productID) { result in
            switch result {
                case .success(let response):
                    guard let product = response else{
                        return
                    }
                    self.comboItem = product.results
                    print("product name : \(product.results.name)")
                case .failure(let error):
                    // Show UI Error
                    print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
}
