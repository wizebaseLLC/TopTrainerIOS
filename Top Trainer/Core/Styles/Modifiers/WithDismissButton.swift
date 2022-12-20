//
//  WithDismissButton.swift
//  Top Trainer
//
//  Created by Servon Lewis on 12/18/22.
//

import SwiftUI

extension View {
    func withDimissButton(onPressDismiss: @escaping () -> ()) -> some View {
        ZStack(alignment: .top) {
            self
            HStack {
                Spacer()
                Button {
                    onPressDismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2.bold())
                        .padding(8)
                    
                }
                .background(.black.opacity(0.7))
                .buttonStyle(.bordered)
                .clipShape(Circle())
            }
        }
    }
}
