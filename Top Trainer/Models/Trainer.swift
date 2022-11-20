//
//  Trainer.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct Trainer: Identifiable {
    let id = UUID();
    let firstName: String;
    let lastName:  String;
    let displayName:  String;
    let imageUrl: String;
    let title:  String;
    let rating: Float
}

let TrainerSampleData: [Trainer] = [
    Trainer(
        firstName: "Roman", lastName: "Reigns",displayName: "Roman Reigns", imageUrl:"https://www.pwmania.com/wp-content/uploads/2022/11/roman-reigns-heyman.jpg",title: "Head of the table",rating: 5
    ),
    Trainer(
        firstName: "Dwayne", lastName: "Johnson",displayName: "The Rock", imageUrl:"https://www.muscleandfitness.com/wp-content/uploads/2017/06/The-Rock-Dwayne-Johnson-Cable-Crossover-Promo.jpg?w=1180&quality=86&strip=all",title: "Black Atom",rating: 3.5
    ),
    Trainer(
        firstName: "Cardi", lastName: "B",displayName: "Cardi B", imageUrl:"https://thenewspocket.com/wp-content/uploads/2022/06/cardi-b-1a-1-scaled.webp",title: "Artist",rating: 5
    ),
    Trainer(
        firstName: "Jade", lastName: "Cargill",displayName: "Jade Cargill", imageUrl:"https://www.ewrestlingnews.com/wp-content/uploads/2022/08/jade-cargill-e1660584900991.jpg",title: "AEW TBS Champion",rating: 4.2
    )
]
