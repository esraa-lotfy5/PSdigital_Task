//
//  IngrediansCell.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 05/07/2022.
//

import SwiftUI
import Kingfisher

struct IngrediansCell: View {
    var typeText : String
    var ingredians : [ComboIngredient]
    
    var body: some View {
        if(ingredians.count < 4){
            HStack{
                Spacer().frame(width: 25)
                ForEach(ingredians, id: \.id){ingredient in
                    Cell(typeText: typeText, imagePath: ingredient.imagePath)
                    Spacer()
                }
            }
        }else{
            HStack{
                Spacer().frame(width: 16)
                ForEach((0...2), id: \.self) { i in
                    Cell(typeText: typeText, imagePath: ingredians[i].imagePath)
                    Spacer()
               }
                Spacer().frame(width: 16)
            }
            HStack{
                Spacer().frame(width: 16)
                ForEach((3...ingredians.count-1), id: \.self) { i in
                    Cell(typeText: typeText, imagePath: ingredians[i].imagePath)
                    Spacer()
               }
                Spacer().frame(width: 16)
            }
        }
    }
}

//struct IngrediansCell_Previews: PreviewProvider {
//    static var previews: some View {
//        IngrediansCell()
//    }
//}
