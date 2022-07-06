//
//  SandwichesNavigationBar.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 06/07/2022.
//

import SwiftUI

struct SandwichesNavigationBar: View {
    
    @Binding var isFirstSelected : Bool
    @Binding var isSecondSelected : Bool
    @Binding var isThirdSelected : Bool
    
    var body: some View {
        HStack{ // start of navigation bar (to navigate between sandwiches ingrediants)
            Button {    // left arrow (First sandwich)
                if(isFirstSelected){
                    isThirdSelected = true
                    isFirstSelected = false
                }else{
                    if(isSecondSelected){
                        isFirstSelected = true
                        isSecondSelected = false
                    }else{
                        if(isThirdSelected){
                            isSecondSelected = true
                            isThirdSelected = false
                        }
                    }
                }
            } label: {
                HStack{
                    Image(systemName: "chevron.left")
                        .padding(5)
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.top ,5)
                        .padding(.bottom ,5)
                        .padding(.leading ,5)

                    Text("First Sandwich")
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .font(.system(size: 15))
                        .padding(.top ,10)
                        .padding(.bottom ,10)
                        .padding(.trailing ,10)

                    Spacer().frame(width:15)
                }.background(Color(hex: HomeScreen.grayColor))
            }   // end of left arrow
            
            Spacer().frame(width: 5)
                .background(.white)
            
            Button {    // right arrow (Second Sandwich)
                if(isFirstSelected){
                    isSecondSelected = true
                    isFirstSelected = false
                }else{
                    if(isSecondSelected){
                        isThirdSelected = true
                        isSecondSelected = false
                    }else{
                        if(isThirdSelected){
                            isFirstSelected = true
                            isThirdSelected = false
                        }
                    }
                }
            } label: {
                HStack{
                    Spacer().frame(width:15)
                    Text("Second Sandwich")
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .font(.system(size: 14))
                        .padding(.top ,10)
                        .padding(.bottom ,10)
                        .padding(.leading ,10)

                    Image(systemName: "chevron.right")
                        .padding(5)
                        .foregroundColor(Color(hex: HomeScreen.redColor))
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.top ,5)
                        .padding(.bottom ,5)
                        .padding(.trailing ,5)

                }.background(Color(hex: HomeScreen.grayColor))
            }   // end of right arrow

        }
        .clipShape(Capsule())
        .padding(10)
        .frame(width: UIScreen.main.bounds.width)
        //end of naviagtion bar
    }
}

//struct SandwichesNavigationBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SandwichesNavigationBar()
//    }
//}
