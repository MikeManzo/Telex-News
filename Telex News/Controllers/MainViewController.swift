//
//  ViewController.swift
//  Telex News
//
//  Created by Mike Manzo on 8/24/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
// MARK: - UI Properties
    @IBOutlet private var mainMenu: NSMenu!

// MARK: - Custom Properties
    var statusItem = NSStatusItem()

    /// About View
    lazy var aboutController: AboutController = {
        return AboutController(nibName: NSNib.Name("About"), bundle: nil)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        statusItem                  = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.button!.image    = NSImage.smartInvert(asset: "Worldwide.png")?.resized(to: NSSize(width: 19.0, height: 19.0))
        statusItem.button!.target   = self
        statusItem.menu             = mainMenu
    }

// MARK: - Overrides
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

// MARK: - Actions
    @IBAction func aboutTelex(_ sender: NSMenuItem) {
        presentAsModalWindow(aboutController)
    }

    @IBAction func showPreferences(_ sender: NSMenuItem) {

    }

    @IBAction func quitTelex(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
}
