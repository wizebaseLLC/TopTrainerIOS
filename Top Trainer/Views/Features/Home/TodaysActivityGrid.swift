//
//  TodaysActivityGrid.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/29/22.
//

import SwiftUI

struct TodaysActivityGrid: View {
    
    @State private var showingBottomSheet = false
    
    let heartRateValues: [MetricModel] = getHeartRateValues()
    static let heartRateCount: Int = getHeartRateValues().count
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 16)  {
                ActivityCard(
                    value: 0.3,
                    size: .small,
                    title: "Training",
                    icon: "figure.cross.training",
                    iconColor: .primary,
                    metricType: .count,
                    metricValue: 12,
                    previousMetricValue: 6,
                    metricDescription: "Working Sets",
                    metricColor: Color("AccentColor"),
                    backgroundColor: Color.black.gradient,
                    shadowColor: Color("AccentColor"),
                    onPress: { showingBottomSheet = true }
                )
                
                ActivityCard(
                    value: 0.8,
                    size: .large,
                    title: "Calories",
                    icon: "fork.knife",
                    iconColor: .primary,
                    metricType: .circle,
                    metricValue: 500,
                    previousMetricValue: 6,
                    metricDescription: "kCals",
                    metricColor: Color("Secondary"),
                    backgroundColor: Color.black.gradient,
                    shadowColor: Color("Secondary"),
                    onPress: { showingBottomSheet = true  }
                )
                
                ActivityCard(
                    value: 0.8,
                    size: .medium,
                    title: "Walk",
                    icon: "figure.walk",
                    iconColor: .black,
                    metricType: .count,
                    metricValue: 500,
                    previousMetricValue: 16,
                    metricDescription: "Steps",
                    metricColor: .blue,
                    backgroundColor: Color.white.gradient,
                    shadowColor: .blue,
                    onPress: { showingBottomSheet = true  },
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
                    metricValue: Double(heartRateValues[heartRateValues.count - 1].count),
                    previousMetricValue: 6,
                    metricDescription: "45min",
                    metricColor: .pink,
                    backgroundColor: Color.black.gradient,
                    shadowColor: .pink,
                    onPress: { showingBottomSheet = true },
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
                    metricValue: 8,
                    previousMetricValue: 3,
                    metricDescription: "45min",
                    metricColor: .white,
                    backgroundColor: Color.blue.gradient,
                    shadowColor: .blue,
                    onPress: { showingBottomSheet = true }
                )
                
                ActivityCard(
                    value: 1.0,
                    size: .small,
                    title: "Sleep",
                    icon: "moon.stars.fill",
                    iconColor: .purple,
                    metricType: .circle,
                    metricValue: 8,
                    previousMetricValue: 6,
                    metricDescription: "Hours",
                    metricColor: .purple,
                    backgroundColor: Color.black.gradient,
                    shadowColor: .purple,
                    onPress: { showingBottomSheet = true }
                )
            }
        }
        .sheet(isPresented: $showingBottomSheet) {
            Text("This app was brought to you by Hacking with Swift")
                .presentationDetents([.large, .medium])
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
        let sixHourAgo  = "\(hours - 6):\(minutes):\(seconds)"
        let sevenHourAgo  = "\(hours - 7):\(minutes):\(seconds)"
        let eightHourAgo  = "\(hours - 8):\(minutes):\(seconds)"
        
        return [
            .init(type: eightHourAgo, count: 200),
            .init(type: sevenHourAgo, count: 75),
            .init(type: sixHourAgo, count: 135),
            .init(type: fiveHourAgo, count: 140),
            .init(type: fourHourAgo, count: 40),
            .init(type: threehourAgo, count: 90),
            .init(type: twohourAgo, count: 170),
            .init(type: hourAgo, count: 120),
            .init(type: currentTime, count: 150)
        ]
    }
}

struct TodaysActivityGrid_Previews: PreviewProvider {
    static var previews: some View {
        TodaysActivityGrid()
    }
}
