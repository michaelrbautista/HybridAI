//
//  NewNutritionPlanView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/10/25.
//

import SwiftUI

struct NewNutritionPlanView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel = NewNutritionPlanViewModel()
    
    @State var isLoading = false
    @State var selectCategory: CategoryString?
    
    var body: some View {
        NavigationStack {
            List {
                // MARK: Gender
                Section {
                    Button {
                        selectCategory = CategoryString(
                            id: 1,
                            string: "Gender"
                        )
                    } label: {
                        SelectButton(text: $viewModel.gender)
                    }
                    .listRowBackground(Color.ColorSystem.systemGray6)
                } header: {
                    Text("Gender")
                }
                
                // MARK: Age
                Section {
                    HStack {
                        TextField("Age", text: $viewModel.age)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItem(placement: .keyboard) {
                                    HStack {
                                        Spacer()
                                        Button("Done") {
                                            hideKeyboard()
                                        }
                                    }
                                }
                            }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.ColorSystem.systemGray6)
                } header: {
                    Text("Age")
                }
                
                // MARK: Height
                Section {
                    HStack {
                        TextField("Height", text: $viewModel.height)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .keyboardType(.numberPad)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.ColorSystem.systemGray6)
                } header: {
                    Text("Height (inches)")
                }
                
                // MARK: Weight
                Section {
                    HStack {
                        TextField("Weight", text: $viewModel.weight)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .keyboardType(.numberPad)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.ColorSystem.systemGray6)
                } header: {
                    Text("Weight (lbs)")
                }
            }
            .navigationTitle("Nutrition Plan")
            .navigationBarTitleDisplayMode(.inline)
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
                        // Create nutrition plan
                        viewModel.calculateBMR()
                        
                        // Dismiss sheet
                        navigationController.dismissSheet()
                    } label: {
                        Text("Create")
                            .foregroundStyle(
                                viewModel.gender != "" &&
                                viewModel.age != "" &&
                                viewModel.height != "" &&
                                viewModel.weight != "" ?
                                Color.ColorSystem.systemBlue :
                                    Color.ColorSystem.systemGray3
                            )
                    }
                    .disabled(viewModel.gender == "" ||
                              viewModel.age == "" ||
                              viewModel.height == "" ||
                              viewModel.weight == "")
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.ColorSystem.systemBackground)
        }
        .sheet(item: $selectCategory, content: { category in
            switch category.string {
            case "Sex":
                Text("Sex")
                SelectGenderView(selectCategory: $selectCategory) { gender in
                    viewModel.gender = gender
                    selectCategory = nil
                }
            default:
                Text("Error")
            }
        })
    }
}

#Preview {
    NewNutritionPlanView()
}
