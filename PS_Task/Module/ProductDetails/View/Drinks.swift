//
//  Drinks.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import SwiftUI

struct Drinks: View {
    @Binding var drinkId : Int
    var drinkTypeText : String
    var comboItem : ComboResults
//    var drinks : [ComboDrink]
    var body: some View {
        if(comboItem.drinks.count != 0){
            VStack(alignment: .leading){
                Text("Drinks")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding(.top, 8)
                    .padding(.leading, 16)
                
                Text("Choose One Side")
                    .font(.system(size: 15))
                    .foregroundColor(Color(hex: HomeScreen.redColor))
                    .padding(.leading, 16)
                ScrollView(.horizontal){
                    HStack{
                        Spacer().frame(width: 16)
                        ForEach(comboItem.drinks, id: \.id) { drink in
                            CellWithRadioButton(id: drink.id, selectedIndex: $drinkId, typeText: drinkTypeText, imagePath: drink.imagePath)
                            Spacer().frame(width: 30)
                       }
                    }
                }.padding(.bottom, 30)
            }
        }
    }
}

//struct Drinks_Previews: PreviewProvider {
//    static var previews: some View {
//        Drinks()
//    }
//}
