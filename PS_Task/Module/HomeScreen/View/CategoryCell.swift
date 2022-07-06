//
//  CategoryCell.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 23/06/2022.
//

import SwiftUI
import Kingfisher

struct CategoryCell: View {
    // category id
    var homeViewModel : HomeViewModel
    @Binding var categoryID : Int
    @Binding var categoryName : String
    var category : CategoryResult
    var body: some View {
        VStack{
            KFImage(URL(string: category.imagePath))
                .resizable()
                .frame(width: 60, height: 60)
                .shadow(color: .gray, radius: 3, x: 0, y: 2)
                .padding(.bottom,-5)
            Text(category.name)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .textCase(.lowercase)
        }.padding(5)
            .onTapGesture {
                homeViewModel.getCategories()
                categoryID = category.id
                categoryName = category.name
            }
    }
}

//struct CategoryCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCell(categoryID: <#Binding<Int>#>, category: dummyCategory[0])
//    }
//}
