//
//  SelectDaysPerWeekView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/7/25.
//

import SwiftUI

struct SelectDaysPerWeekView: View {
    
    @Binding var selectCategory: CategoryString?
    var onSelect: ((String) -> Void)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("How many days a week do you want to run?")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack(spacing: 20) {
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
    SelectDaysPerWeekView(selectCategory: .constant(CategoryString(id: 1, string: "Test")), onSelect: {_ in})
}
