//
//  Font+Extensions.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 17/11/25.
//

import SwiftUI

extension Font {

    static let marvelLargeTitle: Font = .custom(
        "Marvel",
        size: 38,
        relativeTo: .largeTitle
    )

    static let marvelTitle: Font = .custom(
        "Marvel",
        size: 32,
        relativeTo: .title
    )

    static let marvelTitle3: Font = .custom(
        "Marvel",
        size: 24,
        relativeTo: .title3
    )

    static let marvelHeadline: Font = .custom(
        "Marvel",
        size: 21,
        relativeTo: .headline
    )

    static let marvelBody: Font = .custom(
        "Marvel-Regular",
        size: 21,
        relativeTo: .body
    )

    static let marvelSubheadline: Font = .custom(
        "Marvel",
        size: 19,
        relativeTo: .subheadline
    )
}

extension String {

    var foldingDiacritics: String {
        folding(
            options: [.diacriticInsensitive, .caseInsensitive],
            locale: .current
        )
    }
}
