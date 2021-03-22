//
//  ProjectView.swift
//  Nifty Time Tracker
//
//  Created by Iiro Alhonen on 04.02.21.
//

import SwiftUI

struct ProjectView: View {
    var project: Project
    @Binding var projects: [Project]
    
    @State var timerStarted: Bool = false
    @State var seconds: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Binding var editMode: Bool
    
    var body: some View {
        HStack {
            Text(project.name)
            Spacer()
            Text("\(formattedTime(seconds: project.time + seconds))")
                .onReceive(timer) { _ in
                    if timerStarted {
                        seconds += 1
                    }
                }
            Button {
                timerStarted.toggle()
                if !timerStarted {
                    let newTime = project.time + seconds
                    let name = project.name
                    guard let index = projects.firstIndex(of: project) else { return }
                    projects.remove(at: index)
                    projects.append(Project(name: name, time: newTime))
                    projects.sort { $0.name < $1.name }
                    saveProjects(projects)
                    seconds = 0
                }
            } label: {
                if timerStarted {
                    Image(systemName: "pause")
                } else {
                    Image(systemName: "play")
                }
            }.padding()
            .disabled(editMode)
            if editMode {
                Button(action: {
                    guard let index = projects.firstIndex(of: project) else { return }
                    projects.remove(at: index)
                }, label: {
                    Image(systemName: "trash")
                })
            }
        }
    }
}
