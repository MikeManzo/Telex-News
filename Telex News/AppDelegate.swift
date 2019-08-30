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
import SwiftyUserDefaults

/// The only global we're going to use
let log = QuantumLogger.self
/// The only global we're going to use

/// User Defaults
extension DefaultsKeys {
    static let telexDefaults  = DefaultsKey<TelexPreferences?>("TelexDefaults")
}
/// User Defaults

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
// MARK: - Custom Properties
    var appDefaults = Defaults[.telexDefaults]

// MARK: - Overrides
    override init() {
        if appDefaults == nil {
            appDefaults = TelexPreferences()
            Defaults[.telexDefaults] = appDefaults
        }
    }

// MARK: Framework Methoda
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        addDabataseLogging()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        updateDefaults()
    }
}

extension AppDelegate {
    /// Save the entire app's configuration to user defaults
    ///
    func updateDefaults() {
        Defaults[.telexDefaults]  = appDefaults
    }
    
    /// Start logging and save to a mysql lite database
    ///
    private func addDabataseLogging() {
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
    
    ///
    /// Get the DB logger (if one exists)
    ///
    /// - Returns: the DBDestination object
    ///
    func getDBLogger() -> SQLDestination? {
        var dbDestination: SQLDestination?
        
        for aDestination in log.destinations {
            switch aDestination {
            case is SQLDestination:
                dbDestination = aDestination as? SQLDestination
            default:
                break
            }
        }
        
        return dbDestination
    }
}
