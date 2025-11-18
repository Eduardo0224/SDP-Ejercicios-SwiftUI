//
//  HeroCardView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 16/11/25.
//

import SwiftUI

struct HeroCardView: View {

    // MARK: - Properties

    let hero: SuperHero

    // MARK: - Body

    var body: some View {
        VStack(spacing: 8) {
            Image(hero.imagen)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 12,
                        topTrailingRadius: 12
                    )
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(hero.apodo.uppercased())
                    .font(.marvelTitle)
                    .bold()
                    .fontWeight(.black)
                    .lineLimit(1)

                Text(hero.nombreReal)
                    .font(.marvelSubheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.bottom, 12)
        }
        .glassEffect(
            .clear.tint(.indigo.opacity(0.1)),
            in: .rect(cornerRadius: 12)
        )
        .shadow(color: .indigo.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Previews

#Preview(
    "Hero Card View",
    traits: .sizeThatFitsLayout
) {
    HeroCardView(hero: .test)
        .frame(width: 170)
        .padding()
}
