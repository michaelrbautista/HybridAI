//
//  LoggedInView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/19/25.
//

import SwiftUI

struct LoggedInView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        TabView {
            TrainingCoordinatorView()
                .tabItem {
                    Image(systemName: "figure.run")
                }
                .environmentObject(userViewModel)
            
            SettingsCoordinatorView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
                .environmentObject(userViewModel)
        }
        .tint(Color.ColorSystem.primaryText)
    }
}

#Preview {
    LoggedInView()
        .environmentObject(UserViewModel())
}
