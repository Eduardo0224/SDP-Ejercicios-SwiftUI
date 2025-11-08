//
//  CustomSlider.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 3/11/25.
//

import SwiftUI

struct CustomSlider: View {

    // MARK: - Private Properties

    private let thumbSize: CGFloat = 28

    // MARK: - Bindings

    @Binding var currentValue: Double

    // MARK: - Properties

    var hasThumb: Bool = true
    var backgroundColor: Color = .gray.opacity(0.3)
    var foregroundStyle: AnyShapeStyle = .init(
        LinearGradient(
            colors: [.leading, .trailing],
            startPoint: .leading,
            endPoint: .trailing
        )
    )

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            ZStack(alignment: .leading) {
                RoundedRectangle(
                    cornerRadius: height / 2,
                    style: .circular
                )
                .fill(backgroundColor)
                .frame(height: 10)

                RoundedRectangle(
                    cornerRadius: height / 2,
                    style: .circular
                )
                .fill(foregroundStyle)
                .frame(
                    width: CGFloat(currentValue) * width,
                    height: 10
                )

                if hasThumb {
                    Circle()
                        .fill(.accent)
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: CGFloat(currentValue) * width - thumbSize / 2)
                        .gesture(
                            DragGesture().onChanged { gesture in
                                let newValue = min(max(0, gesture.location.x / width), 1)
                                currentValue = newValue
                            }
                        )
                }
            }
        }
        .frame(height: hasThumb ? thumbSize : 10)
    }
}

// MARK: - Previews

#Preview(
    traits: .fixedLayout(width: 500, height: 50)
) {
    @Previewable @State var currentValue: Double = 0.5
    CustomSlider(currentValue: $currentValue)
}
