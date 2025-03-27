//
//  NewProgramView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/7/25.
//

import SwiftUI

struct NewProgramView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel = NewProgramViewModel()
    
    @State var isLoading = false
    @State var selectCategory: CategoryString?
    
    var body: some View {
        List {
            // MARK: Experience
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 1,
                        string: "Experience"
                    )
                } label: {
                    SelectButton(text: $viewModel.experience)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Experience")
            }
            
            // MARK: Days per week
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 2,
                        string: "Days Per Week"
                    )
                } label: {
                    SelectButton(text: $viewModel.daysPerWeek)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Days Per Week")
            }
            
            // MARK: Multiple time per day
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 3,
                        string: "Multiple Per Day"
                    )
                } label: {
                    SelectButton(text: $viewModel.multiplePerDay)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Multiple Per Day")
            }
            
            // MARK: Long run
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 5,
                        string: "Long Run"
                    )
                } label: {
                    SelectButton(text: $viewModel.longRunDay)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Long Run")
            }
            
            // MARK: Gym access
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 6,
                        string: "Gym Access"
                    )
                } label: {
                    SelectButton(text: $viewModel.hasGymAccess)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Gym Access")
            }
        }
        .navigationTitle("New Program")
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
        .interactiveDismissDisabled()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    navigationController.dismissSheet()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.createGeneralProgram()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        sheetNavigationController.push(.NewlyCreatedProgramView(viewModel: viewModel))
                        viewModel.isCreating = false
                    }
                } label: {
                    if viewModel.isCreating {
                        ProgressView()
                            .tint(Color.ColorSystem.primaryText)
                    } else {
                        Text("Create")
                            .foregroundStyle(viewModel.experience != "" && viewModel.daysPerWeek != "" && viewModel.longRunDay != "" && viewModel.hasGymAccess != "" ? Color.ColorSystem.systemBlue : Color.ColorSystem.systemGray3)
                    }
                }
                .disabled(viewModel.experience == "" || viewModel.daysPerWeek == "" || viewModel.longRunDay == "" || viewModel.hasGymAccess == "" || viewModel.isCreating)
            }
        }
        .sheet(item: $selectCategory, content: { category in
            switch category.string {
            case "Experience":
                SelectExperienceView(selectCategory: $selectCategory) { experience in
                    viewModel.experience = experience
                    selectCategory = nil
                }
            case "Days Per Week":
                SelectDaysPerWeekView(selectCategory: $selectCategory) { days in
                    viewModel.daysPerWeek = days
                    selectCategory = nil
                }
            case "Multiple Per Day":
                SelectMultiplePerDayView(selectCategory: $selectCategory) { multiple in
                    viewModel.multiplePerDay = multiple
                    selectCategory = nil
                }
            case "Long Run":
                SelectLongRunView(selectCategory: $selectCategory) { day in
                    viewModel.longRunDay = day
                    selectCategory = nil
                }
            case "Gym Access":
                SelectGymAccessView(selectCategory: $selectCategory) { access in
                    viewModel.hasGymAccess = access
                    selectCategory = nil
                }
            default:
                Text("Error")
            }
        })
    }
}

struct CategoryString: Identifiable {
    var id: Int
    var string: String
}

#Preview {
    NewProgramView()
}
