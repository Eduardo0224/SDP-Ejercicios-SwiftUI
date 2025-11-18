//
//  HeroDetailView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 16/11/25.
//

import SwiftUI

struct HeroDetailView: View {

    // MARK: - Properties

    let hero: SuperHero

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(hero.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)

                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(hero.apodo)
                            .font(.marvelLargeTitle)
                            .bold()
                            .fontWeight(.black)

                        Text(hero.nombreReal)
                            .font(.marvelTitle3)
                            .foregroundStyle(.secondary)

                        Text("Edad: \(hero.edad)")
                            .font(.marvelSubheadline)
                            .foregroundStyle(.secondary)
                    }

                    if !hero.descripcion.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Descripción")
                                .font(.marvelHeadline)
                                .bold()

                            Text(hero.descripcion)
                                .font(.marvelBody)
                                .foregroundStyle(.secondary)
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Poderes")
                            .font(.marvelHeadline)

                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                ForEach(hero.poderes, id: \.self) { poder in
                                    HStack(spacing: 4) {
                                        Image(systemName: "bolt")
                                            .symbolVariant(.fill)
                                            .foregroundStyle(.yellow)
                                        Text(poder.rawValue)
                                    }
                                    .font(.marvelBody)
                                    .padding(8)
                                    .glassEffect(
                                        .clear.tint(.indigo.opacity(0.1)),
                                        in: .capsule
                                    )
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("Detalles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        HeroDetailView(hero: .test)
    }
}
