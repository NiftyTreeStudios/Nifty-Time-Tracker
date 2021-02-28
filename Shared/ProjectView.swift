//
//  ProjectView.swift
//  Nifty Time Tracker
//
//  Created by Iiro Alhonen on 04.02.21.
//

import SwiftUI

struct ProjectView: View {
    let project: Project
    
    @State var timerStarted: Bool = false
    @State var seconds: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Text(project.name)
            Spacer()
            Text("\(project.time + seconds) seconds")
                .onReceive(timer) { _ in
                    if timerStarted {
                        seconds += 1
                    }
                }
            Button {
                timerStarted.toggle()
                print("button pressed")
            } label: {
                Text("Button")
            }

        }
    }
}

//struct ProjectView: View {
//    var project: Project
//    @Binding var projects: [Project]

//            Spacer()
//            Text("\(formattedTime(time: secondsToHoursMinutesSeconds(seconds: project.time + seconds)))")
//                .onReceive(timer) { _ in
//                    if timerStarted {
//                        seconds += 1
//                    }
//                }
//            Button {
//                timerStarted.toggle()
//                if !timerStarted {
//                    let newTime = project.time + seconds
//                    let name = project.name
//                    guard let index = projects.firstIndex(of: project) else {
//                        return
//                    }
//                    projects.remove(at: index)
//                    projects.append(Project(name: name, time: newTime))
//                    projects.sort { $0.name < $1.name }
//                    save(projects, forKey: "Projects")
//                    seconds = 0
//                }
//            } label: {
//                Image(systemName: timerStarted ? "pause"
//                                               : "play")
//            }
//
//        }
//    }
//}
