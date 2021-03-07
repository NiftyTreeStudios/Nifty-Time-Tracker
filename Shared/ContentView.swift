//
//  ContentView.swift
//  Shared
//
//  Created by Iiro Alhonen on 08.02.21.
//

import SwiftUI

struct ContentView: View {

    @State var projects: [Project] = []
    
    @State var projectName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter project name", text: $projectName)
                Button {
                    projects.append(Project(name: projectName, time: 0))
                    projects.sort { $0.name < $1.name }
                    projectName = ""
                    saveProjects(projects)
                } label: {
                    Text("Save")
                }

            }
            ForEach(projects, id: \.name) { project in
                ProjectView(project: project, projects: $projects)
            }
        }.padding()
        .onAppear {
            projects = loadProjects()
        }
    }
}
