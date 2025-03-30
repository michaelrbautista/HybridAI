//
//  GoalTimeInput.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/7/25.
//

import SwiftUI

struct GoalTimeInput: View {
    
    @Binding var hours: String
    @Binding var minutes: String
    
    @State var isNotTrainingForTime = false
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                HStack {
                    TextField("Hours", text: $hours)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .keyboardType(.numberPad)
                        .onChange(of: hours) { oldValue, newValue in
                            isNotTrainingForTime = false
                        }
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
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(":")
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                HStack {
                    TextField("Minutes", text: $minutes)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .keyboardType(.numberPad)
                        .onChange(of: minutes) { oldValue, newValue in
                            isNotTrainingForTime = false
                        }
                }
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Button {
                hours = ""
                minutes = ""
                isNotTrainingForTime = true
            } label: {
                HStack {
                    Text("I'm not training for time")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(isNotTrainingForTime ? Color.ColorSystem.systemBackground : Color.ColorSystem.primaryText)
                        .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    Spacer()
                }
                .background(isNotTrainingForTime ? Color.ColorSystem.primaryText : Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowBackground(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    GoalTimeInput(hours: .constant("10"), minutes: .constant("00"))
}
