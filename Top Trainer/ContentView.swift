//
//  ContentView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        BottomTabView()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        // .preferredColorScheme(.dark)
    }
}
