//
//  NetworkAPI.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import Foundation
import Alamofire
import UIKit

protocol NetworkAPIProtocol {

    func getCategories(completion: @escaping(Result<Category?, NSError>) -> Void)
    func getCategoryItems(categoryID : Int ,completion: @escaping(Result<CategoryItem?, NSError>) -> Void)
    func getProduct(productID : Int ,completion: @escaping(Result<Product?, NSError>) -> Void)
    func getCombo(comboID : Int ,completion: @escaping(Result<Combo?, NSError>) -> Void)
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    
    func getCategories(completion: @escaping(Result<Category?, NSError>) -> Void){
        let parameters :[String:String] = ["OrderType":"2"]
        self.fetchData(target: .getCategory(parameters: parameters), responseClass: Category.self){(result) in
            completion(result)
        }
    }
    
    func getCategoryItems(categoryID: Int, completion: @escaping (Result<CategoryItem?, NSError>) -> Void) {
        let parameters :[String:String] = ["OrderType":"2" ,"Category":String(categoryID) ,"Branch":"0"]
        self.fetchData(target: .getCategoryItems(parameters: parameters), responseClass: CategoryItem.self){(result) in
            completion(result)
        }
    }
    
    func getProduct(productID : Int ,completion: @escaping(Result<Product?, NSError>) -> Void){
        let parameters :[String:String] = ["Product":String(productID) ,"Branch":"0"]
        self.fetchData(target: .getProduct(parameters: parameters), responseClass: Product.self){(result) in
            completion(result)
        }
    }
    func getCombo(comboID : Int ,completion: @escaping(Result<Combo?, NSError>) -> Void){
        let parameters :[String:String] = ["Combo":String(comboID) ,"Branch":"0"]
        self.fetchData(target: .getCombo(parameters: parameters), responseClass: Combo.self){(result) in
            completion(result)
        }
    }
}
