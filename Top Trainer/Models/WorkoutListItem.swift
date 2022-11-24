//
//  WorkoutListItem.swift
//  Top Trainer
//
//  Created by Servon Lewis on 11/23/22.
//

import Foundation

struct WorkoutListItem: Identifiable {
    var id = UUID()
    let name: String
    let imageUrl: String
    var description: String?
}

let workoutListItemSampleData: [WorkoutListItem] = [
    .init(name: "Barbell Squats", imageUrl: "https://images.livemint.com/img/2021/07/14/1140x641/iStock-1061852042_1626264735193_1626264750658.jpg", description: "3x5"),
    .init(name: "Incline BenchPress", imageUrl: "https://bodybuilding-wizard.com/wp-content/uploads/2014/04/barbell-incline-press-exercise-3-7-1.jpg", description: "3x5"),
    .init(name: "DeadLifts", imageUrl: "https://cdn.shopify.com/s/files/1/1876/4703/articles/shutterstock_686826679_1000x.jpg?v=1641549264", description: "3x5"),
    .init(name: "Cable Crunches", imageUrl: "https://i.ytimg.com/vi/7TK6JgW7v7g/maxresdefault.jpg"),
    .init(name: "Barbell Squats", imageUrl: "https://images.livemint.com/img/2021/07/14/1140x641/iStock-1061852042_1626264735193_1626264750658.jpg", description: "3x5")
    
]
