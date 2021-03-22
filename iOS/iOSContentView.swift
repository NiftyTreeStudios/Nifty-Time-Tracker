//
//  iOSContentView.swift
//  Nifty Time Tracker (iOS)
//
//  Created by Iiro Alhonen on 21.03.21.
//

import SwiftUI

struct iOSContentView: View {
    
    @State var projects: [Project] = []
    
    @State private var addButtonClicked: Bool = false
    
    @State private var editMode: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
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
                    Spacer()
                    Button(action: {
                        addButtonClicked.toggle()
                    }, label: {
                        ZStack{
                            Circle().frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Image(systemName: "plus").foregroundColor(.white).font(.title)
                        }
                    })
                }
            }
            .sheet(isPresented: $addButtonClicked, content: {
                AddProject(projects: $projects, addProjectClicked: $addButtonClicked)
            })
            .onAppear {
                projects = loadProjects()
            }
            .navigationBarTitle("Nifty Time Tracker")
            .toolbar(content: {
                Button(action: {
                    editMode.toggle()
                }, label: {
                    Image(systemName: "pencil")
                })
            })
        }.padding(.bottom, 10)
    }
}
