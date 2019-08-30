//
//  AboutController.swift
//  MeteoBar
//
//  Created by Mike Manzo on 1/13/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa

/// Controller for the "About Box"
class AboutController: NSViewController {

    /// Outlets
    @IBOutlet private weak var tableAttribution: NSTableView!
    @IBOutlet private weak var appName: NSTextField!
    @IBOutlet private weak var appCopyright: NSTextField!
    @IBOutlet private weak var appVersion: NSTextField!
    @IBOutlet private weak var appImageView: NSImageView!
    @IBOutlet private weak var copyright: NSTextField!

    /// Custom variables
    let tableViewData = [
        ["copyrightName": "Delivery Package free icon",
         "copyrightType": "Swift Package",
         "copyrightImage": "swift package.png",
         "copyrightHolder": "FreePick",
         "copyrightURL": "https://www.flaticon.com/free-icon/delivery-package_45936#term=package&page=1&position=72",
         "isInvertable": "yes",
        ],
        ["copyrightName": "Console Log Icon",
         "copyrightType": "Icon",
         "copyrightImage": "console.png",
         "copyrightHolder": "Kiranshastry",
         "copyrightURL": "https://www.flaticon.com/authors/kiranshastry/",
         "isInvertable": "no",
        ],
        ["copyrightName": "Global Service free icon",
         "copyrightType": "Icon",
         "copyrightImage": "Worldwide.png",
         "copyrightHolder": "FreePick",
         "copyrightURL": "https://www.flaticon.com/free-icon/global-service_74524#term=Global&page=3&position=30",
         "isInvertable": "yes",
        ],
        ["copyrightName": "Notifcation free icon",
         "copyrightType": "Icon",
         "copyrightImage": "Notification.png",
         "copyrightHolder": "Smashicons",
         "copyrightURL": "https://www.flaticon.com/free-icon/notification_660664",
         "isInvertable": "no",
        ],
        ["copyrightName": "Preferences: Flexible User Preferences",
         "copyrightType": "Swift Package",
         "copyrightImage": "swift package.png",
         "copyrightHolder": "Sindre Sorhus",
         "copyrightURL": "https://github.com/sindresorhus/Preferences",
         "isInvertable": "yes",
        ],
    ]

    /// Standard override for viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Extract info from the pList and populate the stubs in the About.xib file
        if let appInfo = Bundle.main.infoDictionary {
            copyright.stringValue       = "Telex News makes use of the following third party copyrighted material"                      // Make sure we provide attribution
            appName.stringValue         = appInfo["CFBundleName"] as? String ?? "Error"                                                 // Add App Name from pList
            appCopyright.stringValue    = appInfo["NSHumanReadableCopyright"] as? String ?? "Error"                                     // Add Copyright
            appVersion.stringValue      = "Version: " + Bundle.applicationVersionNumber + "(" + Bundle.applicationBuildNumber + ")"     // Add Version
            appImageView.image          = NSApp.applicationIconImage                                                                    // Add Application Icon
        }
    }
}

// MARK: - Extension
extension AboutController: NSTableViewDataSource, NSTableViewDelegate {
    /// Returns the number of rows that shoudl be displayed by the table
    ///
    /// - Parameter tableView: the TableView in question
    /// - Returns: the number of rows to display
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }

    /// TableView override to format the contents of our cutom row (Note the custom AttributionTableCellView class)
    ///
    /// - Parameters:
    ///   - tableView: the TableView in-question
    ///   - tableColumn: the column to format
    ///   - row: the row to format
    /// - Returns: the fully formatted view (AttributionTableCellView in our case)
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as? AttributionTableCellView else {
            log.error("Cannot display attribution table")
            return nil
        }

        if !tableViewData.isEmpty {
            guard let icon = NSImage(named: NSImage.Name(tableViewData[row]["copyrightImage"]!)) else {
                log.error("Cannot display image: ", tableViewData[row]["copyrightImage"] ?? "N/A")
                return nil
            }

            result.imgView.image                    = (tableViewData[row]["isInvertable"] == "yes") ? icon.smartInvert() : icon
            result.imageView?.toolTip               = tableViewData[row]["copyrightType"] ?? "Error"
            result.summaryTextField.stringValue     = tableViewData[row]["copyrightName"] ?? "Error"
            result.descriptionTextField.stringValue = tableViewData[row]["copyrightHolder"] ?? "Error"
            result.hyperLink.href                   = tableViewData[row]["copyrightURL"] ?? "Error"
        }

        return result
    }
}

/// Custom view for our row (1 Icon and three text fields)
class AttributionTableCellView: NSTableCellView {
    @IBOutlet weak var imgView: NSImageView!
    @IBOutlet weak var summaryTextField: NSTextField!
    @IBOutlet weak var descriptionTextField: NSTextField!
    @IBOutlet weak var hyperLink: QJHyperTextField!
}
