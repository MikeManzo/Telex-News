//
//  NSImage+Extensions.swift
//  Telex News
//
//  Created by Mike Manzo on 8/24/19.
//  Copyright © 2019 Quantum Joker. All rights reserved.
//

import Cocoa
import Foundation

extension NSImage {
    /// Static helper function to invert an image if we are in Dark Mode
    ///
    /// - Returns: *new* NSImage if we have inverted the original
    ///
    static func smartInvert(asset: String) -> NSImage? {
        guard let image = NSImage(named: asset) else {
            return nil
        }
        if NSApplication.isDark() {
            return image.filter(filter: "CIColorInvert")
        } else {
            return image
        }
    }

    ///  Helper function to invert an image if we are in Dark Mode
    ///
    /// - Returns: *new* NSImage if we have inverted the original
    ///
    func smartInvert() -> NSImage? {
        if NSApplication.isDark() {
            return filter(filter: "CIColorInvert")
        } else {
            return self
        }
    }

    /// Filter a valid image
    ///
    /// - Returns: *new* NSImage if filter was successful
    ///
    func filter(filter: String) -> NSImage? {
        let image = CIImage(data: (self.tiffRepresentation!))

            if let filter = CIFilter(name: filter) {
                filter.setDefaults()
                filter.setValue(image, forKey: kCIInputImageKey)

                let context = CIContext(options: [CIContextOption.useSoftwareRenderer: true])
                return autoreleasepool { () -> NSImage? in
                    guard let imageRef = context.createCGImage(filter.outputImage!, from: image!.extent) else {
                        context.clearCaches()
                        context.reclaimResources()
                        return nil
                    }
                    context.clearCaches()
                    context.reclaimResources()
                    return NSImage(cgImage: imageRef, size: NSSize(width: 0, height: 0))
                }
            } else {
                return nil
            }
    }

    /// Hhelper function to resize an image if we are in Dark Mode
    ///
    /// - Returns: *new* NSImage if we have resized the original
    ///
    func resize(to newSize: NSSize) -> NSImage? {
        if let bitmapRep = NSBitmapImageRep(
            bitmapDataPlanes: nil, pixelsWide: Int(newSize.width), pixelsHigh: Int(newSize.height),
            bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
            colorSpaceName: .calibratedRGB, bytesPerRow: 0, bitsPerPixel: 0
            ) {
            bitmapRep.size = newSize
            NSGraphicsContext.saveGraphicsState()
            NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmapRep)
            draw(in: NSRect(x: 0, y: 0, width: newSize.width, height: newSize.height), from: .zero, operation: .copy, fraction: 1.0)
            NSGraphicsContext.restoreGraphicsState()

            let resizedImage = NSImage(size: newSize)
            resizedImage.addRepresentation(bitmapRep)
            return resizedImage
        }

        return nil
    }
}
