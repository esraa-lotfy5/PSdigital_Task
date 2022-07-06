//
//  ProductDetails.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 04/07/2022.
//

import SwiftUI
import Kingfisher

struct ProductDetails: View {
    var productID : Int     // combo id to get combo details from API
    var productCategory : String    // to set it in naviagtion bar
    let productDetailsViewModel = ProductDetailsViewModel() // to use it for calling the PAI
    @State var isShowingDetailView = false
    @State private var showingAlert = false // alert for error while getting product details
    
    //  for meal sizes
    @State var isRegularSelected : Bool = false
    @State var isMediumSelected : Bool = false
    @State var isLargeSelected : Bool = false
    
    //  for sandiches
    @State var isFirstSelected : Bool = false
    @State var isSecondSelected : Bool = false
    @State var isThirdSelected : Bool = false
    
    //  for Sides
    @State var selectedSideID  : Int = -1
    
    //  for Drinks
    @State var selectedDrinkID  : Int = -1

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            ScrollView{
            VStack{ // start of container of Whole view
                
                //  Display product Info (image and name)
                ProductInfo(comboProduct: productDetailsViewModel.comboItem ?? ComboResults())
                            
                Spacer().frame(maxWidth:.infinity, maxHeight: 16)
                    .background(Color(hex: HomeScreen.grayColor))
                
                //  Display Meal sizes
                MealSizes(comboProduct: productDetailsViewModel.comboItem, isRegularSelected: $isRegularSelected, isMediumSelected: $isMediumSelected, isLargeSelected: $isLargeSelected)
                
                Spacer().frame(maxWidth:.infinity, maxHeight: 16)
                    .background(Color(hex: HomeScreen.grayColor))
            
                if(productDetailsViewModel.comboItem?.chickenPieces.count != 0){
                    if(isLargeSelected || isMediumSelected || isRegularSelected){
                        VStack(alignment : .leading){ //Chicken selection
                            Text("Chicken Selection")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .padding(.top, 8)
                                .padding(.leading, 16)

                            Text("Meals come with \(String(productDetailsViewModel.comboItem?.sizes[0].chickenPiecesQuantityDefault ?? -1)) Pcs")
                                .font(.system(size: 15))
                                .foregroundColor(Color(hex:HomeScreen.redColor))
                                .padding(.leading, 16)
                                .padding(.bottom, 8)

                            if(isRegularSelected){
                                ChickenSelection(typeText: "Thigh", imagePath: productDetailsViewModel.comboItem?.chickenPieces[0].imagePath ?? "")

                                Spacer().frame(height: 16)

                                ChickenSelection(typeText: "Breast", imagePath: productDetailsViewModel.comboItem?.chickenPieces[0].imagePath ?? "")
                                    .padding(.bottom, 10)

                            }else{
                                if(isMediumSelected){
                                    ChickenSelection(typeText: "Thigh", imagePath: productDetailsViewModel.comboItem?.chickenPieces[1].imagePath ?? "")

                                    Spacer().frame(height: 20)

                                    ChickenSelection(typeText: "Breast", imagePath: productDetailsViewModel.comboItem?.chickenPieces[0].imagePath ?? "")
                                        .padding(.bottom, 10)

                                }else{
                                    if(isLargeSelected){
                                        ChickenSelection(typeText: "Thigh", imagePath: productDetailsViewModel.comboItem?.chickenPieces[2].imagePath ?? "")

                                        Spacer().frame(height: 16)

                                        ChickenSelection(typeText: "Breast", imagePath: productDetailsViewModel.comboItem?.chickenPieces[0].imagePath ?? "")
                                            .padding(.bottom, 10)

                                    }
                                }
                            }   //end of conditions

                        }   // end of VStack container of chicken selections
                    }   // end of condition (if user select specific meal size)
                }   //  end of checking condition (if product has chicken pieces as option)
                
                if(productDetailsViewModel.comboItem?.sandwiches.count != 0){

                    //   Start of sandwiches section
                    Sandwiches(comboProduct: productDetailsViewModel.comboItem, isFirstSelected: $isFirstSelected, isSecondSelected: $isSecondSelected, isThirdSelected: $isThirdSelected)

                      
                    if(isFirstSelected || isSecondSelected || isThirdSelected){
                        VStack(alignment: .leading){ //  start of ingredients
                            Text("Ingredians for sandwich one")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .padding(.top, 8)
                                .padding(.leading, 16)
                                .frame(maxWidth: .infinity)
                            
                            if(isFirstSelected){
                                IngrediansCell(typeText: "Thigh", ingredians: productDetailsViewModel.comboItem?.sandwiches[0].ingredients ?? [])
                            }else{
                                if(isSecondSelected){
                                    IngrediansCell(typeText: "Thigh", ingredians: productDetailsViewModel.comboItem?.sandwiches[1].ingredients ?? [])
                                }else{
                                    if(isThirdSelected){
                                        IngrediansCell(typeText: "Thigh", ingredians: productDetailsViewModel.comboItem?.sandwiches[2].ingredients ?? [])
                                    }
                                }
                            }
                            
                            SandwichesNavigationBar(isFirstSelected: self.$isFirstSelected, isSecondSelected: self.$isSecondSelected, isThirdSelected: self.$isThirdSelected)
                              
                            
                        }   //  end of ingredients
                    }   // end of cheching if any sandwich selected
                }   // end of if condition to check if product have sandwiches
                
                Spacer().frame(maxWidth:.infinity, maxHeight: 16)
                    .background(Color(hex: HomeScreen.grayColor))
                
                
                //  Sauces section
                Sauces(typeText: "Thigh", comboItem: productDetailsViewModel.comboItem ?? ComboResults())
                
                
                

                
                //  sides section
                Sides(id: $selectedSideID, typeText: "Thigh", ComboItem: productDetailsViewModel.comboItem ?? ComboResults())


                //  Drinks section
                Drinks(drinkId: self.$selectedDrinkID, drinkTypeText: "Thigh", comboItem: productDetailsViewModel.comboItem ?? ComboResults())
                    
                
                } // end of VStack Container of the whole
                .onAppear{     // start of onAppear of the view
                    productDetailsViewModel.getProduct(productID: productID)
            }   // end of onAppear of the view
        }   // end of scroll view
            Button {
                    print("Add to cart tapped")
                } label: {
                    Text("ADD TO CART")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity)
                        .padding(8)
                }.background(Color(hex: HomeScreen.yellowColor))
                .padding(5)
        }
                
        // start of navigation bar
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Spacer().frame(width:4)
                                
                                //   start of back button
                                Button {
                                    // fire action when back tapped
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "chevron.backward")
                                }.foregroundColor(Color(hex:HomeScreen.redColor))
                                //  end of back button
                                
                                Spacer()
                                
                                //  navigation bar title
                                Text(productCategory).font(.subheadline)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                //  Start of reset button
                            Button {
                                // fire action when Reset tapped
                                isRegularSelected = false
                                isMediumSelected = false
                                isLargeSelected = false
                            } label: {
                                Text("Reset")
                                    .fontWeight(.light)
                                    .font(.system(size: 15))
                                    .padding(.trailing)
                                    .padding(.leading)
                                    .padding(.top, 5)
                                    .padding(.bottom,5)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(hex: HomeScreen.redColor), lineWidth: 1)
                                    )
                                    .foregroundColor(Color(hex: HomeScreen.redColor))
                                    .shadow(color: .gray ,radius: 3 ,y:0)
                            }.foregroundColor(Color(hex:HomeScreen.redColor))
                                Spacer().frame(width:4)
                                // end of reset button
                        }   // end of HStack of navigation bar
                        }    // end of tool bar item
                    }.navigationBarBackButtonHidden(true)   // end of tool bar
        //  end of naviagtion bar
    }   // end of view
}   // end of struct

//struct ProductDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetails(productID: <#T##Int#>)
//    }
//}
