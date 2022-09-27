//
//  BottomTabView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            fakeBody
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                }
            
            fakeBody
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("Train")
                }
            
            fakeBody
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Dine")
                }
            
            fakeBody
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
    
    var fakeBody: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Circle().foregroundColor(Color("AccentColor")).blur(radius: 15).shadow(color: Color.red, radius: 15)
                }
                .navigationTitle("Home")
            }
            .frame(maxWidth: .infinity)
            .gradientBackground()
        }
        
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
