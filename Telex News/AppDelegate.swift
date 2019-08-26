//
//  AppDelegate.swift
//  Telex News
//
//  Created by Mike Manzo on 8/24/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import Preferences
import SwiftyBeaver

/// The only globals we're going to use
let log = QuantumLogger.self
/// The only globals we're going to use

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // SwiftyBeaver Config
        let console         = ConsoleDestination()
        console.format      = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
        console.useNSLog    = true
        log.addDestination(console)

        do {
            let dbLog = try SQLDestination(dbName: "telexlog.sqlight")
            log.addDestination(dbLog)
        } catch {
            print("Oops")
        }
        // SwiftyBeaver Config
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
