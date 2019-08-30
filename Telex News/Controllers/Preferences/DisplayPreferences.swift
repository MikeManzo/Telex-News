//
//  DisplayPreferences.swift
//  Telex News
//
//  Created by Mike Manzo on 8/26/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import Preferences

class DisplayPreferences: NSViewController, PreferencePane {
// MARK: - Protocol Variables
    let preferencePaneIdentifier = PreferencePane.Identifier.display
    let toolbarItemIcon = NSImage(named: NSImage.computerName)!
    let preferencePaneTitle = "Display"

// MARK: - Overrides
    override var nibName: NSNib.Name? {
        return "DisplayPreferences"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = NSSize(width: 480, height: 272)  // [Preferences Known Issue](https://github.com/sindresorhus/Preferences#the-preferences-window-doesnt-show)
    }
}
