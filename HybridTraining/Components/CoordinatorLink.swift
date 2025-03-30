//
//  CoordinatorLink.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/19/25.
//

import SwiftUI

struct CoordinatorLink<Label: View>: View {
    
    var label: Label
    var action: (() -> Void)
    
    init(@ViewBuilder label: () -> Label, action: @escaping (() -> Void)) {
        self.label = label()
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                label
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 12)
                    .foregroundStyle(Color.ColorSystem.systemGray2)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            NavigationLink {
                EmptyView()
            } label: {
                Text("Test")
            }
            
            CoordinatorLink {
                Text("Test")
            } action: {
                
            }

        }
        .listStyle(.plain)
    }
}
