//
//  NSApperance+Extensions.swift
//  Telex News
//
//  Created by Mike Manzo on 8/24/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa

extension NSAppearance {
    /// Check whether we have a vibrant view (dark or light)
    ///
    /// - Returns: True if we are in Vibrant  Mode (Dark or light)
    ///
    static func isVibrant() -> Bool? {
        var isVibrant = false

        switch NSApp.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua, .vibrantDark, .vibrantLight]) {
        case .vibrantDark?, .vibrantLight?:
            isVibrant = true
        default:
            isVibrant = false
        }

        return isVibrant
    }

    /// Check whether we are in dark mode
    ///
    /// - Returns: True if we are in Dark  Mode
    ///
    static func isDark() -> Bool? {
        var isDark = false

        switch NSApp.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua, .vibrantDark, .vibrantLight]) {
        case .darkAqua?:
            isDark = true
        default:
            isDark = false
        }

        return isDark
    }
}
