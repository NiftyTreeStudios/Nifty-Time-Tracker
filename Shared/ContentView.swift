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


////
////  ContentView.swift
////  Nifty Time Tracker
////
////  Created by Iiro Alhonen on 04.02.21.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    let defaults = UserDefaults.standard
//
//    @State var projects: [Project] = []
//    @State var editMode: Bool = false
//    @State var projectName: String = ""
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Nifty Time Tracker")
//                    .font(.headline)
//                Button {
//                    editMode.toggle()
//                    if !editMode {
//                        save(projects, forKey: "Projects")
//                        print("Saved \(projects)")
//                    }
//                } label: {
//                    Image(systemName: editMode ? "xmark"
//                                               : "pencil")
//                }
//            }
//            if editMode {
//                Divider()
//                HStack {
//                    TextField("Enter project name", text: $projectName)
//                    Button {
//                        projects.append(Project(name: projectName, time: 0))
//                        projects.sort { $0.name < $1.name }
//                        projectName = ""
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//
//                }
//                Divider()
//            } else {
//                Divider()
//            }
//            ForEach(projects, id: \.name) { project in
//                HStack {
//                    if editMode {
//                        Button {
//                            guard let index = projects.firstIndex(of: project) else {
//                                return
//                            }
//                            projects.remove(at: index)
//                            save(projects, forKey: "Projects")
//                        } label: {
//                            Image(systemName: "trash")
//                        }
//                    }
//                    ProjectView(project: project, projects: $projects)
//                }
//            }
//            HStack {
//                Button(action: {
//
//                }, label: {
//                    Text("Settings")
//                })
//                Button(action: {
//                    NSApplication.shared.terminate(self)
//                }, label: {
//                    Text("Quit")
//                })
//            }
//        }.padding()
//        .onAppear {
//            projects = load(forKey: "Projects")
//        }
//    }
//}
