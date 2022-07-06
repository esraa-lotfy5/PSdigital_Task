//
//  MealSizes.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 05/07/2022.
//

import SwiftUI
import Kingfisher

struct MealSizes: View {
    var comboProduct : ComboResults?
    @State var regularSizeColor : Int = HomeScreen.whiteColor
    @State var mediumSizeColor : Int = HomeScreen.whiteColor
    @State var largeSizeColor : Int = HomeScreen.whiteColor
    @Binding var isRegularSelected : Bool
    @Binding var isMediumSelected : Bool
    @Binding var isLargeSelected : Bool
    
    var body: some View {
        VStack(alignment: .leading){ // combo sizes
            Text("Combo sizes")
                .font(.system(size: 17))
                .fontWeight(.bold)
                .padding(.top, 8)
                .padding(.leading, 16)
            
            HStack{
                
                Spacer().frame(width:16)
                
                VStack{ // Regular Meal
                    KFImage(URL(string: comboProduct?.imagePath ??  ""))
                        .resizable()
                        .frame(width:80 , height: 80)
                    .frame(width: UIScreen.main.bounds.width/4, height:100)
                    .background(Color(hex:regularSizeColor))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    .onTapGesture {
                        print("We are in regular here")
                        if(isRegularSelected){
                            isRegularSelected = false
                            regularSizeColor = HomeScreen.whiteColor
                        }else{
                            isRegularSelected = true
                            isMediumSelected = false
                            isLargeSelected = false
                            regularSizeColor = HomeScreen.yellowColor
                            mediumSizeColor = HomeScreen.whiteColor
                            largeSizeColor = HomeScreen.whiteColor
                        }
                    }
                                
                    Text("\(comboProduct?.sizes[0].name.replacingOccurrences(of: "Small", with: "Regular") ??  "") Meal")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text("\(String(comboProduct?.sizes[0].defaultPrice ?? -1))BD")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .fontWeight(.semibold)
                }.onChange(of: isRegularSelected) { newValue in
                    if(!newValue){  //reset
                        regularSizeColor = HomeScreen.whiteColor
                    }else{
                        regularSizeColor = HomeScreen.yellowColor
                    }
                }
                
                Spacer()
                
                VStack{ // Medium Meal
                    KFImage(URL(string: comboProduct?.imagePath ?? ""))
                        .resizable()
                        .frame(width:80 , height: 80)
                    .frame(width: UIScreen.main.bounds.width/4, height:100)
                    .background(Color(hex:mediumSizeColor))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    .onTapGesture {
                        print("We are in medium here")
                        if(isMediumSelected){
                            isMediumSelected = false
                            mediumSizeColor = HomeScreen.whiteColor
                        }else{
                            isMediumSelected = true
                            isRegularSelected = false
                            isLargeSelected = false
                            mediumSizeColor = HomeScreen.yellowColor
                            regularSizeColor = HomeScreen.whiteColor
                            largeSizeColor = HomeScreen.whiteColor
                        }
                    }
                                
                    Text("\(comboProduct?.sizes[1].name.replacingOccurrences(of: "Small", with: "Regular") ?? "") Meal")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text("\(String(comboProduct?.sizes[1].defaultPrice ?? -1))BD")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .fontWeight(.semibold)
                }.onChange(of: isMediumSelected) { newValue in
                    if(!newValue){  //reset
                        mediumSizeColor = HomeScreen.whiteColor
                    }else{
                        mediumSizeColor = HomeScreen.yellowColor
                    }
                }
                
                Spacer()
                
                VStack{ // Large Meal
                    KFImage(URL(string: comboProduct?.imagePath ?? ""))
                        .resizable()
                        .frame(width:80 , height: 80)
                    .frame(width: UIScreen.main.bounds.width/4, height:100)
                    .background(Color(hex:largeSizeColor))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    .onTapGesture {
                        print("We are in Large here")
                        if(isLargeSelected){
                            isLargeSelected = false
                            largeSizeColor = HomeScreen.whiteColor
                        }else{
                            isLargeSelected = true
                            isRegularSelected = false
                            isMediumSelected = false
                            largeSizeColor = HomeScreen.yellowColor
                            regularSizeColor = HomeScreen.whiteColor
                            mediumSizeColor = HomeScreen.whiteColor
                        }
                    }
                                
                    Text("\(comboProduct?.sizes[2].name.replacingOccurrences(of: "Small", with: "Regular") ?? "") Meal")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text("\(String(comboProduct?.sizes[2].defaultPrice ?? -1))BD")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .fontWeight(.semibold)
                }.onChange(of: isLargeSelected) { newValue in
                    if(!newValue){  //reset
                        largeSizeColor = HomeScreen.whiteColor
                    }else{
                        largeSizeColor = HomeScreen.yellowColor
                    }
                }
                
                Spacer().frame(width:16)
            }.frame(height: 170)
        }
    }
}

//struct MealSizes_Previews: PreviewProvider {
//    static var previews: some View {
//        MealSizes()
//    }
//}
