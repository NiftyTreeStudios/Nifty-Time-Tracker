//
//  AddProject.swift
//  Nifty Time Tracker (iOS)
//
//  Created by Iiro Alhonen on 21.03.21.
//

import SwiftUI

struct AddProject: View {
    
    @Binding var projects: [Project]
    @Binding var addProjectClicked: Bool
    
    @State var projectName: String = ""
    
    var body: some View {
        Form {
            TextField("Enter project name", text: $projectName)
            Button {
                projects.append(Project(name: projectName, time: 0))
                projects.sort { $0.name < $1.name }
                projectName = ""
                saveProjects(projects)
                addProjectClicked = false
            } label: {
                Text("Save")
            }
        }
    }
}
