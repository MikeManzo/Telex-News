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
    /// Get access to the App Delgate - to be used globally
    static var theDelegate: AppDelegate? {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate
    }

    /// Are we in vibrant mode?
    ///
    /// - Returns: True if we are in Vibrant  Mode (Dark or light)
    ///
    static func isVibrant() -> Bool {
        return NSAppearance.isVibrant() ?? false
    }

    /// Are we in Dark Mode
    ///
    /// - Returns: True if we are in Dark Mode
    ///
    static func isDark() -> Bool {
        return NSAppearance.isDark() ?? false
    }
    
    /// Relaunch the app.
    func relaunch() {
        NSWorkspace.shared.launchApplication(
            withBundleIdentifier: Bundle.main.bundleIdentifier!,
            options: .newInstance,
            additionalEventParamDescriptor: nil,
            launchIdentifier: nil
        )

        NSApp.terminate(nil)
    }
}
