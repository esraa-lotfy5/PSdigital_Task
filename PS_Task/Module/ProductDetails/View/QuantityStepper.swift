//
//  QuantityStepper.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 05/07/2022.
//

import SwiftUI

struct QuantityStepper: View {
    @State var quantity : Int = 1
    
    var body: some View {
        HStack{
            Button {
                quantity = quantity - 1
                print("On decrement : \(quantity)")
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.black)
                    .imageScale(.medium)
                    .frame(width: 10, height: 10)
                    .padding(10)
            }.background(Color(hex:HomeScreen.yellowColor))
            
            Text(String(quantity))
                .background(.white)
                .padding(5)
            
            Button {
                quantity = quantity + 1
                print("On increment : \(quantity)")
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .imageScale(.medium)
                    .frame(width:10, height: 10)
                    .padding(10)
            }.background(Color(hex:HomeScreen.yellowColor))

        }.clipShape(Capsule())
        .frame(height: 30)
    }
}

//struct QuantityStepper_Previews: PreviewProvider {
//    static var previews: some View {
//        QuantityStepper()
//    }
//}
