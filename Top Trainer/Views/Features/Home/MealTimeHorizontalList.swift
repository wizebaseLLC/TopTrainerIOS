//
//  MealTimeHorizontalList.swift
//  Top Trainer
//
//  Created by Servon Lewis on 11/27/22.
//

import SwiftUI

struct MealTimeItem: Identifiable {
var id = UUID()
    let url: String
    let name: String
}
struct MealTimeHorizontalList: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(mealTimeData) { data in
                    MealTimeCard(imageUrl: data.url, title: data.name, onPress: {})
                        .padding(.trailing)
                        .padding(.top)
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MealTimeHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        MealTimeHorizontalList()
    }
}

let mealTimeData: [MealTimeItem] = [
    .init(url: "https://insanelygoodrecipes.com/wp-content/uploads/2020/12/Chocolate-Chip-Pancakes.png", name: "Breakfast"),
    .init(url: "https://thedinnerdaily.com/wp-content/uploads/2020/10/Lunch-Ideas-Blog-.png", name: "Lunch"),
    .init(url: "https://cdn.vox-cdn.com/thumbor/MLfOfrAI53qPVFyCwu8lnLdsDKc=/0x0:596x398/1200x800/filters:focal(232x174:326x268)/cdn.vox-cdn.com/uploads/chorus_image/image/58856811/Screen_Shot_2018_02_27_at_12.13.27_PM.0.png", name: "Dinner"),
    .init(url: "https://cdn.shopify.com/s/files/1/2590/5380/articles/20200529-BH-ABeginnersGuideToPlantBasedProteinPowder_2048x2048.jpg?v=1664849386", name: "Snacks"),
]

