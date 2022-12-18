//
//  TrainerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 12/11/22.
//

import SwiftUI
import CachedAsyncImage

struct TrainerView: View {
    let id: String
    let imageUrl: String
    let name: String
    var animation: Namespace.ID
    @Binding var selectedItem: FeaturedCardProps?
    @State private var isDisabled = true
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        TrainerHeaderView(id: id, imageUrl: imageUrl, name: name, animation: animation )
                    }
                }
                .background(.black)
                .edgesIgnoringSafeArea(.top)
            }
            HStack {
                Spacer()
                Button {
                    withAnimation(.easeInOut) {
                        selectedItem = nil
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2.bold())
                        .padding(8)
                    
                }
                .disabled(isDisabled)
                .background(.black.opacity(0.7))
                .buttonStyle(.bordered)
                .clipShape(Circle())
                .toolbar(.hidden, for: .tabBar)
                .toolbar(.hidden, for: .navigationBar)
                .opacity(isDisabled ? 0 : 1)
            }
        }
        .task {
            do {
                let duration = UInt64(0.5 * 1_000_000_000)
                try await Task.sleep(nanoseconds: duration)
                await MainActor.run {
                    withAnimation {
                        isDisabled = false
                    }
                }
            }
            catch {
                print(error)
            }
        }
    }
}

struct TrainerView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        TrainerView(id: UUID().uuidString ,imageUrl: TrainerSampleData[0].imageUrl, name: TrainerSampleData[0].displayName, animation: nameSpace, selectedItem: .constant(nil))
    }
}

