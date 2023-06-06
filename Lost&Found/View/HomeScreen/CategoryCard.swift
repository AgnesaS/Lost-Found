//
//  CategoryCard.swift
//  Lost&Found
//
//  Created by Agnesa  on 29.5.23.
//

import SwiftUI

struct CategoryCard: View {
    var image: String
    var text: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("category-background"))
                .cornerRadius(10)
                .shadow(radius: 2)
            
            VStack(alignment: .center,spacing: 0){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
                
                Text(text)
                    .foregroundColor(Color("category-text"))
                    .font(Font.categoryTitle)
                    .padding(.bottom)
                
            }
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(image: "water", text: "Lost and found")
    }
}
