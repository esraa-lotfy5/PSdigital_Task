//
//  HomeScreen.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 23/06/2022.
//

import SwiftUI
import QGrid

struct HomeScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var homeViewModel : HomeViewModel = HomeViewModel()
    static let yellowColor : Int = 0xFEA920
    static let redColor : Int = 0xa70000
    static let whiteColor : Int = 0xFFFFFF
    static let grayColor : Int = 0xF8F8F8
    static let darkGrayColor : Int = 0xF0F0F0

    var body: some View {
            VStack{
            ScrollView(.horizontal){
            HStack {
                ForEach(homeViewModel.categories, id: \.id) { category in
                    CategoryCell(homeViewModel: self.homeViewModel, categoryID: $homeViewModel.categoryID, categoryName: $homeViewModel.categoryName, category: category)
                }
            }}.padding(.leading, 16)
            
            Spacer()
                QGrid(homeViewModel.categoriesItems, columns: 2, hSpacing: 8){ product in
                    CategoryItemsCell(product: product, category: homeViewModel.categoryName)
                }.onChange(of: self.homeViewModel.categoryID) { id in
                    DispatchQueue.main.async {
                        homeViewModel.getCategoryItems()
                    }
                }
                Button {
                        print("Check out tapped")
                    } label: {
                        Text("CHECK OUT")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity)
                            .padding(8)
                    }.background(Color(hex: HomeScreen.yellowColor))
                    .padding(5)
            }.onAppear{
                DispatchQueue.main.async {
                    homeViewModel.getCategories()
                    homeViewModel.getCategoryItems()
                }
            }
    
        // start of navigation bar
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Spacer().frame(width:4)
                                Button {
                                    // fire action when About tapped
                                } label: {
                                    Image(systemName: "chevron.backward")
                                }.foregroundColor(Color(hex:HomeScreen.redColor))
                                Spacer()
                                Text("WRAPS").font(.subheadline)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                                Spacer()
                            Button {
                                // fire action when Help tapped
                            } label: {
                                Image(systemName: "bag.fill")
                                    
                            }.foregroundColor(Color(hex:HomeScreen.redColor))
                                Spacer().frame(width:4)
                        }
                    }
                    }
                    
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

// for hexadecimal colors
extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
