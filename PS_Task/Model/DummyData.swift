//
//  DummyData.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 24/06/2022.
//

import Foundation

var dummyCategory : [CategoryResult] = [
    CategoryResult(id: 19, name: "SANDWICHES", resultDescription: "", imagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/NSandwich.png", displayOrder: 1)
]

var dummyCategoryItem : [CategoryItemResult] = [
    CategoryItemResult(id: 19248, name: "Crunchy Buttermilk Sandwich", resultDescription: "Creamy Sauce, Slice Pickles and Chicken Fillet", imagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/ae350d79-8587-4c44-8481-77d0d452bfca_.png", defaultPrice: 1.5, comboDefaultPrice: 2.6, itemType: 3, displayOrder: 2, isSpicy: false, isLto: true, ltoName: LTOName(rawValue: "")!, haveACombo: true, haveSizes: true, isOnlyACombo: false, comboID: 4660, calories: Calories(rawValue: " -")!, isFavorite: false, isCustomizeable: false)
]

var dummyProduct : [ProductResults] = [
    ProductResults(id: 19249, name: "NAN with 8 Pepper Sauce", resultsDescription: "Golden tender pieces with signature 8 peppers sauce in a fresh nan bread, for a new Texas twist", imagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/da7168da-889e-4a52-aabc-384ac4d12cdd_.png", defaultPrice: 0.7, itemType: 3, isSpicy: false, isLto: false, ltoName: "NAN with 8 Pepper Sauce", calories: Calories(rawValue: " -")!.rawValue , sizes: [Size(id: 8, name: "Single Size", defaultPrice: 0.7, isDefault: true, displayOrder: 0)], ingredients: [Ingredient(id: 296, name: "Tomato  ", ingredientDescription: "", imagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/tomato 3.png", defaultPrice: 0.1, displayOrder: 0, quantityMax: Int(2.0) , quantityDefault: Int(1.0)), Ingredient(id: 421, name: "Cheese", ingredientDescription: "", imagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/Cheese.png", defaultPrice: 0.1, displayOrder: 0 , quantityMax: Int(5.0), quantityDefault: Int(1.0)), Ingredient(id: 2266, name: "COLESLAW", ingredientDescription: "", imagePath: "http://Txsrv_v5.psdigital.me/ImageRepository/d7b80e04-490c-4dd1-95cc-8f19ad52861b.png", defaultPrice: 0.1, displayOrder: 0, quantityMax: Int(5.0), quantityDefault: Int(1.0))], isCustomizeable: true)
    ]
