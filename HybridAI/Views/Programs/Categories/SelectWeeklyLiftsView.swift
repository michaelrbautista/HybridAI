//
//  SelectWeeklyLiftsView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/7/25.
//

import SwiftUI

struct SelectWeeklyLiftsView: View {
    
    @Binding var selectCategory: CategoryString?
    @Binding var goal: String
    var onSelect: ((String) -> Void)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("How many days a week do you want to lift?")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack(spacing: 20) {
                    SelectListRow(
                        text: "1",
                        selection: .constant("")
                    ) {
                        onSelect("1")
                    }
                    
                    SelectListRow(
                        text: "2",
                        selection: .constant("")
                    ) {
                        onSelect("2")
                    }
                    
                    SelectListRow(
                        text: "3",
                        selection: .constant("")
                    ) {
                        onSelect("3")
                    }
                    
                    SelectListRow(
                        text: "4",
                        selection: .constant("")
                    ) {
                        onSelect("4")
                    }
                    
                    if goal == "General strength and endurance" {
                        SelectListRow(
                            text: "5",
                            selection: .constant("")
                        ) {
                            onSelect("5")
                        }
                        
                        SelectListRow(
                            text: "6",
                            selection: .constant("")
                        ) {
                            onSelect("6")
                        }
                    }
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .background(Color.ColorSystem.systemBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        selectCategory = nil
                    } label: {
                        Text("Cancel")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        selectCategory = nil
                    } label: {
                        Text("Done")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
            }
        }
    }
}

#Preview {
    SelectWeeklyLiftsView(selectCategory: .constant(CategoryString(id: 1, string: "Test")), goal: .constant(""), onSelect: {_ in})
}
