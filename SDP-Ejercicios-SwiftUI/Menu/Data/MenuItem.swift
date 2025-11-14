//
//  MenuItem.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 14/11/25.
//

import Foundation

struct MenuItem: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let destination: MenuDestination
}

enum MenuDestination: Hashable {
    case music
    case weather
    case heroes
}
