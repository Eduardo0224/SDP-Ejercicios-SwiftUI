//
//  GridView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 4/11/25.
//

import SwiftUI

struct GridView: View {

    // MARK: - Properties

    var body: some View {
        Grid(horizontalSpacing: 8, verticalSpacing: 8) {
            ForEach(0..<3) { _ in
                GridRow {
                    ForEach(0..<9) { _ in
                        Capsule()
                            .fill(.accent)
                            .opacity(0.3)
                            .frame(width: 30, height: 10)
                    }
                }
            }
        }
    }
}

// MARK: - Previews

#Preview(
    "Grid View",
    traits: .sizeThatFitsLayout
) {
    GridView()
        .padding()
        .background(.bottom)
}
