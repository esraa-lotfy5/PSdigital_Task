//
//  ChickenSelection.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 05/07/2022.
//

import SwiftUI
import Kingfisher

struct ChickenSelection: View {
    var typeText : String
    var imagePath : String
    
    var body: some View {
        HStack{
            Spacer().frame(width:16)
            VStack{ // Regular type
                KFImage(URL(string: imagePath))
                    .resizable()
                    .frame(width:80 , height: 80)
                    .frame(width: UIScreen.main.bounds.width/4, height:100)
                .background(Color(hex:HomeScreen.whiteColor))
                .cornerRadius(15)
                .shadow(color: .gray, radius: 3, x: 0, y: 2)
                .padding(.bottom, 3)
                
                            
                Text(typeText)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
//                    .padding(.bottom, 3)
                
                QuantityStepper()
                
            }
            
            Spacer().frame(width:32)
            
            VStack{ // Spicy Meal
                KFImage(URL(string: imagePath))
                    .resizable()
                    .frame(width:80 , height: 80)
                    .frame(width: UIScreen.main.bounds.width/4, height:100)
                    .background(Color(hex:HomeScreen.whiteColor))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                
                            
                Text("\(typeText) (Spicy)")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                
                QuantityStepper()
                
            }
            Spacer()
        }
    }
}

//struct ChickenSelection_Previews: PreviewProvider {
//    static var previews: some View {
//        ChickenSelection()
//    }
//}
