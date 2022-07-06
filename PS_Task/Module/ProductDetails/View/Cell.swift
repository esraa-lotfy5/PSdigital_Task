//
//  Cell.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import SwiftUI
import Kingfisher

struct Cell: View {
    var typeText : String
    var imagePath : String
    
    var body: some View {
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
            
            QuantityStepper()
            
        }
    }
}

//struct Cell_Previews: PreviewProvider {
//    static var previews: some View {
//        Cell()
//    }
//}
