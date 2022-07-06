//
//  Sandwiches.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 05/07/2022.
//

import SwiftUI
import Kingfisher

struct Sandwiches: View {
    var comboProduct : ComboResults?
    @State var firstSandwichColor : Int = HomeScreen.darkGrayColor
    @State var secondSandwichColor : Int = HomeScreen.darkGrayColor
    @State var thirdSandwichColor : Int = HomeScreen.darkGrayColor
    @Binding var isFirstSelected : Bool
    @Binding var isSecondSelected : Bool
    @Binding var isThirdSelected : Bool
    
    var body: some View {
        VStack(alignment: .leading){ // start of Sandwiches
            Text("You Can Customize Each Sandwich \n ( Sandwich one, sandwich two)")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .padding(.top, 8)
                .padding(.leading, 16)
                .frame(maxWidth: .infinity)
                HStack{
                
                    Spacer()
                    
                    VStack{ // Regular Meal
                        KFImage(URL(string: comboProduct?.sandwiches[0].imagePath ??  ""))
                            .resizable()
                            .frame(width:70 , height: 70)
                            .frame(width: UIScreen.main.bounds.width/6, height:70)
                        .background(Color(hex:firstSandwichColor))
                        .cornerRadius(15)
                        .onTapGesture {
                            if(isFirstSelected){
                                isFirstSelected = false
                                firstSandwichColor = HomeScreen.darkGrayColor
                            }else{
                                isFirstSelected = true
                                isSecondSelected = false
                                isThirdSelected = false
                                firstSandwichColor = HomeScreen.yellowColor
                                secondSandwichColor = HomeScreen.darkGrayColor
                                thirdSandwichColor = HomeScreen.darkGrayColor
                            }
                        }
                                    
                    }.onChange(of: isFirstSelected) { newValue in
                        if(!newValue){  //reset
                            firstSandwichColor = HomeScreen.darkGrayColor
                        }else{
                            firstSandwichColor = HomeScreen.yellowColor
                        }
                    }
                    
                    Spacer().frame(width:16)
                    
                    VStack{ // second Meal
                        KFImage(URL(string: comboProduct?.sandwiches[1].imagePath ?? ""))
                            .resizable()
                            .frame(width:70 , height: 70)
                            .frame(width: UIScreen.main.bounds.width/6, height:70)
                        .background(Color(hex:secondSandwichColor))
                        .cornerRadius(15)
    //                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                        .onTapGesture {
                            print("We are in medium here")
                            if(isSecondSelected){
                                isSecondSelected = false
                                secondSandwichColor = HomeScreen.darkGrayColor
                            }else{
                                isSecondSelected = true
                                isFirstSelected = false
                                isThirdSelected = false
                                secondSandwichColor = HomeScreen.yellowColor
                                firstSandwichColor = HomeScreen.darkGrayColor
                                thirdSandwichColor = HomeScreen.darkGrayColor
                            }
                        }
                         
                    }.onChange(of: isSecondSelected) { newValue in
                        if(!newValue){  //reset
                            secondSandwichColor = HomeScreen.darkGrayColor
                        }else{
                            secondSandwichColor = HomeScreen.yellowColor
                        }
                    }
                    
                    Spacer().frame(width:16)
                    
                    VStack{ // Third Meal
                        KFImage(URL(string: comboProduct?.sandwiches[2].imagePath ?? ""))
                            .resizable()
                            .frame(width:70 , height: 70)
                            .frame(width: UIScreen.main.bounds.width/6, height:70)
                        .background(Color(hex:thirdSandwichColor))
                        .cornerRadius(15)
    //                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                        .onTapGesture {
                            print("We are in Large here")
                            if(isThirdSelected){
                                isThirdSelected = false
                                thirdSandwichColor = HomeScreen.darkGrayColor
                            }else{
                                isThirdSelected = true
                                isFirstSelected = false
                                isSecondSelected = false
                                thirdSandwichColor = HomeScreen.yellowColor
                                firstSandwichColor = HomeScreen.darkGrayColor
                                secondSandwichColor = HomeScreen.darkGrayColor
                            }
                        }
                    }.onChange(of: isThirdSelected) { newValue in
                        if(!newValue){  //reset
                            thirdSandwichColor = HomeScreen.darkGrayColor
                        }else{
                            thirdSandwichColor = HomeScreen.yellowColor
                        }
                    }
                    
                    Spacer()
                }
        }.background(Color(hex: HomeScreen.grayColor))
    }
}

//struct Sandwiches_Previews: PreviewProvider {
//    static var previews: some View {
//        Sandwiches()
//    }
//}
