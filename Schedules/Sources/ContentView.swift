//
//  ContentView.swift
//  Schedules
//
//  Created by Daniel Mulero on 14/8/24.
//

import SwiftUI

struct ContentView: View {
    var appState: AppState = AppState()
    @State var isPopoverPresented = false
    
    var body: some View {
        NavigationStack {
            SchedulesView()
                .navigationTitle("Schedules")
            #if os(iOS)
                .navigationBarTitleDisplayMode(.inline)
            #endif
                .toolbar {
                    Button("Add") {
                        isPopoverPresented.toggle()
                    }
                }
                .popover(isPresented: $isPopoverPresented, arrowEdge: .top, content: {
                    AddNewSchedule()
                })
        }
        .environmentObject(appState)
    }
}

#Preview {
    let calendar = Calendar.current
    
    let startTime = calendar.date(bySettingHour: 8, minute: 35, second: 0, of: .now)!
    let endTime = calendar.date(bySettingHour: 9, minute: 50, second: 0, of: .now)!
    
    let schedules = [
        Schedule(id: "0", startTime: startTime, endTime: endTime, title: "Work in UITests"),
    ]
    
    let appState = AppState()
    appState.schedules = schedules
    
    return ContentView(appState: appState)
}
