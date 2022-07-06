//
//  Sides.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import SwiftUI

struct Sides: View {
    @Binding var id : Int
    var typeText : String
    var ComboItem : ComboResults
    var body: some View {
        if(ComboItem.sides.count != 0){
            VStack(alignment: .leading){
                Text("Sides")
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
                        ForEach(ComboItem.sides, id: \.id) { side in
                            CellWithRadioButton(id: side.id, selectedIndex: $id, typeText: typeText, imagePath: side.imagePath)
                            Spacer().frame(width: 30)
                       }
                    }
                }.padding(.bottom, 30)
            }
            Spacer().frame(maxWidth:.infinity, maxHeight: 16)
                .background(Color(hex: HomeScreen.grayColor))
        }
    }
}

//struct Sides_Previews: PreviewProvider {
//    static var previews: some View {
//        Sides()
//    }
//}
