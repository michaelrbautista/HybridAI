//
//  ProgramDetailView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct ProgramDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel: ProgramDetailViewModel
    
    @State var presentStartProgram = false
    @State var presentPurchaseModal = false
    @State var presentFinishProgram = false
    
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
                .onAppear {
                    Task {
                        await viewModel.getProgram()
                    }
                }
        } else if viewModel.returnedError {
            ErrorView(errorMessage: viewModel.errorMessage)
        } else if viewModel.program == nil {
            Text("You haven't created a program yet.")
                .font(Font.FontStyles.headline)
                .foregroundStyle(Color.ColorSystem.systemGray)
                .listRowSeparator(.hidden)
        } else {
            List {
                // MARK: Title
                Text(viewModel.program!.title)
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .listRowSeparator(.hidden)
                
                // MARK: Workouts
                if let weeks = viewModel.program?.content.weeks {
                    ForEach(weeks, id: \.self) { week in
                        WeekCell(isInSheet: false, weekNumber: week.week, phase: week.phase, days: week.days)
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
                        if viewModel.isStarted {
                            Task {
                                // Finish program
                                presentFinishProgram.toggle()
                            }
                        } else {
                            Task {
                                // Start program
                                viewModel.startProgram()
                                userViewModel.isStarted = true
                            }
                        }
                    } label: {
                        if viewModel.isStarted {
                            Text("Finish")
                        } else {
                            Text("Start")
                        }
                    }
                }
            })
            .alert(Text("Are you sure you want to finish this program?"), isPresented: $presentFinishProgram) {
                Button(role: .destructive) {
                    viewModel.finishProgram()
                    userViewModel.isStarted = false
                    userViewModel.isInProgress = false
                    navigationController.popToRoot()
                } label: {
                    Text("Yes")
                }
            }
//            .sheet(isPresented: $presentStartProgram) {
//                StartProgramView()
//            }
        }
    }
}

#Preview {
    ProgramDetailView(viewModel: ProgramDetailViewModel(programId: "29683f2e-0da1-4eef-9666-09da010789e4"))
}
