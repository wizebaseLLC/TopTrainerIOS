//
//  Calories.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/29/22.
//

import SwiftUI

enum ActivityCardSizes {
    case small, medium, large
}

enum MetricType {
    case circle, chart
}
/// Card used to display a high level metric.
struct ActivityCard: View {
    /// Must be from 0.0 - 1.0 if cicle metric type.
    let value: CGFloat
    let size: ActivityCardSizes
    let title: String
    let icon: String
    let iconColor: Color
    let metricType: MetricType
    let metricValue: String
    let metricDescription: String
    let metricColor: Color
    let backgroundColor: AnyGradient
    let shadowColor: Color
    let onPress: () -> Void
    var titleColor: Color = .primary
    @State private var displayValue: CGFloat = 0;
    
    
    var body: some View {
        Button { onPress() }
    label: {
        RoundedRectangle(cornerRadius: 36)
            .fill(backgroundColor)
            .overlay(
                VStack {
                    header
                    Spacer()
                    chartView
                    Spacer()
                }
                    .padding(.top)
            )
            .shadow(color: shadowColor.opacity(0.5), radius: 24 )
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
                    Text(metricValue)
                        .font(.title2)
                        .bold()
                    Text(metricDescription)
                        .font(.footnote)
                        .opacity(0.6)
                }
                    .foregroundColor(titleColor)
            )
            .shadow(color: metricColor.opacity(0.9) ,radius: 12)
            .frame(width: size == .small ? 82 : 100)
            .onAppear {
                displayValue = value
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
    static var previews: some View {
        ActivityCard(
            value: 0.3,
            size: .small,
            title: "Calories",
            icon: "flame",
            iconColor: .primary,
            metricType: .circle,
            metricValue: "8h",
            metricDescription: "45min",
            metricColor: .yellow,
            backgroundColor: Color.indigo.gradient,
            shadowColor: .indigo,
            onPress: { print("hi") },
            titleColor: .primary
        )
    }
}
