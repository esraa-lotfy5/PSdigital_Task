//
//  CategoryItem.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 23/06/2022.
//

import Foundation

// MARK: - CategoryItem
class CategoryItem: Codable {
    let requestDate: String
    let resonseCode: Int
    let resonseTitle: String
    let resonseMessage: JSONNull?
    let results: [CategoryItemResult]

    enum CodingKeys: String, CodingKey {
        case requestDate = "RequestDate"
        case resonseCode = "ResonseCode"
        case resonseTitle = "ResonseTitle"
        case resonseMessage = "ResonseMessage"
        case results = "Results"
    }

    init(requestDate: String, resonseCode: Int, resonseTitle: String, resonseMessage: JSONNull?, results: [CategoryItemResult]) {
        self.requestDate = requestDate
        self.resonseCode = resonseCode
        self.resonseTitle = resonseTitle
        self.resonseMessage = resonseMessage
        self.results = results
    }
}

// MARK: - CategoryItemResult
class CategoryItemResult: Codable, Identifiable {
    let id: Int
    let name, resultDescription: String
    let imagePath: String
    let defaultPrice, comboDefaultPrice: Double
    let itemType, displayOrder: Int
    let isSpicy, isLto: Bool
    let ltoName: LTOName
    let haveACombo, haveSizes, isOnlyACombo: Bool
    let comboID: Int?
    let calories: Calories
    let isFavorite, isCustomizeable: Bool

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case resultDescription = "Description"
        case imagePath = "ImagePath"
        case defaultPrice = "DefaultPrice"
        case comboDefaultPrice = "ComboDefaultPrice"
        case itemType = "ItemType"
        case displayOrder = "DisplayOrder"
        case isSpicy = "IsSpicy"
        case isLto = "IsLto"
        case ltoName = "LTOName"
        case haveACombo = "HaveACombo"
        case haveSizes = "HaveSizes"
        case isOnlyACombo = "IsOnlyACombo"
        case comboID = "ComboID"
        case calories = "Calories"
        case isFavorite = "IsFavorite"
        case isCustomizeable = "IsCustomizeable"
    }

    init(id: Int, name: String, resultDescription: String, imagePath: String, defaultPrice: Double, comboDefaultPrice: Double, itemType: Int, displayOrder: Int, isSpicy: Bool, isLto: Bool, ltoName: LTOName, haveACombo: Bool, haveSizes: Bool, isOnlyACombo: Bool, comboID: Int?, calories: Calories, isFavorite: Bool, isCustomizeable: Bool) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.imagePath = imagePath
        self.defaultPrice = defaultPrice
        self.comboDefaultPrice = comboDefaultPrice
        self.itemType = itemType
        self.displayOrder = displayOrder
        self.isSpicy = isSpicy
        self.isLto = isLto
        self.ltoName = ltoName
        self.haveACombo = haveACombo
        self.haveSizes = haveSizes
        self.isOnlyACombo = isOnlyACombo
        self.comboID = comboID
        self.calories = calories
        self.isFavorite = isFavorite
        self.isCustomizeable = isCustomizeable
    }
}

enum Calories: String, Codable {
    case calories = " - "
    case empty = " -"
    case purple = " "
}

enum LTOName: String, Codable {
    case empty = ""
    case nanWith8PepperSauce = "NAN with 8 Pepper Sauce"
}

