//
//  ContentView.swift
//  Shared
//
//  Created by Iiro Alhonen on 08.02.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            ProjectView(project: Project(name: "First", time: 0))
            ProjectView(project: Project(name: "Second", time: 231441))
        }.padding()
    }
}
