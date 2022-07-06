//
//  Combo.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 04/07/2022.
//

import Foundation

// MARK: - Combo
class Combo: Codable {
    let requestDate: String
    let resonseCode: Int
    let resonseTitle: String
    let resonseMessage: JSONNull?
    let results: ComboResults

    enum CodingKeys: String, CodingKey {
        case requestDate = "RequestDate"
        case resonseCode = "ResonseCode"
        case resonseTitle = "ResonseTitle"
        case resonseMessage = "ResonseMessage"
        case results = "Results"
    }

    init(requestDate: String, resonseCode: Int, resonseTitle: String, resonseMessage: JSONNull?, results: ComboResults) {
        self.requestDate = requestDate
        self.resonseCode = resonseCode
        self.resonseTitle = resonseTitle
        self.resonseMessage = resonseMessage
        self.results = results
    }
}

// MARK: - ComboResults
class ComboResults: Codable {
    let id: Int
    let name, resultsDescription: String
    let imagePath: String
    let defaultPrice, itemType: Int
    let calories: String
    let sizes: [ComboSize]
    let drinks: [ComboDrink]
    let sides, desserts: [ComboDrink]
    let sandwiches: [ComboDrink]
    let chickenPieces : [ChickenPieces]
    let biscuits: [JSONAny]
    let sauces: [ComboDrink]
    let isCustomizeable: Bool

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case resultsDescription = "Description"
        case imagePath = "ImagePath"
        case defaultPrice = "DefaultPrice"
        case itemType = "ItemType"
        case calories = "Calories"
        case sizes = "Sizes"
        case drinks = "Drinks"
        case sides = "Sides"
        case desserts = "Desserts"
        case sandwiches = "Sandwiches"
        case chickenPieces = "ChickenPieces"
        case biscuits = "Biscuits"
        case sauces = "Sauces"
        case isCustomizeable = "IsCustomizeable"
    }
    
    init(){
        id = 0
        name = ""
        resultsDescription = ""
        imagePath = ""
        defaultPrice = -1
        itemType = 0
        calories = ""
        sizes = []
        sandwiches = []
        drinks = []
        sides = []
        desserts = []
        chickenPieces = []
        biscuits = []
        sauces = []
        isCustomizeable = true
    }

    init(id: Int, name: String, resultsDescription: String, imagePath: String, defaultPrice: Int, itemType: Int, calories: String, sizes: [ComboSize], drinks: [ComboDrink], sides: [ComboDrink], desserts: [ComboDrink], sandwiches: [ComboDrink], chickenPieces: [ChickenPieces], biscuits: [JSONAny], sauces: [ComboDrink], isCustomizeable: Bool) {
        self.id = id
        self.name = name
        self.resultsDescription = resultsDescription
        self.imagePath = imagePath
        self.defaultPrice = defaultPrice
        self.itemType = itemType
        self.calories = calories
        self.sizes = sizes
        self.drinks = drinks
        self.sides = sides
        self.desserts = desserts
        self.sandwiches = sandwiches
        self.chickenPieces = chickenPieces
        self.biscuits = biscuits
        self.sauces = sauces
        self.isCustomizeable = isCustomizeable
    }
}


// MARK: - ChickenPieces
class ChickenPieces: Codable {
    let id, productID: Int
    let name, drinkDescription: String
    let imagePath: String
    let defaultPrice: Double
    let isDefault: Bool
    let itemType, displayOrder: Int
    let isSpicy, isLTO: Bool
    let ltoName: LTOName
    let size, quantityMax, quantityDefault: Int
    let ingredients: [ComboIngredient]
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case productID = "ProductID"
        case name = "Name"
        case drinkDescription = "Description"
        case imagePath = "ImagePath"
        case defaultPrice = "DefaultPrice"
        case isDefault = "IsDefault"
        case itemType = "ItemType"
        case displayOrder = "DisplayOrder"
        case isSpicy = "IsSpicy"
        case isLTO = "IsLTO"
        case ltoName = "LTOName"
        case size = "Size"
        case quantityMax = "QuantityMax"
        case quantityDefault = "QuantityDefault"
        case ingredients = "Ingredients"
    }

    init(id: Int, productID: Int, name: String, drinkDescription: String, imagePath: String, defaultPrice: Double, isDefault: Bool, itemType: Int, displayOrder: Int, isSpicy: Bool, isLTO: Bool, ltoName: LTOName, size: Int, quantityMax: Int, quantityDefault: Int, ingredients: [ComboIngredient]) {
        self.id = id
        self.productID = productID
        self.name = name
        self.drinkDescription = drinkDescription
        self.imagePath = imagePath
        self.defaultPrice = defaultPrice
        self.isDefault = isDefault
        self.itemType = itemType
        self.displayOrder = displayOrder
        self.isSpicy = isSpicy
        self.isLTO = isLTO
        self.ltoName = ltoName
        self.size = size
        self.quantityMax = quantityMax
        self.quantityDefault = quantityDefault
        self.ingredients = ingredients
    }
    
}

