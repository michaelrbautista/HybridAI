//
//  StartProgramView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct StartProgramView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var viewModel = StartProgramViewModel()
    
    @State var startDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                VStack(spacing: 5) {
                    Text("Start Program")
                        .font(Font.FontStyles.title1)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                    
                    Text("Select when you’d like to start your program.")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                        .multilineTextAlignment(.center)
                }
                
                // MARK: Date picker
                VStack {
                    DatePicker("Start on:", selection: $startDate, in: Date()..., displayedComponents: .date)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                }
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                
                Button {
                    viewModel.startProgram(startDate: startDate)
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        
                        Text("Start Program")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                        
                        Spacer()
                    }
                    .padding(10)
                }
                .background(Color.ColorSystem.systemBlue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(20)
                
                Spacer()
            }
            .background(Color.ColorSystem.systemBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
            }
        }
    }
}

#Preview {
    StartProgramView()
}
