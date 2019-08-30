//
//  TelexPreferences.swift
//  Telex News
//
//  Created by Mike Manzo on 8/26/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import SwiftyUserDefaults

/// Keys for the encoding / decoding
enum CodingKeys: String, CodingKey {
    case launchAtLogin
}

class TelexPreferences: NSObject, Codable, DefaultsSerializable {
// MARK: - Telex Defaults
    var launchAtLogin: Bool = false

    // MARK: - Codable Compliance
    /// Required for an empty object (because we hve defaults above)
    required override init() {
        super.init()
    }
    
    /// Roll our own Decoder
    ///
    /// - Parameter decoder: decoder to act on
    /// - Throws: error
    ///
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        launchAtLogin = try container.decode(Bool.self, forKey: .launchAtLogin)
    }
    
    /// Roll our own Encoder
    ///
    /// - Parameter encoder: encoder to act on
    /// - Throws: error
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(launchAtLogin, forKey: .launchAtLogin)
    }
}

// MARK: - Resets
extension TelexPreferences {
    ///
    /// Reset all of the user defaults
    ///
    func resetAllDefaults() {
        launchAtLogin = false
    }
    
// MARK: - Individual Resets
    func resetLaunchAtLogin() -> Bool {
        launchAtLogin = false
        return launchAtLogin
    }
}
