//
//  GeneralPreferences.swift
//  Telex News
//
//  Created by Mike Manzo on 8/26/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import Preferences

class GeneralPreferences: NSViewController, PreferencePane {
// MARK: - Protocol Variables
    let preferencePaneIdentifier = PreferencePane.Identifier.general
    let toolbarItemIcon = NSImage(named: NSImage.preferencesGeneralName)!
    let preferencePaneTitle = "General"

// MARK: - Overrides
    override var nibName: NSNib.Name? {
        return "GeneralPreferences"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = NSSize(width: 480, height: 272)  // [Preferences Known Issue](https://github.com/sindresorhus/Preferences#the-preferences-window-doesnt-show)
    }
}
