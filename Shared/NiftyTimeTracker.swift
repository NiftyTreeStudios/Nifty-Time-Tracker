//
//  NiftyTimeTrackerApp.swift
//  Nifty Time Tracker
//
//  Created by Iiro Alhonen on 04.02.21.
//

import SwiftUI

@main
struct NiftyTimeTracker: App {
    
    var body: some Scene {
        #if os(macOS)
        WindowGroup {
            ContentView()
        }
        #elseif os(iOS)
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                iPadContentView()
            } else {
                iOSContentView()
            }
        }
        #endif
    }
}
