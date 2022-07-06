//
//  Product.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 24/06/2022.
//

import Foundation

// MARK: - Product
class Product: Codable {
    let requestDate: String
    let resonseCode: Int
    let resonseTitle: String
    let resonseMessage: JSONNull?
    let results: ProductResults

    enum CodingKeys: String, CodingKey {
        case requestDate = "RequestDate"
        case resonseCode = "ResonseCode"
        case resonseTitle = "ResonseTitle"
        case resonseMessage = "ResonseMessage"
        case results = "Results"
    }

    init(requestDate: String, resonseCode: Int, resonseTitle: String, resonseMessage: JSONNull?, results: ProductResults) {
        self.requestDate = requestDate
        self.resonseCode = resonseCode
        self.resonseTitle = resonseTitle
        self.resonseMessage = resonseMessage
        self.results = results
    }
}

// MARK: - ProductResults
class ProductResults: Codable , Identifiable{
    let id: Int
    let name, resultsDescription: String
    let imagePath: String
    let defaultPrice: Double
    let itemType: Int
    let isSpicy, isLto: Bool
    let ltoName, calories: String
    let sizes: [Size]
    let ingredients: [Ingredient]
    let isCustomizeable: Bool

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case resultsDescription = "Description"
        case imagePath = "ImagePath"
        case defaultPrice = "DefaultPrice"
        case itemType = "ItemType"
        case isSpicy = "IsSpicy"
        case isLto = "IsLto"
        case ltoName = "LTOName"
        case calories = "Calories"
        case sizes = "Sizes"
        case ingredients = "Ingredients"
        case isCustomizeable = "IsCustomizeable"
    }

    init(id: Int, name: String, resultsDescription: String, imagePath: String, defaultPrice: Double, itemType: Int, isSpicy: Bool, isLto: Bool, ltoName: String, calories: String, sizes: [Size], ingredients: [Ingredient], isCustomizeable: Bool) {
        self.id = id
        self.name = name
        self.resultsDescription = resultsDescription
        self.imagePath = imagePath
        self.defaultPrice = defaultPrice
        self.itemType = itemType
        self.isSpicy = isSpicy
        self.isLto = isLto
        self.ltoName = ltoName
        self.calories = calories
        self.sizes = sizes
        self.ingredients = ingredients
        self.isCustomizeable = isCustomizeable
    }
}

// MARK: - Ingredient
class Ingredient: Codable, Identifiable {
    let id: Int
    let name, ingredientDescription: String
    let imagePath: String
    let defaultPrice: Double
    let displayOrder, quantityMax, quantityDefault: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case ingredientDescription = "Description"
        case imagePath = "ImagePath"
        case defaultPrice = "DefaultPrice"
        case displayOrder = "DisplayOrder"
        case quantityMax = "QuantityMax"
        case quantityDefault = "QuantityDefault"
    }

    init(id: Int, name: String, ingredientDescription: String, imagePath: String, defaultPrice: Double, displayOrder: Int, quantityMax: Int, quantityDefault: Int) {
        self.id = id
        self.name = name
        self.ingredientDescription = ingredientDescription
        self.imagePath = imagePath
        self.defaultPrice = defaultPrice
        self.displayOrder = displayOrder
        self.quantityMax = quantityMax
        self.quantityDefault = quantityDefault
    }
}

// MARK: - Size
class Size: Codable {
    let id: Int
    let name: String
    let defaultPrice: Double
    let isDefault: Bool
    let displayOrder: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case defaultPrice = "DefaultPrice"
        case isDefault = "IsDefault"
        case displayOrder = "DisplayOrder"
    }

    init(id: Int, name: String, defaultPrice: Double, isDefault: Bool, displayOrder: Int) {
        self.id = id
        self.name = name
        self.defaultPrice = defaultPrice
        self.isDefault = isDefault
        self.displayOrder = displayOrder
    }
}
