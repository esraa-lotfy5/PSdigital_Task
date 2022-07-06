//
//  Sauces.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import SwiftUI

struct Sauces: View {
    var typeText : String
    var comboItem : ComboResults
    
    var body: some View {
        if(comboItem.sauces.count != 0){
            VStack(alignment: .leading){    // Start of Sauces
                    Text("Sauces")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding(.top, 8)
                    .padding(.leading, 16)
            if(comboItem.sauces.count < 4){
                HStack{
                    Spacer().frame(width: 25)
                    ForEach(comboItem.sauces, id: \.id){sauce in
                        Cell(typeText: typeText, imagePath: sauce.imagePath)
                        Spacer()
                    }
                }.padding(.bottom, 10)
            }else{
                ScrollView(.horizontal){
                    HStack{
                        Spacer().frame(width: 16)
                        ForEach((0...(comboItem.sauces.count/2)-1), id: \.self) { i in
                            Cell(typeText: typeText, imagePath: comboItem.sauces[i].imagePath)
                            Spacer().frame(width: 30)
                       }
                    }
                }.padding(.bottom, 30)
                ScrollView(.horizontal){
                    HStack{
                        Spacer().frame(width: 16)
                        ForEach(((comboItem.sauces.count/2)...(comboItem.sauces.count)-1), id: \.self) { i in
                            Cell(typeText: typeText, imagePath: comboItem.sauces[i].imagePath)
                            Spacer().frame(width:30)
                       }
                    }.padding(.bottom, 10)
                }
            }
            }
            Spacer().frame(maxWidth:.infinity, maxHeight: 16)
                .background(Color(hex: HomeScreen.grayColor))
        }
    }
}

//struct Sauces_Previews: PreviewProvider {
//    static var previews: some View {
//        Sauces()
//    }
//}
