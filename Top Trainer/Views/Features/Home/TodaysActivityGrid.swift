//
//  TodaysActivityGrid.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/29/22.
//

import SwiftUI

struct TodaysActivityGrid: View {
    
    let heartRateValues: [MetricModel] = getHeartRateValues()
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            HStack(spacing: 16) {
                VStack(spacing: 16)  {
                    ActivityCard(
                        value: 0.3,
                        size: .small,
                        title: "Training",
                        icon: "figure.cross.training",
                        iconColor: .primary,
                        metricType: .count,
                        metricValue: "12",
                        metricDescription: "Working Sets",
                        metricColor: Color("AccentColor"),
                        backgroundColor: Color.black.gradient,
                        shadowColor: Color("AccentColor"),
                        onPress: { print("hi") }
                    )
                    
                    ActivityCard(
                        value: 0.8,
                        size: .large,
                        title: "Calories",
                        icon: "fork.knife",
                        iconColor: .primary,
                        metricType: .circle,
                        metricValue: "500",
                        metricDescription: "kCals",
                        metricColor: Color("Secondary"),
                        backgroundColor: Color.black.gradient,
                        shadowColor: Color("Secondary"),
                        onPress: { print("hi") }
                    )
                    
                    ActivityCard(
                        value: 0.8,
                        size: .medium,
                        title: "Walk",
                        icon: "figure.walk",
                        iconColor: .black,
                        metricType: .count,
                        metricValue: "500",
                        metricDescription: "Steps",
                        metricColor: .blue,
                        backgroundColor: Color.white.gradient,
                        shadowColor: .blue,
                        onPress: { print("hi") },
                        titleColor: .black
                    )
                }
                
                VStack(spacing: 16)  {
                    ActivityCard(
                        value: 1.0,
                        size: .large,
                        title: "Heart",
                        icon: "heart.fill",
                        iconColor: .pink,
                        metricType: .lineChart,
                        metricValue: "\(Int(heartRateValues[heartRateValues.count - 1].count))",
                        metricDescription: "45min",
                        metricColor: .pink,
                        backgroundColor: Color.black.gradient,
                        shadowColor: .pink,
                        onPress: { print("hi") },
                        // Reversed so that the animation can start from the left.
                        lineChartValues: heartRateValues.reversed()
                    )
                    
                    ActivityCard(
                        value: 0.5,
                        size: .medium,
                        title: "Water",
                        icon: "drop.fill",
                        iconColor: .primary,
                        metricType: .water,
                        metricValue: "8h",
                        metricDescription: "45min",
                        metricColor: .white,
                        backgroundColor: Color.blue.gradient,
                        shadowColor: .blue,
                        onPress: { print("hi") }
                    )
                    
                    ActivityCard(
                        value: 1.0,
                        size: .small,
                        title: "Sleep",
                        icon: "moon.stars.fill",
                        iconColor: .purple,
                        metricType: .circle,
                        metricValue: "8h",
                        metricDescription: "45min",
                        metricColor: .purple,
                        backgroundColor: Color.black.gradient,
                        shadowColor: .purple,
                        onPress: { print("hi") }
                    )
                }
            }
        }
    }
    
    // Gets the values of the heart rate.
    // TODO: Will need to use HealthKit to get the actual values.
    static func getHeartRateValues() -> [MetricModel] {
        let today = Date()
        // 2. Pick the date components
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        // 3. Show the time
        let currentTime  = "\(hours):\(minutes):\(seconds)"
        let hourAgo  = "\(hours - 1):\(minutes):\(seconds)"
        let twohourAgo  = "\(hours - 2):\(minutes):\(seconds)"
        let threehourAgo  = "\(hours - 3):\(minutes):\(seconds)"
        let fourHourAgo  = "\(hours - 4):\(minutes):\(seconds)"
        let fiveHourAgo  = "\(hours - 5):\(minutes):\(seconds)"
        
        return [
            .init(type: fiveHourAgo, count: 140),
            .init(type: fourHourAgo, count: 40),
            .init(type: threehourAgo, count: 90),
            .init(type: twohourAgo, count: 170),
            .init(type: hourAgo, count: 120),
            .init(type: currentTime, count: 55)
        ]
    }
}

struct TodaysActivityGrid_Previews: PreviewProvider {
    static var previews: some View {
        TodaysActivityGrid()
    }
}
