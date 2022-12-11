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
                    lineChartValues: heartRateValues.reversed(),
                    ruleMarkValue: 80,
                    ruleMarkDescription: "bpm"
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
        .padding(.top)
        .padding(.top)
        .padding(.bottom)
        .padding(.bottom)
    }
    
    // Gets the values of the heart rate.
    // TODO: Will need to use HealthKit to get the actual values.
    static func getHeartRateValues() -> [MetricModel] {
        let today = Date()
        // 2. Pick the date components
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        
        let getHour = {(_ reduceHourBy: Int) in
            "\(hours - reduceHourBy):\(minutes):\(seconds)"
        }
        
        return [
            .init(type: getHour(8), count: 170),
            .init(type: getHour(7), count: 40),
            .init(type: getHour(6), count: 95),
            .init(type: getHour(5), count: 100),
            .init(type: getHour(4), count: 85),
            .init(type: getHour(3), count: 90),
            .init(type: getHour(2), count: 50),
            .init(type: getHour(1), count: 60),
            .init(type: getHour(0), count: 75)
        ]
    }
    
    
}

struct TodaysActivityGrid_Previews: PreviewProvider {
    static var previews: some View {
        TodaysActivityGrid()
    }
}
