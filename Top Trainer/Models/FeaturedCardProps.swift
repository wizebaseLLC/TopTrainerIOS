//
//  Trainer.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct FeaturedCardProps: Identifiable {
    let id = UUID();
    let displayName:  String;
    let imageUrl: String;
    let rating: Float
}

let TrainerSampleData: [FeaturedCardProps] = [
    FeaturedCardProps(displayName: "Roman Reigns", imageUrl:"https://www.pwmania.com/wp-content/uploads/2022/11/roman-reigns-heyman.jpg", rating: 5),
    FeaturedCardProps(displayName: "The Rock", imageUrl:"https://www.muscleandfitness.com/wp-content/uploads/2017/06/The-Rock-Dwayne-Johnson-Cable-Crossover-Promo.jpg?w=1180&quality=86&strip=all", rating: 3.5
                    ),
    FeaturedCardProps(displayName: "Cardi B", imageUrl:"https://thenewspocket.com/wp-content/uploads/2022/06/cardi-b-1a-1-scaled.webp", rating: 5),
    FeaturedCardProps(displayName: "Jade Cargill", imageUrl:"https://www.ewrestlingnews.com/wp-content/uploads/2022/08/jade-cargill-e1660584900991.jpg", rating: 4.2)
]

let MealSampleData: [FeaturedCardProps] = [
    FeaturedCardProps(displayName: "Pan Fried Duck Breast", imageUrl:"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gordon-ramsay-duck-breast-pan-fried-duck-breast-1640261637.jpg?crop=0.6665xw:1xh;center,top&resize=480:*", rating: 4.2),
    FeaturedCardProps(displayName: "Pan Seared Steak", imageUrl:"https://chefgordonramsayrecipe.com/wp-content/uploads/2017/05/Gordon-Ramsay-top-5-Steak-Recipes.jpg", rating: 3.5),
    FeaturedCardProps(displayName: "Tasty Salmon", imageUrl:"https://chefgordonramsayrecipe.com/wp-content/uploads/2015/11/salmon1.jpg", rating: 5),
    FeaturedCardProps(displayName: "Crusted Lamb Chops", imageUrl:"https://static1.therecipeimages.com/wordpress/wp-content/uploads/2018/11/gordon2.jpg", rating: 5),

]
