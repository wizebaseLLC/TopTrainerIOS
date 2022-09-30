//
//  TodaysActivityGrid.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/29/22.
//

import SwiftUI

struct TodaysActivityGrid: View {
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRow {
                ActivityCard(
                    value: 0.3,
                    size: .medium,
                    title: "Training",
                    icon: "figure.cross.training",
                    iconColor: .primary,
                    metricType: .circle,
                    metricValue: "8h",
                    metricDescription: "45min",
                    metricColor: .pink,
                    backgroundColor: Color.black.gradient,
                    shadowColor: .black,
                    onPress: { print("hi") }
                )
                
                ActivityCard(
                    value: 0.5,
                    size: .small,
                    title: "Water",
                    icon: "drop.fill",
                    iconColor: .primary,
                    metricType: .circle,
                    metricValue: "8h",
                    metricDescription: "45min",
                    metricColor: .green,
                    backgroundColor: Color.blue.gradient,
                    shadowColor: .blue,
                    onPress: { print("hi") }
                )
            }
            
            GridRow {
                ActivityCard(
                    value: 0.8,
                    size: .large,
                    title: "Calories",
                    icon: "flame",
                    iconColor: .black,
                    metricType: .circle,
                    metricValue: "500",
                    metricDescription: "kCals",
                    metricColor: .blue,
                    backgroundColor: Color.white.gradient,
                    shadowColor: .white,
                    onPress: { print("hi") },
                    titleColor: .black
                )
                
                ActivityCard(
                    value: 1.0,
                    size: .medium,
                    title: "Cardio",
                    icon: "figure.outdoor.cycle",
                    iconColor: .primary,
                    metricType: .circle,
                    metricValue: "8h",
                    metricDescription: "45min",
                    metricColor: .yellow,
                    backgroundColor: Color.indigo.gradient,
                    shadowColor: .indigo,
                    onPress: { print("hi") })
            }
        }
    }
}

struct TodaysActivityGrid_Previews: PreviewProvider {
    static var previews: some View {
        TodaysActivityGrid()
    }
}
