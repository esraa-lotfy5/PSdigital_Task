//
//  Category.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import Foundation


// MARK: - Category
class Category: Codable {
    let requestDate: String
    let resonseCode: Int
    let resonseTitle: String
    let resonseMessage: JSONNull?
    let results: [CategoryResult]

    enum CodingKeys: String, CodingKey {
        case requestDate = "RequestDate"
        case resonseCode = "ResonseCode"
        case resonseTitle = "ResonseTitle"
        case resonseMessage = "ResonseMessage"
        case results = "Results"
    }

    init(requestDate: String, resonseCode: Int, resonseTitle: String, resonseMessage: JSONNull?, results: [CategoryResult]) {
        self.requestDate = requestDate
        self.resonseCode = resonseCode
        self.resonseTitle = resonseTitle
        self.resonseMessage = resonseMessage
        self.results = results
    }
}

// MARK: - CategoryResult
class CategoryResult: Codable {
    let id: Int
    let name, resultDescription: String
    let imagePath: String
    let displayOrder: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case resultDescription = "Description"
        case imagePath = "ImagePath"
        case displayOrder = "DisplayOrder"
    }

    init(id: Int, name: String, resultDescription: String, imagePath: String, displayOrder: Int) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.imagePath = imagePath
        self.displayOrder = displayOrder
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
