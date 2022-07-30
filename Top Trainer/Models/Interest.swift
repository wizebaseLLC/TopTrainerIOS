//
//  Interest.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/29/22.
//

import SwiftUI

struct Interest: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var emoji: String
    var isSelected: Bool

}

