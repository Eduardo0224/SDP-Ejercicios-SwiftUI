//
//  MusicApp.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 3/11/25.
//

import SwiftUI

struct MusicApp: View {

    // MARK: - Private Properties

    private let options = ["Explorar", "Música", "Listas"]
    private let durationSeconds: Int = 143

    private var remainingSeconds: Int {
        let seconds = Double(durationSeconds) * (1.0 - songProgress)
        return .init(seconds.rounded())
    }

    private var elapsedSeconds: Int {
        let seconds = Double(durationSeconds) * songProgress
        return .init(seconds.rounded())
    }

    // MARK: - States

    @State private var songProgress: Double = 0.0
    @State private var volume: Double = 0.6

    // MARK: - Properties

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CirclesView()
                GridView()

                HStack(spacing: 15) {
                    Text(timeString(from: elapsedSeconds))
                        .font(.helveticaHeadline)
                        .foregroundStyle(.white.secondary)
                    CustomSlider(currentValue: $songProgress)
                    Text("-\(timeString(from: remainingSeconds))")
                        .font(.helveticaHeadline)
                        .foregroundStyle(.white.secondary)
                }

                HStack {
                    ForEach(options, id: \.self) { option in
                        Button {
                            print("option: \(option) was pressed")
                        } label: {
                            Text(option)
                                .font(.helveticaTitle3)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.top.opacity(0.3))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                    }
                }

                HStack(spacing: 25) {
                    Button {
                        print("rewind button was pressed")
                        songProgress = 0.0
                    } label: {
                        Image(systemName: "arrowtriangle.left")
                            .font(.system(size: 55))
                    }

                    Button {
                        print("play button was pressed")
                    } label: {
                        Image(systemName: "play")
                            .font(.system(size: 80))
                    }

                    Button {
                        print("forward button was pressed")
                        songProgress = 1.0
                    } label: {
                        Image(systemName: "arrowtriangle.right")
                            .font(.system(size: 55))
                    }
                }
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.accent, .bottom.gradient)
                .shadow(color: .top, radius: 1)

                HStack {
                    Image(systemName: "speaker")
                        .symbolVariant(.fill)
                        .foregroundStyle(.top.opacity(0.7))
                    CustomSlider(
                        currentValue: $volume,
                        hasThumb: false,
                        backgroundColor: .top.opacity(0.3),
                        foregroundStyle: .init(.accent)
                    )
                    Image(systemName: "speaker.wave.2")
                        .symbolVariant(.fill)
                        .foregroundStyle(.top.opacity(0.7))
                }

                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 100)
                    .foregroundStyle(.top.opacity(0.3))
                    .overlay {
                        HStack(spacing: 20) {
                            Image(systemName: "speaker.wave.2")
                                .font(.system(size: 35))
                                .symbolVariant(.fill)
                                .foregroundStyle(.accent)

                            Image(systemName: "circle")
                                .font(.system(size: 55))
                                .foregroundStyle(.accent.gradient.opacity(0.6))

                            Image(systemName: "circle.dotted")
                                .font(.system(size: 35))
                                .foregroundStyle(.accent.gradient.opacity(0.8))
                        }
                    }
            }
            .padding(.horizontal, 30)
        }
        .background(
            LinearGradient(
                stops: [
                    .init(color: .top, location: 0.1),
                    .init(color: .bottom, location: 0.35),
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Música")
                    .font(.helveticaTitle)
                    .foregroundColor(.white)
            }
        }
    }

    // MARK: - Private Functions

    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let convertedSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, convertedSeconds)
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        MusicApp()
    }
}
