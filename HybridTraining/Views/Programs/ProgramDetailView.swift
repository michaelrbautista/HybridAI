//
//  ProgramDetailView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import SuperwallKit

struct ProgramDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var presentStartProgram = false
    @State var presentPurchaseModal = false
    @State var presentFinishProgram = false
    
    var body: some View {
        List {
            // MARK: Title
            Text(userViewModel.program?.title ?? "")
                .font(Font.FontStyles.title1)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .listRowSeparator(.hidden)
            
            // MARK: Workouts
            if userViewModel.isSubscribed {
                if let weeks = userViewModel.program?.content.weeks {
                    ForEach(weeks, id: \.self) { week in
                        WeekCell(isInSheet: false, weekNumber: week.week, phase: week.phase, days: week.days)
                    }
                }
            } else {
                if let weekOne = userViewModel.program?.content.weeks[0] {
                    WeekCell(isInSheet: false, weekNumber: weekOne.week, phase: weekOne.phase, days: weekOne.days)
                    
                    HStack {
                        Text("Subscribe to unlock the rest of your program.")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.ColorSystem.systemBackground)
                    
                    Rectangle()
                        .frame(height: 40)
                        .foregroundStyle(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.ColorSystem.systemBackground)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if userViewModel.isStarted {
                        Task {
                            // Finish program
                            presentFinishProgram.toggle()
                        }
                    } else {
                        Task {
                            // Start program
                            userViewModel.startProgram()
                            userViewModel.isStarted = true
                        }
                    }
                } label: {
                    if userViewModel.isStarted {
                        Text("Finish")
                    } else {
                        Text("Start")
                    }
                }
            }
        })
        .alert(Text("Are you sure you want to finish this program?"), isPresented: $presentFinishProgram) {
            Button(role: .destructive) {
                userViewModel.finishProgram()
                userViewModel.isStarted = false
                userViewModel.isInProgress = false
                navigationController.popToRoot()
            } label: {
                Text("Yes")
            }
        }
    }
}

#Preview {
    ProgramDetailView()
}
