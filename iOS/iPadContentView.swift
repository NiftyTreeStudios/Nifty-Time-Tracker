//
//  iPadContentView.swift
//  Nifty Time Tracker (iOS)
//
//  Created by Iiro Alhonen on 21.03.21.
//

import SwiftUI

struct iPadContentView: View {
    
    @State var projects: [Project] = []
    
    @State private var addButtonClicked: Bool = false
    
    @State private var editMode: Bool = false
    
    var body: some View {
            ZStack {
                VStack {
                    Text("Nifty Time Tracker")
                        .font(.largeTitle)
                    if projects.isEmpty {
                        Text("No projects")
                    } else {
                        Form {
                            ForEach(projects, id: \.name) { project in
                                ProjectView(project: project, projects: $projects, editMode: $editMode)
                            }
                        }
                    }
                }
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            editMode.toggle()
                        }, label: {
                            Image(systemName: "pencil")
                                .font(.title)
                        }).padding()
                    }
                    
                    Spacer()
                    Button(action: {
                        addButtonClicked.toggle()
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }).padding()
                }
            }
            .sheet(isPresented: $addButtonClicked, content: {
                AddProject(projects: $projects, addProjectClicked: $addButtonClicked)
            })
            .onAppear {
                projects = loadProjects()
            }
    }
}
