//
//  ProductInfo.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 05/07/2022.
//

import SwiftUI
import Kingfisher

struct ProductInfo: View {
    var comboProduct : ComboResults
    var body: some View {
        VStack{ // product image and product name
            
            //  start of poduct image
            KFImage(URL(string: comboProduct.imagePath))
                .resizable()
                .frame(width:200 , height: 180)
                .shadow(color: .gray, radius: 3, x: 0, y: 2)
                .padding(.top, -10)
            //  end of product image
            
            //  start of product name
            Text(comboProduct.name)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.top, -20)
            //  end of product name
            
            //  start of customize text
            Text("Customize")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .padding(.top, -10)
            //  end of customize text
            
        }.background(.white)    // end of product image and name

    }
}

//struct ProductInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductInfo()
//    }
//}
