//
//  HomeViewModel.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var categories : [CategoryResult] = []
    @Published var categoriesItems : [CategoryItemResult] = []
    @Published var categoryID : Int = 19
    @Published var categoryName : String = "Sandwiches"
    var api :NetworkAPIProtocol = NetworkAPI()
    
    func getCategories(){
        api.getCategories{(result) in
            switch result {
            case .success(let response):
                let categoriesResponse = response
                self.categories = categoriesResponse?.results ?? []
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        }
    }
    
    func getCategoryItems(){
        api.getCategoryItems(categoryID: categoryID) { (result) in
            switch result {
            case .success(let response):
                let categoriesResponse = response
                self.categoriesItems = categoriesResponse?.results ?? []
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
}
