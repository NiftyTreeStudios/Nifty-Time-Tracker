//
//  ContentView.swift
//  Shared
//
//  Created by Iiro Alhonen on 08.02.21.
//

import SwiftUI

struct ContentView: View {

    var projects: [Project] = [Project(name: "First", time: 0),
                               Project(name: "Second", time: 231441)]
    
    var body: some View {
        VStack {
            ForEach(projects, id: \.name) { project in
                ProjectView(project: project)
            }
        }.padding()
    }
}
