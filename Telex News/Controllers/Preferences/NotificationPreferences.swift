//
//  NotifcationPreferences.swift
//  Telex News
//
//  Created by Mike Manzo on 8/26/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import Preferences

class NotificationPreferences: NSViewController, PreferencePane {
// MARK: - Protocol Variables
    let preferencePaneIdentifier = PreferencePane.Identifier.notifications
    let toolbarItemIcon = NSImage(named: "Notification.png")!
    let preferencePaneTitle = "Notifications"
    
// MARK: - Overrides
    override var nibName: NSNib.Name? {
        return "NotificationPreferences"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        preferredContentSize = NSSize(width: 480, height: 272)  // [Preferences Known Issue](https://github.com/sindresorhus/Preferences#the-preferences-window-doesnt-show)
    }
}
