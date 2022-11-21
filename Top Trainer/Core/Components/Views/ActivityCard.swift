//
//  Calories.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/29/22.
//

import SwiftUI
import Charts

enum ActivityCardSizes {
    case small, medium, large
}

enum MetricType {
    case circle, lineChart, water, count, chartView
}
/// Card used to display a high level metric.
struct ActivityCard: View {
    /// Must be from 0.0 - 1.0 if cicle metric type.  This makes the circular progress animation
    let value: CGFloat
    let size: ActivityCardSizes
    let title: String
    let icon: String
    let iconColor: Color
    let metricType: MetricType
    let metricValue: Double
    let previousMetricValue: Double
    let metricDescription: String
    let metricColor: Color
    let backgroundColor: AnyGradient
    let shadowColor: Color
    let onPress: () -> Void
    var lineChartValues: [MetricModel] = .init()
    var titleColor: Color = .primary
    @State private var displayValue: CGFloat = 0;
    @State private var cupsOfWater: Int = 0;
    @State private var lineChartItems: [MetricModel] = []
    
    var body: some View {
        Button { onPress() }
    label: {
        RoundedRectangle(cornerRadius: 36)
            .fill(backgroundColor)
            .overlay(
                VStack {
                    header
                    Spacer()
                    switch metricType {
                    case .water: waterView
                    case .count: countView
                    case .lineChart: lineChartView
                    default: chartView
                    }
                    Spacer()
                }
                    .padding(.top)
            )
            .shadow(color: shadowColor.opacity(0.25), radius: 24, x: 0.0, y: 4.0 )
            .frame(height: getCardHeight())
            .frame(width: 161)
    }
    }
    
    /// The header, which contain
    var header: some View {
        HStack {
            Text(title)
                .foregroundColor(titleColor)
                .padding(.leading)
            Spacer()
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .padding(.trailing)
        }
        .font(.subheadline)
        .fontWeight(.heavy)
    }
    
    /// The main metric data in the center.
    var chartView: some View {
        CircleProgress(progress: displayValue, color: metricColor, lineWidth: 8.0)
            .overlay(
                VStack {
                    RollingNumberView(to: metricValue, from: previousMetricValue)
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .bold()
                    
                    Text(metricDescription)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                    .lineLimit(1)
                    .foregroundColor(titleColor)
            )
            .frame(width: size == .small ? 82 : 100)
            .onAppear {
                displayValue = value
            }
    }
    
    var waterView: some View {
        VStack(spacing: 0) {
            LottieView(lottieFile: "waterFill", shouldPlay: true, shouldLoop: false)
                .clipShape(Circle())
                .frame(width: size == .small ? 60 : 82, height: size == .small ? 60 : 82)
            
            
            HStack(alignment: .firstTextBaseline,spacing: 4) {
                RollingNumberView(to: metricValue, from: previousMetricValue)
                    .font(.title.bold())
                    .foregroundColor(metricColor)
                    .lineLimit(1)
                
                Text("Cups")
                    .font(.footnote.bold())
                    .foregroundColor(metricColor)
            }
            
        }
        
    }
    
    var countView: some View {
        VStack(spacing: 8) {
            RollingNumberView(to: metricValue, from: previousMetricValue)
                .font(.largeTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(metricColor)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .padding(.horizontal)
            
            Text(metricDescription)
                .font(.footnote)
                .foregroundColor(backgroundColor == Color.white.gradient ? .black : .secondary)
        }
        .foregroundColor(titleColor)
    }
    
    var lineChartView: some View {
        VStack(spacing: 0) {
            Chart {
                if metricType == .lineChart {
                    ForEach(lineChartItems) { value in
                        LineMark(
                            x: .value("time", value.type),
                            y: .value("value", value.count)
                        )
                        .interpolationMethod(.catmullRom)
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) { _ in }
            }
            .chartXAxis {
                AxisMarks(position: .bottom) { _ in }
            }
            .chartXScale(range: .plotDimension(startPadding: 8, endPadding: 8))
            .foregroundColor(metricColor)
            
            //          .background(.red)
            .frame(height: 75)
            
            Group {
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    RollingNumberView(to: metricValue, from: previousMetricValue)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(" bpm")
                        .font(.footnote.bold())
                        .foregroundColor(.secondary)
                }
            }
            .font(.title.bold())
            .foregroundColor(.primary)
            .lineLimit(1)
        }
        .onAppear {
            for (i, v) in lineChartValues.enumerated() {
                if lineChartItems.count < TodaysActivityGrid.heartRateCount{
                    withAnimation(.easeInOut(duration: Double(lineChartValues.count - i))) {
                        lineChartItems.insert(v, at: 0)
                    }
                }
            }
        }
    }
    
    /// Gets the height of the card type, based on the size variable.
    func getCardHeight() -> CGFloat {
        switch size {
        case .small:
            return 157
        case .medium:
            return 186
        case .large:
            return 218
        }
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static let heartRateValues = TodaysActivityGrid.getHeartRateValues()
    static var previews: some View {
        ActivityCard(
            value: 1.0,
            size: .large,
            title: "Heart",
            icon: "heart.fill",
            iconColor: .pink,
            metricType: .lineChart,
            metricValue: Double(heartRateValues[heartRateValues.count - 1].count),
            previousMetricValue: 5,
            metricDescription: "45min",
            metricColor: .pink,
            backgroundColor: Color.black.gradient,
            shadowColor: .pink,
            onPress: { print("hi") },
            lineChartValues: heartRateValues.reversed()
        )
    }
}



