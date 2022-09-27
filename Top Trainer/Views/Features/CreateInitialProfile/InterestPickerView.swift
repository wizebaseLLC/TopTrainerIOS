//
//  InterestPicker.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/29/22.
//

import SwiftUI

struct InterestPickerView: View {
    @State private var appear = [false,false]
    @Binding var interests: [Interest]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                Text("Time to customize your interests!")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .offset(y: appear[0] ? 0 : -120)
                    .opacity(appear[0] ? 1 : 0)
                    .padding(.bottom)
                
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach($interests){ $interest in
                        InterestsItem($interest).padding()
                    }
                }
            }
            .onAppear {
                withAnimation(.easeOut.delay(0.3)) {
                    appear[0] = true
                }
                withAnimation(.easeOut.delay(0.4)) {
                    appear[1] = true
                }
            }
            .onDisappear {
                appear[0] = false
                appear[1] = false
            }
            .padding(.top, 24)
        }
    }
    
    @ViewBuilder func InterestsItem(_ interest: Binding<Interest>) -> some View {
        Button {
            withAnimation(.spring()) {
                interest.isSelected.wrappedValue.toggle()
            }
        }
    label: {
        VStack(spacing: 16) {
            Text(interest.emoji.wrappedValue)
                .font(.system(size: 42))
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: interest.isSelected.wrappedValue ? 0 : 6)
                        .frame(width: 75, height: 75)
                        .foregroundColor(.purple.opacity(0.5))
                        .background(
                            interest.isSelected.wrappedValue ? Color("Secondary") : .clear)
                        .cornerRadius(30)
                        .shadow(color: Color("Secondary"), radius: 10)
                    
                )
            Text(interest.name.wrappedValue)
                .font(.callout)
                .foregroundColor(.secondary)
            
        }
        .padding(4)
        .offset(y: !interest.isSelected.wrappedValue ? 0: -2)
        
    }
    }
}

struct InterestPickerView_Previews: PreviewProvider {
    static var previews: some View {
        InterestPickerView(interests: .constant(
            [
                Interest(name:"Nutrition", emoji:"🍓", isSelected: false),
                Interest(name:"Meditation", emoji:"🧘🏾‍♀️", isSelected: false),
                Interest(name:"Sports", emoji:"🏈", isSelected: false),
                Interest(name:"Sleep", emoji:"💤", isSelected: false),
                Interest(name:"Health", emoji:"👨🏾‍⚕️", isSelected: false),
                Interest(name:"Running", emoji:"🏃🏾‍♂️", isSelected: false),
                Interest(name:"Vegan", emoji:"🥑", isSelected: false),
                Interest(name:"Strongman", emoji:"🏋🏾‍♂️", isSelected: false),
                Interest(name:"Powerlifting", emoji:"🦾", isSelected: false),
                Interest(name:"BodyBuilding", emoji:"💪🏾", isSelected: false),
                Interest(name:"WeightLifting", emoji:"🥇", isSelected: false),
                Interest(name:"Weight Loss", emoji:"🥗", isSelected: false),
            ]
        )).preferredColorScheme(.light)
    }
}
