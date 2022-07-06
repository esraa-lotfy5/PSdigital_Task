//
//  CellWithRadioButton.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import SwiftUI
import Kingfisher

struct CellWithRadioButton: View {
    var id : Int
    @Binding var selectedIndex : Int
    var typeText : String
    var imagePath : String
    
    
    var body: some View {
        VStack{
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
                .padding(.bottom, 5)
            
//            Image(systemName: circleImageName)
//                .resizable()
//                .frame(width:20, height:20)
//                .foregroundColor(Color(hex: HomeScreen.yellowColor))
//                .onTapGesture {
//                    selectedIndex = id
//                    if(selectedIndex == id){
//                        if(circleImageName == "circle"){
//                            circleImageName = "circle.circle.fill"
//                        }else{
//                            circleImageName = "circle"
//                        }
//                    }
//                }.onChange(of: selectedIndex) { newValue in
//                    if(selectedIndex == id){
//
//                    }
//                }
            Radio(selectedID: $selectedIndex, id: id)
        }
    }
}

//struct CellWithRadioButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CellWithRadioButton()
//    }
//}


struct Radio : View {
    @Binding var selectedID : Int
    var id : Int
    @State var circleImageName : String = "circle"
    
    var body: some View {
        
        Image(systemName: circleImageName)
            .resizable()
            .frame(width:20, height:20)
            .foregroundColor(Color(hex: HomeScreen.yellowColor))
            .onTapGesture {
                selectedID = id
                if(selectedID == id){
                    if(circleImageName == "circle"){
                        circleImageName = "circle.circle.fill"
                    }else{
                        circleImageName = "circle"
                    }
                }else{
                    circleImageName = "circle"
                }
            
        }
    }
}
