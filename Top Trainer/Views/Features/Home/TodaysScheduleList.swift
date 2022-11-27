//
//  TodaysScheduleList.swift
//  Top Trainer
//
//  Created by Servon Lewis on 11/23/22.
//

import SwiftUI
import CachedAsyncImage

struct TodaysScheduleList: View {
    var body: some View {
        NavigationStack {
            List(workoutListItemSampleData) { item in
                NavigationLink(value: item) {
                    Label {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.name)
                            if item.description != nil {
                                Text(item.description!)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(3)
                            }
                        }
                    } icon: {
                        CachedAsyncImage(url: URL(string: item.imageUrl)) { image in
                            image.resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                }
                
            }
            .scrollContentBackground(.hidden)
            .navigationDestination(for: WorkoutListItem.self) { _ in
                Text("Somewhere else")
                    .lineLimit(1)
            }
        }
    }
}

struct TodaysScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        TodaysScheduleList()
    }
}
