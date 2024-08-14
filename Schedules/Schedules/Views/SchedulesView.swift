//
//  SchedulesView.swift
//  TESTCal
//
//  Created by Daniel Mulero on 14/8/24.
//

import SwiftUI

struct SchedulesView: View {
    @EnvironmentObject var store: AppState
    
    var body: some View {
        ScrollView {
            ZStack {
                TimeRulerView()
                
                ForEach(store.schedules, id: \.id) {
                    ScheduleView(model: $0)
                }
            }
        }
        .padding()
    }
}

private struct ScheduleView: View {
    let hourHeight: Double = 50
    let model: Schedule
    @State var isPopoverPresented = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: model.startTime.timePercentage * TimeRulerView.hourHeight)
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.blue.opacity(0.7))
                        .frame(height: (model.endTime.timePercentage - model.startTime.timePercentage) * TimeRulerView.hourHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 2)
                        )
                    Text(model.title)
                }
                .padding(.trailing, 2)
                .padding(.leading, 50)
                .onTapGesture {
                    isPopoverPresented.toggle()
                }
                .popover(isPresented: $isPopoverPresented, arrowEdge: .top, content: {
                    Text("This is a popover")
                        .padding()
                        .presentationCompactAdaptation(.popover)
                })
            }
            Spacer()
        }
    }
}

private struct TimeRulerView: View {
    static let hourHeight: Double = 50
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<24) { index in
                HStack {
                    VStack {
                        Text("\(index):00")
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    
                    VStack {
                        Rectangle()
                            .foregroundStyle(.gray)
                            .frame(height: 1)
                        Spacer()
                    }
                }
                .frame(height: TimeRulerView.hourHeight)
            }
        }
    }
}

private extension Date {
    var timePercentage: Double {
        let hour = Calendar.current.component(.hour, from: self)
        let minute = Calendar.current.component(.minute, from: self)
        
        return Double(hour) + Double(minute)/60
    }
}

#Preview {
    return SchedulesView()
}