// MARK: - Drink
class ComboDrink: Codable {
    let id, productID: Int
    let name, drinkDescription: String
    let imagePath: String
    let defaultPrice: Double
    let isDefault: Bool
    let itemType, displayOrder: Int
    let isSpicy, isLTO: Bool
    let ltoName: LTOName
    let size, quantityMax, quantityDefault: Int
    let ingredients: [ComboIngredient]

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case productID = "ProductID"
        case name = "Name"
        case drinkDescription = "Description"
        case imagePath = "ImagePath"
        case defaultPrice = "DefaultPrice"
        case isDefault = "IsDefault"
        case itemType = "ItemType"
        case displayOrder = "DisplayOrder"
        case isSpicy = "IsSpicy"
        case isLTO = "IsLTO"
        case ltoName = "LTOName"
        case size = "Size"
        case quantityMax = "QuantityMax"
        case quantityDefault = "QuantityDefault"
        case ingredients = "Ingredients"
    }
    
    init(){
        self.id = 0
        self.productID = 0
        self.name = ""
        self.drinkDescription = ""
        self.imagePath = ""
        self.defaultPrice = 0
        self.isDefault = false
        self.itemType = 0
        self.displayOrder = 0
        self.isSpicy = false
        self.isLTO = false
        self.ltoName = LTOName.empty
        self.size = 0
        self.quantityMax = 0
        self.quantityDefault = 0
        self.ingredients = []
    }

    init(id: Int, productID: Int, name: String, drinkDescription: String, imagePath: String, defaultPrice: Double, isDefault: Bool, itemType: Int, displayOrder: Int, isSpicy: Bool, isLTO: Bool, ltoName: LTOName, size: Int, quantityMax: Int, quantityDefault: Int, ingredients: [ComboIngredient]) {
        self.id = id
        self.productID = productID
        self.name = name
        self.drinkDescription = drinkDescription
        self.imagePath = imagePath
        self.defaultPrice = defaultPrice
        self.isDefault = isDefault
        self.itemType = itemType
        self.displayOrder = displayOrder
        self.isSpicy = isSpicy
        self.isLTO = isLTO
        self.ltoName = ltoName
        self.size = size
        self.quantityMax = quantityMax
        self.quantityDefault = quantityDefault
        self.ingredients = ingredients
    }
}

// MARK: - Ingredient
class ComboIngredient: Codable {
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
class ComboSize: Codable, Identifiable {
    let id: Int
    let name: String
    let defaultPrice: Double
    let displayOrder: Int
    let isDefault: Bool
    let drinksQuantityMax, drinksQuantityDefault, sidesQuantityMax, sidesQuantityDefault: Int
    let dessertsQuantityMax, dessertsQuantityDefault, sandwishsQuantityMax, sandwishsQuantityDefault: Int
    let chickenPiecesQuantityMax, chickenPiecesQuantityDefault, biscuitsQuantityMax, biscuitsQuantityDefault: Int
    let saucesQuantityMax, saucesQuantityDefault: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case defaultPrice = "DefaultPrice"
        case displayOrder = "DisplayOrder"
        case isDefault = "IsDefault"
        case drinksQuantityMax = "DrinksQuantityMax"
        case drinksQuantityDefault = "DrinksQuantityDefault"
        case sidesQuantityMax = "SidesQuantityMax"
        case sidesQuantityDefault = "SidesQuantityDefault"
        case dessertsQuantityMax = "DessertsQuantityMax"
        case dessertsQuantityDefault = "DessertsQuantityDefault"
        case sandwishsQuantityMax = "SandwishsQuantityMax"
        case sandwishsQuantityDefault = "SandwishsQuantityDefault"
        case chickenPiecesQuantityMax = "ChickenPiecesQuantityMax"
        case chickenPiecesQuantityDefault = "ChickenPiecesQuantityDefault"
        case biscuitsQuantityMax = "BiscuitsQuantityMax"
        case biscuitsQuantityDefault = "BiscuitsQuantityDefault"
        case saucesQuantityMax = "SaucesQuantityMax"
        case saucesQuantityDefault = "SaucesQuantityDefault"
    }

    init(id: Int, name: String, defaultPrice: Double, displayOrder: Int, isDefault: Bool, drinksQuantityMax: Int, drinksQuantityDefault: Int, sidesQuantityMax: Int, sidesQuantityDefault: Int, dessertsQuantityMax: Int, dessertsQuantityDefault: Int, sandwishsQuantityMax: Int, sandwishsQuantityDefault: Int, chickenPiecesQuantityMax: Int, chickenPiecesQuantityDefault: Int, biscuitsQuantityMax: Int, biscuitsQuantityDefault: Int, saucesQuantityMax: Int, saucesQuantityDefault: Int) {
        self.id = id
        self.name = name
        self.defaultPrice = defaultPrice
        self.displayOrder = displayOrder
        self.isDefault = isDefault
        self.drinksQuantityMax = drinksQuantityMax
        self.drinksQuantityDefault = drinksQuantityDefault
        self.sidesQuantityMax = sidesQuantityMax
        self.sidesQuantityDefault = sidesQuantityDefault
        self.dessertsQuantityMax = dessertsQuantityMax
        self.dessertsQuantityDefault = dessertsQuantityDefault
        self.sandwishsQuantityMax = sandwishsQuantityMax
        self.sandwishsQuantityDefault = sandwishsQuantityDefault
        self.chickenPiecesQuantityMax = chickenPiecesQuantityMax
        self.chickenPiecesQuantityDefault = chickenPiecesQuantityDefault
        self.biscuitsQuantityMax = biscuitsQuantityMax
        self.biscuitsQuantityDefault = biscuitsQuantityDefault
        self.saucesQuantityMax = saucesQuantityMax
        self.saucesQuantityDefault = saucesQuantityDefault
    }
}

// MARK: - Encode/decode helpers

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}


class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
