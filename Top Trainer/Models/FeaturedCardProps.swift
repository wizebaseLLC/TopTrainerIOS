//
//  Trainer.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct FeaturedCardProps: Identifiable {
    let id = UUID()
    let displayName:  String
    let imageUrl: String
    let rating: Double
    var extraDetails: String?
    var trainer: Trainer?
    
    struct Trainer {
        let imageUrl: String
        let name: String
    }
}



let TrainerSampleData: [FeaturedCardProps] = [
    .init(displayName: "Roman Reigns", imageUrl:"https://www.pwmania.com/wp-content/uploads/2022/11/roman-reigns-heyman.jpg", rating: 5),
    .init(displayName: "The Rock", imageUrl:"https://www.muscleandfitness.com/wp-content/uploads/2017/06/The-Rock-Dwayne-Johnson-Cable-Crossover-Promo.jpg?w=1180&quality=86&strip=all", rating: 3.5
         ),
    .init(displayName: "Cardi B", imageUrl:"https://thenewspocket.com/wp-content/uploads/2022/06/cardi-b-1a-1-scaled.webp", rating: 5),
    .init(displayName: "Jade Cargill", imageUrl:"https://www.ewrestlingnews.com/wp-content/uploads/2022/08/jade-cargill-e1660584900991.jpg", rating: 4.2)
]

let MealSampleData: [FeaturedCardProps] = [
    .init(displayName: "Pan Fried Duck Breast", imageUrl:"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gordon-ramsay-duck-breast-pan-fried-duck-breast-1640261637.jpg?crop=0.6665xw:1xh;center,top&resize=480:*", rating: 4.2, extraDetails: "550 \n kCals"),
    .init(displayName: "Pan Seared Steak", imageUrl:"https://chefgordonramsayrecipe.com/wp-content/uploads/2017/05/Gordon-Ramsay-top-5-Steak-Recipes.jpg", rating: 3.5, extraDetails: "880 \n kCals"),
    .init(displayName: "Tasty Salmon", imageUrl:"https://chefgordonramsayrecipe.com/wp-content/uploads/2015/11/salmon1.jpg", rating: 5, extraDetails: "350 \n kCals"),
    .init(displayName: "Crusted Lamb Chops", imageUrl:"https://static1.therecipeimages.com/wordpress/wp-content/uploads/2018/11/gordon2.jpg", rating: 5, extraDetails: "1200 \n kCals"),
    
]

let WorkoutSampleData: [FeaturedCardProps] = [
    .init(displayName: "Biking", imageUrl: "https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_650,q_75,w_1024/v1/clients/virginia/MR18070503V_011_42a9c5b0-6060-4b4c-881b-a833f651924a.jpg", rating: 4.5, extraDetails: "Cardio", trainer: .init(imageUrl: "https://www.ewrestlingnews.com/wp-content/uploads/2022/08/jade-cargill-e1660584900991.jpg", name: "Jade Cargill")),
    .init(displayName: "Barbell Bench Press", imageUrl: "https://www.bodybuilding.com/images/2017/june/how-the-rock-makes-a-275-pound-bench-go-a-long-way-header-v2b-960x540.jpg", rating: 4.5, extraDetails: "Strength", trainer: .init(imageUrl: "https://www.muscleandfitness.com/wp-content/uploads/2017/06/The-Rock-Dwayne-Johnson-Cable-Crossover-Promo.jpg?w=1180&quality=86&strip=all", name: "The Rock")),
    .init(displayName: "Barbell Deadlifts", imageUrl: "https://blogscdn.thehut.net/wp-content/uploads/sites/495/2018/10/25171220/Blog-Deadlifting-Male_1800x672_1200x672_acf_cropped.jpg", rating: 5, extraDetails: "Strength", trainer: .init(imageUrl: "https://thenewspocket.com/wp-content/uploads/2022/06/cardi-b-1a-1-scaled.webp", name: "Cardi B")),
    .init(displayName: "Barbell Squats", imageUrl: "https://i.ytimg.com/vi/KJlISHXK4Ss/maxresdefault.jpg", rating: 5, extraDetails: "Strength", trainer: .init(imageUrl: "https://www.pwmania.com/wp-content/uploads/2022/11/roman-reigns-heyman.jpg", name: "Roman Reigns"))
]
