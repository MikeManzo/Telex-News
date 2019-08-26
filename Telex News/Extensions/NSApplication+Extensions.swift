//
//  NSApplication+Extensions.swift
//  Telex News
//
//  Created by Mike Manzo on 8/24/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import Foundation

extension NSApplication {
    private var theDelegate: AppDelegate? {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate
    }

    static func isVibrant() -> Bool {
        return NSAppearance.isVibrant() ?? false
    }

    static func isDark() -> Bool {
        return NSAppearance.isDark() ?? false
    }
}
