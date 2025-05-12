//
//  WindowSizeLimiter.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI

#if os(macOS)
public struct WindowSizeSetter: NSViewRepresentable {
    public var minSize: CGSize
    public var maxSize: CGSize

    public init(minSize: CGSize = CGSize(width: 600, height: 400),
                maxSize: CGSize = CGSize(width: 1200, height: 800)) {
        self.minSize = minSize
        self.maxSize = maxSize
    }

    public func makeNSView(context: Context) -> NSView {
        // A transparent view that we attach to the hierarchy
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        return view
    }

    public func updateNSView(_ nsView: NSView, context: Context) {
        // Delay so that the view is in a window
        DispatchQueue.main.async {
            if let window = nsView.window {
                window.minSize = minSize
                window.maxSize = maxSize
            }
        }
    }
}
#endif
