//
//  CategoryItemsCell.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 23/06/2022.
//

import SwiftUI
import Kingfisher

struct CategoryItemsCell: View {
    
    // Fav icon
    @State var favIcon : String
    @State var isFav : Bool
    @State var sandwichRadioButton : String
    @State var MealRadioButton : String
    var productCategory : String
    @State private var showingAlert = false // alert for uncustomized items
    @State private var isShowingDetailView = false  // to naviagte to item details
    //  product
    var product : CategoryItemResult
    
    init(product: CategoryItemResult, category : String){
        self.product = product
        self.productCategory = category
        // Fav button
        if(product.isFavorite){
            isFav = true
            favIcon = "star.fill"
        }else{
            isFav = false
            favIcon = "star"
        }
        
        //  product can be sandwich / wrap
        if(product.isOnlyACombo){
            sandwichRadioButton = "circle"
        }else{
            sandwichRadioButton = "circle.fill"
        }
        
        //  product can be combo
        if(product.haveACombo){
            MealRadioButton = "circle.fill"
        }else{
            MealRadioButton = "circle"
        }
    }
    
    var body: some View {
        ZStack {
            // to create card
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .shadow(radius: 3, y:3)

            VStack{
                HStack{ //Fav icon
                    Spacer()
                    Image(systemName: favIcon)
                        .resizable()
                        .foregroundColor(Color(hex:HomeScreen.redColor))
                        .frame(width:20, height:20)
                        .padding(.top, 4)
                        .onTapGesture {
                            if(isFav){
                                isFav = false
                                favIcon = "star"
                            }else{
                                isFav = true
                                favIcon = "star.fill"
                            }
                        }
                    Spacer().frame(width:4)
                }.padding(5)
                Spacer().frame(height:3)
                VStack{
                    KFImage(URL(string: product.imagePath))
                        .resizable()
                        .frame(width:120 , height: 120)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                        .padding(.top, -40)
                    Text(product.name)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .textCase(.uppercase)
                        .fixedSize(horizontal: false, vertical: true) // for text to breakline
                        .multilineTextAlignment(.center)
                        .padding(.top, -5)

                    if(product.calories.rawValue.trimmingCharacters(in: .whitespaces) == "-" || product.calories.rawValue.trimmingCharacters(in: .whitespaces) == ""){
                        Text("200 CAL")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.bottom, 3)
                    }else{
                        Text("\(product.calories.rawValue) CAL")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                    //  ingredients
                    Text(product.resultDescription.replacingOccurrences(of: ",", with: "+"))
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .textCase(.lowercase)
                        .padding(.top, -10)
                    
                    // radio button (sandwich/ wrap)
                    HStack{
                        Spacer().frame(width:2)
                        VStack{
                            Spacer()
                            Image(systemName: sandwichRadioButton)
                                .foregroundColor(Color(hex:HomeScreen.redColor))
                                .padding(.bottom, 3)
                                .onAppear{
                                   if(!product.isOnlyACombo){
                                       sandwichRadioButton = "circle.fill"
                                   }
                                }
                            Text("Sandwich")
                                .font(.system(size: 15))
                        }.padding(.trailing , 8)
                            
                        
                        VStack{
                            Spacer()
                            Image(systemName: MealRadioButton)
                                .foregroundColor(Color(hex:HomeScreen.redColor))
                                .padding(.bottom, 3)
                                .onAppear{
                                   if(product.haveACombo){
                                       MealRadioButton = "circle.fill"
                                   }
                                }
                            Text("Meal")
                                .font(.system(size: 15))
                        }
                    }
                    
                    Spacer().frame(height:4)
                    
                    //  Default price
                    
                    Text("\(String(product.defaultPrice)) BD")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex:HomeScreen.redColor))
                    
                    //  Customize & Add Buttons
                    HStack{
                        Spacer().frame(width:2)
                        NavigationLink(destination: ProductDetails(productID: product.comboID ?? -1, productCategory: productCategory), isActive: $isShowingDetailView) { EmptyView() }
                        Button {
                            if(product.isCustomizeable){
                                showingAlert = false
                                isShowingDetailView = true
                            }else{
                                showingAlert = true
                            }
                        } label: {
                            Text("Customize")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        } .padding(.top,10)
                            .padding(.bottom,10)
                            .padding(.leading,2)
                            .padding(.trailing,2)
                            .background(Color(hex:HomeScreen.yellowColor))
                            .cornerRadius(5)
                            .alert("this product can't be customized", isPresented: $showingAlert) {
                                        Button("OK", role: .cancel) { }
                                    }
                        Spacer().frame(width:10)
                        Button {
                            print("Add selected")
                        } label: {
                            Text("+Add")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        } .padding(10)
                            .background(Color(hex:HomeScreen.redColor))
                            .cornerRadius(5)
                        Spacer().frame(width:2)
                    }
                    Spacer().frame(height:2)
                }.padding(5)
                    .padding(.bottom, 5)
            }
        }
        .frame(width:( UIScreen.main.bounds.width/2)-25, height : (UIScreen.main.bounds.height/2.3))
            .padding(.top ,10)
            
    }
}

//struct CategoryItemsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryItemsCell(product: dummyCategoryItem[0])
//    }
//}


struct OrderOption : Identifiable{
    var id: UUID = UUID()
    let name : String
}
