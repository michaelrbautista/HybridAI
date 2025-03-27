//
//  SelectMultipleDaysPerWeekView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/15/25.
//

import SwiftUI

struct SelectMultiplePerDayView: View {
    
    @Binding var selectCategory: CategoryString?
    var onSelect: ((String) -> Void)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Do you want to train multiple times a day?")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack(spacing: 20) {
                    SelectListRow(
                        text: "Yes",
                        selection: .constant("")
                    ) {
                        onSelect("Yes")
                    }
                    
                    SelectListRow(
                        text: "No",
                        selection: .constant("")
                    ) {
                        onSelect("No")
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
    SelectMultiplePerDayView(selectCategory: .constant(CategoryString(id: 1, string: "Test")), onSelect: {_ in})
}
