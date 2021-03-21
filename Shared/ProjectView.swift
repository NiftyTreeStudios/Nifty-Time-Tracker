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
