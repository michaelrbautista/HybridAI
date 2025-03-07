//
//  WorkoutCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

struct WorkoutCell: View {
    
    var text: String
    var action: (() -> Void)
    
    init(text: String, action: @escaping (() -> Void)) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(text)
                    .font(Font.FontStyles.caption1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 10)
                    .foregroundStyle(Color.ColorSystem.systemGray2)
                    .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.ColorSystem.systemGray5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .listRowBackground(Color.ColorSystem.systemRed)
        }
    }
}

#Preview {
    NavigationStack {
        List {
            WorkoutCell(text: "Test") {
                
            }
        }
        .listStyle(.plain)
    }
}
