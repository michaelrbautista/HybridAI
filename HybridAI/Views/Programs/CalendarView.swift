//
//  CalendarView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var currentPage = 1
    @State var isEnd = false
    
    var weeks: Int
    var pages: Int
    
    var days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    
    @State var selectedDay = (1, "sunday")
    @State var selectedWorkouts = [Workout]()
    
    func calculateStartWeek() -> Int {
        return 1 + (4 * (currentPage - 1))
    }
    
    func calculateEndWeek() -> Int {
        return 4 + (4 * (currentPage - 1))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10) {
                // MARK: Week selector
                HStack(alignment: .center) {
                    Button {
                        currentPage -= 1
                        
                        if currentPage < pages {
                            isEnd = false
                        }
                        
                        // Set selected day
                        selectedDay = (calculateStartWeek(), "sunday")
                        
                        // Set selected day's workouts
                        setSelectedWorkouts()
                    } label: {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "chevron.left")
                                .foregroundStyle(currentPage == 1 ? Color.ColorSystem.systemGray3 : Color.ColorSystem.primaryText)
                            
                            Spacer()
                        }
                        .frame(width: 40, height: 30)
                    }
                    .buttonStyle(.plain)
                    .disabled(currentPage == 1)
                    
                    Spacer()
                    
                    Text("Weeks \(calculateStartWeek()) - \(calculateEndWeek())")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                    
                    Spacer()
                    
                    Button {
                        currentPage += 1
                        
                        if currentPage >= pages {
                            isEnd = true
                        }
                    
                        // Set selected day
                        selectedDay = (calculateStartWeek(), "sunday")
                        
                        // Set selected day's workouts
                        setSelectedWorkouts()
                    } label: {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(isEnd ? Color.ColorSystem.systemGray3 : Color.ColorSystem.primaryText)
                            
                            Spacer()
                        }
                        .frame(width: 40, height: 30)
                    }
                    .buttonStyle(.plain)
                    .disabled(isEnd)
                }
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                // MARK: Calendar
                ForEach(calculateStartWeek()...calculateEndWeek(), id: \.self) { week in
                    HStack(alignment: .center) {
                        Text(String(week))
                            .frame(width: 24)
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.systemGray5)
                        
                        ForEach(days, id: \.self) { day in
                            if (isEnd && week > weeks) {
                                Text(day.prefix(1).capitalized)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .font(Font.FontStyles.headline)
                                    .foregroundStyle(Color.ColorSystem.systemGray5)
                                    .background(Color.ColorSystem.systemBackground)
                            } else {
                                Text(day.prefix(1).capitalized)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .font(Font.FontStyles.headline)
                                    .foregroundStyle(Color.ColorSystem.primaryText)
                                    .background(selectedDay == (week, day) ? Color.ColorSystem.systemGray3 : Color.ColorSystem.systemBackground)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        selectedDay = (week, day)
                                        
                                        // Set selected day's workouts
                                        setSelectedWorkouts()
                                    }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            
            // MARK: Workouts
            DayView(
                workouts: $selectedWorkouts
            )
        }
        .onAppear {
            if currentPage == pages {
                isEnd = true
            }
        }
    }
    
    func setSelectedWorkouts() {
//        var daysWorkouts = [Workout]()
//        for week in userViewModel.program!.content.weeks {
//            if week.id == selectedDay.0 {
//                for day in week.days {
//                    if day.id == selectedDay.1 {
//                        daysWorkouts.append(contentsOf: day.workouts)
//                    }
//                }
//            }
//        }
//        selectedWorkouts = daysWorkouts
    }
}

#Preview {
    CalendarView(weeks: 5, pages: 4)
}
