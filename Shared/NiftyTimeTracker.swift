//
//  NiftyTimeTrackerApp.swift
//  Nifty Time Tracker
//
//  Created by Iiro Alhonen on 04.02.21.
//

import SwiftUI

@main
struct testApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
//
//
//@main
//struct Nifty_Time_TrackerApp: App {
//    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        #if os(macOS)
//        Settings {
//            ContentView()
//        }
//        #endif
//    }
//
//    class AppDelegate: NSObject, NSApplicationDelegate {
//        var popover = NSPopover.init()
//        var statusBarItem: NSStatusItem?
//        @State var projects: [Project] = []
//
//        func applicationDidFinishLaunching(_ notification: Notification) {
//
//            let contentView = ContentView()
//            // Set the SwiftUI's ContentView to the Popover's ContentViewController
//            popover.behavior = .transient // !!! - This does not seem to work in SwiftUI2.0 or macOS BigSur yet
//            popover.animates = false
//            popover.contentViewController = NSViewController()
//            popover.contentViewController?.view = NSHostingView(rootView: contentView)
//
//            statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
//            statusBarItem?.button?.title = "Nifty Time Tracker"
//            statusBarItem?.button?.action = #selector(AppDelegate.togglePopover(_:))
//        }
//        @objc func showPopover(_ sender: AnyObject?) {
//            if let button = statusBarItem?.button {
//                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//            }
//        }
//        @objc func closePopover(_ sender: AnyObject?) {
//            popover.performClose(sender)
//        }
//        @objc func togglePopover(_ sender: AnyObject?) {
//            if popover.isShown {
//                closePopover(sender)
//            } else {
//                showPopover(sender)
//            }
//        }
//    }
//}
